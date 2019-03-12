package com.purdynet

/**
  * Created by dnpurdy on 2/18/15.
  */
object Create extends App {
  val outDir = "/Users/david.purdy/resume"

  val htmlCreator = new HtmlCreator(outDir)
  htmlCreator.create()

  val fopCreator = new FopCreator(outDir)
  fopCreator.createPdf()
  fopCreator.createTxt()
  fopCreator.createRtf()
  fopCreator.createFo()
}
