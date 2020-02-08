package com.purdynet;

import org.apache.fop.apps.FOPException;

import javax.xml.transform.TransformerException;
import java.io.IOException;

public class CreateResume {
    /**
     * Runs the application
     *
     * @param args an array of String arguments to be parsed
     */
    public void run(final String[] args) throws TransformerException, IOException, FOPException {
        final String outDir = "/Users/david.purdy/resume";

        HtmlCreator htmlCreator = new HtmlCreator(outDir);
        htmlCreator.create();

        FopCreator fopCreator = new FopCreator(outDir);
        fopCreator.createPdf();
        fopCreator.createTxt();
        fopCreator.createRtf();
        fopCreator.createFo();
    }
}
