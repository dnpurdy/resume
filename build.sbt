name := "resume"

version := "1.0"

scalaVersion := "2.11.5"

libraryDependencies += "net.sf.saxon" % "Saxon-HE" % "9.4" exclude ("xom", "xom")

libraryDependencies += "commons-io" % "commons-io" % "2.4"

libraryDependencies += "org.apache.xmlgraphics" % "fop" % "1.1" exclude ("org.apache.avalon.framework","avalon-framework-api") exclude("org.apache.avalon.framework","avalon-framework-impl")
