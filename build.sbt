name := "resume"

version := "1.0"

scalaVersion := "2.11.5"

libraryDependencies += "net.sf.saxon" % "Saxon-HE" % "9.4"

libraryDependencies += "commons-io" % "commons-io" % "2.4"

libraryDependencies += "org.apache.avalon.framework" % "avalon-framework-api" % "4.2.0" from "http://repo1.maven.org/maven2/avalon-framework/avalon-framework-api/4.2.0/avalon-framework-api-4.2.0.jar"

libraryDependencies += "org.apache.avalon.framework" % "avalon-framework-impl" % "4.2.0" from "http://repo1.maven.org/maven2/avalon-framework/avalon-framework-impl/4.2.0/avalon-framework-impl-4.2.0.jar"

libraryDependencies += "org.apache.xmlgraphics" % "fop" % "1.1"

assemblyMergeStrategy in assembly := {
  case PathList("org","w3c","dom", xs @ _*) => MergeStrategy.first
  case x =>
    val oldStrategy = (assemblyMergeStrategy in assembly).value
    oldStrategy(x)
}
