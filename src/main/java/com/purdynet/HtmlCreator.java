package com.purdynet;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class HtmlCreator {
    private final String xslSourceFilename = "/xslt/html/html_xform.xsl";
    private final String xmlSourceFilename = "/xml/resume.xml";

    private final String outDir;

    public HtmlCreator(final String outDir) {
        this.outDir = outDir;
    }

    public void create() throws TransformerException, IOException {
        TransformerFactory fac = new net.sf.saxon.TransformerFactoryImpl();
        Transformer xform = fac.newTransformer(new StreamSource(getClass().getResourceAsStream(xslSourceFilename)));
        xform.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
        xform.transform(new StreamSource(getClass().getResourceAsStream(xmlSourceFilename)), new StreamResult(new File(outDir + "/resume.html")));

        // CSS
        copyResourceFile(outDir, "/css", "/style.css");
    }



    public void copyResourceFile(final String outputDir, final String parentPath, final String file) throws IOException {
        FileUtils.forceMkdir(new File(outputDir + parentPath));
        IOUtils.copy(getClass().getResourceAsStream(parentPath+file), new FileOutputStream(new File(outputDir+parentPath+file)));
    }
}
