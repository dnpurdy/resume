package com.purdynet

import java.io._
import javax.xml.transform._
import javax.xml.transform.sax.SAXResult
import javax.xml.transform.stream.{StreamResult, StreamSource}

import org.apache.commons.io.{FileUtils, IOUtils}
import org.apache.fop.apps.{Fop, FopConfParser, FopFactory, FopFactoryBuilder}
import org.apache.xmlgraphics.util.MimeConstants

/**
  * Created by dnpurdy on 2/18/15.
  */
object Create extends App {

  def createPdfViaFop(outDir: String, t: String, ext: String) = {
    /*val xconf = new File(this.getClass.getClassLoader.getResource("conf/fop.xconf").getPath)
    val parser = new FopConfParser(xconf) //parsing configuration
    def builder = parser.getFopFactoryBuilder(); //building the factory with the user options*/
    def fopFactory = FopFactory.newInstance(new File(".").toURI())
    val foUserAgent = fopFactory.newFOUserAgent()
    val out: OutputStream = new BufferedOutputStream(new FileOutputStream(new File(outDir+"/resume"+ext)))


    try {
      val fop = fopFactory.newFop(t, foUserAgent, out)
      // Step 4: Setup JAXP using identity transformer
      val factory = TransformerFactory.newInstance()
      val xslt = new StreamSource(getClass.getResourceAsStream("/xslt/pdf_xform.xsl"))
      val transformer = factory.newTransformer(xslt)

      transformer.setParameter("versionParam", "2.0")

      val src = new StreamSource(getClass.getResourceAsStream("/xml/resume.xml"))
      // Resulting SAX events (the generated FO) must be piped through to FOP
      val res = new SAXResult(fop.getDefaultHandler)

      transformer.transform(src, res)

    } finally {
      //Clean-up
      out.close()
    }
  }

  @throws(classOf[IOException])
  @throws(classOf[TransformerException])
  def convertXML2FO(outDir: String, t: String, ext: String) {
    val out: OutputStream = new BufferedOutputStream(new FileOutputStream(new File(outDir+"/resume"+ext)))

    try {
      //Setup XSLT
      val factory: TransformerFactory = TransformerFactory.newInstance()
      val xslt = new StreamSource(getClass.getResourceAsStream("/xslt/pdf_xform.xsl"))
      val transformer: Transformer = factory.newTransformer(xslt)

      //Setup input for XSLT transformation
      val src = new StreamSource(getClass.getResourceAsStream("/xml/resume.xml"))

      //Resulting SAX events (the generated FO) must be piped through to FOP
      val res: Result = new StreamResult(out)

      //Start XSLT transformation and FOP processing
      transformer.transform(src, res);
    } finally {
      out.close()
    }
  }

  override def main(args: Array[String]): Unit = {
    val outDir = "/tmp/resume"

    createHtml(outDir)

//    createPdfViaFop(outDir, MimeConstants.MIME_PDF, ".pdf")
 //   convertXML2FO(outDir, MimeConstants.MIME_XSL_FO, ".fo")
  //  createPdfViaFop(outDir, MimeConstants.MIME_PLAIN_TEXT, ".txt")
  //  createPdfViaFop(outDir, MimeConstants.MIME_RTF, ".rtf")
  }

  def createHtml(outDir: String): Unit = {
    val fac = TransformerFactory.newInstance()
    val xform = fac.newTransformer(new StreamSource(getClass.getResourceAsStream("/xslt/html/html_xform.xsl")))
    xform.transform(new StreamSource(getClass.getResourceAsStream("/xml/resume.xml")), new StreamResult(new File(outDir + "/resume.html")))

    // CSS
    copyResourceFile(outDir, "/css", "/style.css")
    // IMAGES
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
