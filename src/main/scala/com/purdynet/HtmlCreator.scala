package com.purdynet

import java.io.{File, FileOutputStream}

import javax.xml.transform.stream.{StreamResult, StreamSource}
import javax.xml.transform.{OutputKeys, TransformerFactory}
import org.apache.commons.io.{FileUtils, IOUtils}

class HtmlCreator(outDir: String) {
  val xslSourceFilename = "/xslt/html/html_xform.xsl"
  val xmlSourceFilename = "/xml/resume.xml"

  def create(): Unit = {
    val fac = TransformerFactory.newInstance()
    val xform = fac.newTransformer(new StreamSource(getClass.getResourceAsStream(xslSourceFilename)))
    xform.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes")
    xform.transform(new StreamSource(getClass.getResourceAsStream(xmlSourceFilename)), new StreamResult(new File(outDir + "/resume.html")))

    // CSS
    copyResourceFile(outDir, "/css", "/style.css")
  }

  def copyResourceFile(outputDir: String, parentPath: String, file: String): Unit = {
    FileUtils.forceMkdir(new File(outputDir + parentPath))
    IOUtils.copy(getClass.getResourceAsStream(parentPath+file), new FileOutputStream(new File(outputDir+parentPath+file)))
  }
}
