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
        final CommandLineParser parser = new DefaultParser();
        final CommandLine cmd = parser.parse(getOptions(), args);

        final String outDir = validateOutDir(cmd);

        HtmlCreator.create(outDir);
        FopCreator.createPdf(outDir);
        FopCreator.createTxt(outDir);
        FopCreator.createRtf(outDir);
        FopCreator.createFo(outDir);
    }

    private static String validateOutDir(final CommandLine cmd) {
        if (!cmd.hasOption("o")) {
            throw new IllegalArgumentException("No outdir!");
        } else {
            return cmd.getOptionValue("o");
        }
    }

    private Options getOptions() {
        Options options = new Options();
        options.addOption("o", true, "output directory");
        return options;
    }
}
