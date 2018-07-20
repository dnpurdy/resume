package com.purdynet

/**
  * Created by dnpurdy on 2/18/15.
  */
class Create(outDir: String) {
  def run(): Unit = {
    val htmlCreator = new CreateHtml(outDir)
    htmlCreator.create()

    val fopCreator = new CreateFop(outDir)
    fopCreator.createPdf()
    fopCreator.createTxt()
    fopCreator.createRtf()

    fopCreator.createFo()
  }
}

object Create extends App {
  val createResume = new Create("/tmp/resume")
  createResume.run()
}
