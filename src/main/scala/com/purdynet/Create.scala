package com.purdynet

import java.io.{BufferedOutputStream, File, FileOutputStream, OutputStream}
import javax.xml.transform.TransformerFactory
import javax.xml.transform.sax.SAXResult
import javax.xml.transform.stream.{StreamResult, StreamSource}

import org.apache.commons.io.{FileUtils, IOUtils}
import org.apache.fop.apps.FopFactory
import org.apache.xmlgraphics.util.MimeConstants

/**
 * Created by dnpurdy on 2/18/15.
 */
object Create extends App {

  def createPdfViaFop(outDir: String) = {
    val fopFactory = FopFactory.newInstance()
    val out: OutputStream = new BufferedOutputStream(new FileOutputStream(new File(outDir+"/myfile.pdf")))

    try {
      // Step 3: Construct fop with desired output format
      val fop = fopFactory.newFop(MimeConstants.MIME_PDF, out)

      // Step 4: Setup JAXP using identity transformer
      val factory = TransformerFactory.newInstance()
      val xslt = new StreamSource(getClass.getResourceAsStream("/xslt/pdf_xform.xsl"))
      val transformer = factory.newTransformer(xslt)

      // Step 5: Setup input and output for XSLT transformation
      // Setup input stream
      val src = new StreamSource(getClass.getResourceAsStream("/xml/resume.xml"))

      // Resulting SAX events (the generated FO) must be piped through to FOP
      val res = new SAXResult(fop.getDefaultHandler())

      // Step 6: Start XSLT transformation and FOP processing
      transformer.transform(src, res)

    } finally {
      //Clean-up
      out.close()
    }
  }

  override def main(args: Array[String]): Unit = {
    val outDir = "/tmp/resume"

    //createHtml(outDir)

    createPdfViaFop(outDir)
  }

  def createHtml(outDir: String): Unit = {
    val fac = TransformerFactory.newInstance()
    val xform = fac.newTransformer(new StreamSource(getClass.getResourceAsStream("/xslt/html_xform.xsl")))
    xform.transform(new StreamSource(getClass.getResourceAsStream("/xml/resume.xml")), new StreamResult(new File(outDir + "/resume.html")))

    // CSS
    copyResourceFile(outDir, "/css", "/style.css")
    // IMAGES
    copyResourceFile(outDir, "/images", "/photo.jpg")
    copyResourceFile(outDir, "/images", "/bg-perpendicular.png")
    copyResourceFile(outDir, "/images", "/hover-1.gif")
    copyResourceFile(outDir, "/images", "/separation.png")
    copyResourceFile(outDir, "/images", "/social.png")
  }

  def copyResourceFile(outputDir: String, parentPath: String, file: String) = {
    FileUtils.forceMkdir(new File(outputDir + parentPath))
    IOUtils.copy(getClass.getResourceAsStream(parentPath+file), new FileOutputStream(new File(outputDir+parentPath+file)))
  }
}
