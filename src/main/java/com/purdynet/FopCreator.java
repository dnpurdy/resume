package com.purdynet;

import org.apache.commons.lang3.tuple.Pair;
import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.xmlgraphics.util.MimeConstants;

import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;

public class FopCreator {
    private final String documentPrefix = "DavidPurdy-resume";
    private final String xslSourceFilename = "/xslt/pdf_xform.xsl";
    private final String xmlSourceFilename = "/xml/resume.xml";

    private final String outDir;

    public FopCreator(final String outDir) {
        this.outDir = outDir;
    }

    public static void createPdf(final String outDir) throws IOException, FOPException, TransformerException {
        FopCreator fopCreator = new FopCreator(outDir);
        fopCreator.createPdf();
    }

    public void createPdf() throws IOException, FOPException, TransformerException {
        create(fopResult(MimeConstants.MIME_PDF, genOutputputStream(".pdf")));
    }

    public static void createTxt(final String outDir) throws FOPException, IOException, TransformerException {
        FopCreator fopCreator = new FopCreator(outDir);
        fopCreator.createTxt();
    }

    public void createTxt() throws IOException, FOPException, TransformerException {
        create(fopResult(MimeConstants.MIME_PLAIN_TEXT, genOutputputStream(".txt")));
    }

    public static void createRtf(final String outDir) throws IOException, FOPException, TransformerException {
        FopCreator fopCreator = new FopCreator(outDir);
        fopCreator.createRtf();
    }

    public void createRtf() throws IOException, FOPException, TransformerException {
        create(fopResult(MimeConstants.MIME_RTF, genOutputputStream(".rtf")));
    }

    public static void createFo(final String outDir) throws IOException, TransformerException {
        FopCreator fopCreator = new FopCreator(outDir);
        fopCreator.createFo();
    }

    public void createFo() throws IOException, TransformerException {
        final OutputStream out = genOutputputStream(".fo");
        create(Pair.of(foResult(out), out));
    }

    private StreamResult foResult(final OutputStream out) {
        return new StreamResult(out);
    }

    public void create(final Pair<Result, OutputStream> o) throws IOException, TransformerException {
        try {
            transform(o.getLeft());
        } finally {
            o.getRight().close();
        }
    }

    private void transform(final Result res) throws TransformerException {
        StreamSource src = createSource(xmlSourceFilename);
        Transformer transformer = createTransformer(xslSourceFilename);
        transformer.transform(src, res);
    }

    private StreamSource createSource(final String xmlPath) {
        return new StreamSource(getClass().getResourceAsStream(xmlPath));
    }

    private Transformer createTransformer(final String xslSource) throws TransformerConfigurationException {
        TransformerFactory factory = new net.sf.saxon.TransformerFactoryImpl();
        StreamSource xslt = new StreamSource(getClass().getResourceAsStream(xslSource));
        Transformer transformer = factory.newTransformer(xslt);
        transformer.setParameter("versionParam", "2.0");

        return transformer;
    }

    private Pair<Result,OutputStream> fopResult(final String outputType, final OutputStream out) throws FOPException {
        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
        Fop fop = fopFactory.newFop(outputType, fopFactory.newFOUserAgent(), out);
        return Pair.of(new SAXResult(fop.getDefaultHandler()), out);
    }

    private OutputStream genOutputputStream(final String ext) throws FileNotFoundException {
        return new BufferedOutputStream(new FileOutputStream(new File(genFileName(outDir, ext))));
    }

    private String genFileName(final String outDir, final String ext) {
        return outDir + "/" + documentPrefix + ext;
    }
}
