package com.purdynet

import java.io._

import javax.xml.transform.sax.SAXResult
import javax.xml.transform.stream.{StreamResult, StreamSource}
import javax.xml.transform.{Result, Transformer, TransformerFactory}
import org.apache.fop.apps.FopFactory
import org.apache.xmlgraphics.util.MimeConstants

class CreateFop(outDir: String) {
  val documentPrefix = "DavidPurdy-resume"
  val xslSourceFilename = "/xslt/pdf_xform.xsl"
  val xmlSourceFilename = "/xml/resume.xml"

  def createPdf(): Unit = {
    create(fopResult(MimeConstants.MIME_PDF, genOutputputStream(".pdf")))
  }

  def createTxt(): Unit = {
    create(fopResult(MimeConstants.MIME_PLAIN_TEXT, genOutputputStream(".txt")))
  }

  def createRtf(): Unit = {
    create(fopResult(MimeConstants.MIME_RTF, genOutputputStream(".rtf")))
  }

  def createFo(): Unit = {
    val out = genOutputputStream(".fo")
    create(foResult(out), out)
  }

  def create(o: (Result, OutputStream)): Unit = {
    try {
      transform(o._1)
    } finally {
      o._2.close()
    }
  }

  private def fopResult(outputType: String, out: OutputStream): (Result, OutputStream) = {
    val fopFactory = FopFactory.newInstance(new File(".").toURI)
    val fop = fopFactory.newFop(outputType, fopFactory.newFOUserAgent(), out)
    (new SAXResult(fop.getDefaultHandler), out)
  }

  private def foResult(out: OutputStream): StreamResult = {
    new StreamResult(out)
  }

  private def transform(res: Result): Unit = {
    val src = createSource(xmlSourceFilename)
    val transformer = createTransformer(xslSourceFilename)
    transformer.transform(src, res)
  }

  private def createSource(xmlPath: String): StreamSource = {
    new StreamSource(getClass.getResourceAsStream(xmlPath))
  }

  private def createTransformer(xslSource: String): Transformer = {
    val factory = TransformerFactory.newInstance()
    val xslt = new StreamSource(getClass.getResourceAsStream(xslSource))
    val transformer = factory.newTransformer(xslt)
    transformer.setParameter("versionParam", "2.0")

    transformer
  }

  private def genOutputputStream(ext: String) = {
    new BufferedOutputStream(new FileOutputStream(new File(genFileName(outDir, ext))))
  }

  private def genFileName(outDir: String, ext: String): String = {
    outDir + "/" + documentPrefix + ext
  }
}
