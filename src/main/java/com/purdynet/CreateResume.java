package com.purdynet;

import org.apache.commons.cli.*;
import org.apache.fop.apps.FOPException;

import javax.xml.transform.TransformerException;
import java.io.IOException;

public class CreateResume {
    /**
     * Runs the application
     *
     * @param args an array of String arguments to be parsed
     */
    public void run(final String[] args) throws TransformerException, IOException, FOPException, ParseException {
        Options options = new Options();
        options.addOption("o", true, "display current time");
        CommandLineParser parser = new DefaultParser();
        CommandLine cmd = parser.parse( options, args);

        if (cmd.hasOption("o")) {
            final String outDir = cmd.getOptionValue("o");

            HtmlCreator htmlCreator = new HtmlCreator(outDir);
            htmlCreator.create();

            FopCreator fopCreator = new FopCreator(outDir);
            fopCreator.createPdf();
            fopCreator.createTxt();
            fopCreator.createRtf();
            fopCreator.createFo();
        } else {
            throw new IllegalArgumentException("No outdir!");
        }
    }
}
