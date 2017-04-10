#!/bin/sh

debug_msg="SET_CLASSPATH"

echo
echo $debug_msg - start...

export DIR=$(pwd)/libs
export CLASSPATH=.:$DIR/activation-1.1.jar:$DIR/antlr-2.7.2.jar:$DIR/apache-mime4j-core-0.7.2.jar:$DIR/apache-mime4j-dom-0.7.2.jar:$DIR/asm-3.2.jar:$DIR/asm-4.1.jar:$DIR/asm-commons-4.1.jar:$DIR/asm-debug-all-4.1.jar:$DIR/asm-tree-4.1.jar:$DIR/aspectjrt-1.6.11.jar:$DIR/avro-1.5.3.jar:$DIR/avro-ipc-1.5.3.jar:$DIR/bcmail-jdk15-1.45.jar:$DIR/bcprov-jdk15-1.45.jar:$DIR/boilerpipe-1.1.0.jar:$DIR/collections-generic-4.01.jar:$DIR/colt-1.2.0.jar:$DIR/commons-beanutils-1.8.3.jar:$DIR/commons-cli-1.2.jar:$DIR/commons-codec-1.5.jar:$DIR/commons-codec-1.6.jar:$DIR/commons-collections-20040616.jar:$DIR/commons-collections-3.2.1.jar:$DIR/commons-compress-1.4.1.jar:$DIR/commons-compress-1.5.jar:$DIR/commons-configuration-1.8.jar:$DIR/commons-digester-2.1.jar:$DIR/commons-el-1.0.jar:$DIR/commons-fileupload-1.0.jar:$DIR/commons-httpclient-3.1.jar:$DIR/commons-io-2.4.jar:$DIR/commons-lang-2.6.jar:$DIR/commons-logging-1.1.1.jar:$DIR/commons-logging-api-1.1.jar:$DIR/commons-math-2.1.jar:$DIR/commons-math3-3.1.1.jar:$DIR/commons-math3-3.2-javadoc.jar:$DIR/commons-math3-3.2.jar:$DIR/commons-net-1.4.1.jar:$DIR/commons-validator-1.3.1.jar:$DIR/concurrent-1.3.4.jar:$DIR/core-3.1.1.jar:$DIR/dnsjava-2.1.6.jar:$DIR/dom4j-1.6.1.jar:$DIR/dsiutils-2.0.14.jar:$DIR/dsiutils-2.2.0.jar:$DIR/example-async-rest-jar-9.1.4.v20140401.jar:$DIR/fastutil-6.5.15.jar:$DIR/fastutil-6.5.9.jar:$DIR/fcgi-client-9.1.4.v20140401.jar:$DIR/fcgi-server-9.1.4.v20140401.jar:$DIR/fontbox-1.7.1.jar:$DIR/fontbox-1.8.4.jar:$DIR/geronimo-stax-api_1.0_spec-1.0.1.jar:$DIR/guava-14.0-rc3.jar:$DIR/guava-17.0-rc1-javadoc.jar:$DIR/guava-17.0-rc1.jar:$DIR/hadoop-annotations-0.23.6.jar:$DIR/hadoop-auth-0.23.6.jar:$DIR/hadoop-common-0.23.6.jar:$DIR/httpasyncclient-4.0.1.jar:$DIR/httpclient-4.3.2-javadoc.jar:$DIR/httpclient-4.3.2.jar:$DIR/httpcore-4.3.2.jar:$DIR/httpcore-nio-4.3.2.jar:$DIR/isoparser-1.0-RC-1.jar:$DIR/jackson-core-asl-1.8.8.jar:$DIR/jackson-jaxrs-1.8.8.jar:$DIR/jackson-mapper-asl-1.8.8.jar:$DIR/jackson-xc-1.8.8.jar:$DIR/jasper-compiler-5.5.23.jar:$DIR/jasper-runtime-5.5.23.jar:$DIR/java-getopt-1.0.13.jar:$DIR/javacc-4.0.jar:$DIR/javax-websocket-client-impl-9.1.4.v20140401.jar:$DIR/javax-websocket-server-impl-9.1.4.v20140401.jar:$DIR/javax.annotation-api-1.2.jar:$DIR/javax.el-3.0.0.jar:$DIR/javax.servlet-api-3.1.0.jar:$DIR/javax.servlet.jsp-2.3.2.jar:$DIR/javax.servlet.jsp-api-2.3.1.jar:$DIR/javax.servlet.jsp.jstl-1.2.2.jar:$DIR/javax.websocket-api-1.0.jar:$DIR/jaxb-api-2.2.2.jar:$DIR/jaxb-impl-2.2.3-1.jar:$DIR/jcl-over-slf4j-1.7.7-javadoc.jar:$DIR/jcl-over-slf4j-1.7.7.jar:$DIR/jdiff-1.0.9.jar:$DIR/jdom-1.0.jar:$DIR/jempbox-1.7.1.jar:$DIR/jempbox-1.8.4.jar:$DIR/jericho-html-v1357832526.jar:$DIR/jersey-core-1.8.jar:$DIR/jersey-json-1.8.jar:$DIR/jersey-server-1.8.jar:$DIR/jets3t-0.6.1.jar:$DIR/jettison-1.1.jar:$DIR/jetty-6.1.26.jar:$DIR/jetty-annotations-9.1.4.v20140401.jar:$DIR/jetty-client-9.1.4.v20140401.jar:$DIR/jetty-continuation-9.1.4.v20140401.jar:$DIR/jetty-deploy-9.1.4.v20140401.jar:$DIR/jetty-http-9.1.4.v20140401.jar:$DIR/jetty-io-9.1.4.v20140401.jar:$DIR/jetty-jaas-9.1.4.v20140401.jar:$DIR/jetty-jaspi-9.1.4.v20140401.jar:$DIR/jetty-jmx-9.1.4.v20140401.jar:$DIR/jetty-jndi-9.1.4.v20140401.jar:$DIR/jetty-jsp-9.1.4.v20140401.jar:$DIR/jetty-jsp-jdt-2.3.3.jar:$DIR/jetty-monitor-9.1.4.v20140401.jar:$DIR/jetty-plus-9.1.4.v20140401.jar:$DIR/jetty-proxy-9.1.4.v20140401.jar:$DIR/jetty-rewrite-9.1.4.v20140401.jar:$DIR/jetty-schemas-3.1.M0.jar:$DIR/jetty-security-9.1.4.v20140401.jar:$DIR/jetty-server-9.1.4.v20140401.jar:$DIR/jetty-servlet-9.1.4.v20140401.jar:$DIR/jetty-servlets-9.1.4.v20140401.jar:$DIR/jetty-start-9.1.4.v20140401.jar:$DIR/jetty-util-6.1.26.jar:$DIR/jetty-util-9.1.4.v20140401.jar:$DIR/jetty-util-ajax-9.1.4.v20140401.jar:$DIR/jetty-webapp-9.1.4.v20140401.jar:$DIR/jetty-xml-9.1.4.v20140401.jar:$DIR/jhighlight-1.0.jar:$DIR/jplot-1.3.jar:$DIR/jsap-2.1.jar:$DIR/json-simple-1.1.jar:$DIR/jsp-api-2.1.jar:$DIR/jung-algorithms-2.0.1.jar:$DIR/jung-api-2.0.1.jar:$DIR/jung-io-2.0.1.jar:$DIR/juniversalchardet-1.0.3.jar:$DIR/kfs-0.3.jar:$DIR/law-2.1.jar:$DIR/law-2.2.jar:$DIR/log4j-1.2.17.jar:$DIR/log4j-over-slf4j-1.7.7-javadoc.jar:$DIR/log4j-over-slf4j-1.7.7.jar:$DIR/logback-classic-1.1.2-javadoc.jar:$DIR/logback-classic-1.1.2.jar:$DIR/logback-core-1.0.9.jar:$DIR/logback-core-1.1.2.jar:$DIR/mail-1.4.6.jar:$DIR/mail-1.5.0-b01.jar:$DIR/metadata-extractor-2.6.2.jar:$DIR/mg4j-5.2-javadoc.jar:$DIR/mg4j-5.2.jar:$DIR/mg4j-big-4.0.4-javadoc.jar:$DIR/mg4j-big-4.0.4.jar:$DIR/mg4j-big-5.2.1.jar:$DIR/mx4j-3.0.2.jar:$DIR/mx4j-tools-3.0.1.jar:$DIR/mysql-connector-java-5.1.23.jar:$DIR/netcdf-4.2-min.jar:$DIR/netty-3.2.4.Final.jar:$DIR/nutchGraph.jar:$DIR/oro-2.0.8.jar:$DIR/paranamer-2.3.jar:$DIR/pdfbox-1.7.1.jar:$DIR/pdfbox-1.8.4.jar:$DIR/poi-3.10-beta2.jar:$DIR/poi-3.8.jar:$DIR/poi-ooxml-3.10-beta2.jar:$DIR/poi-ooxml-3.8.jar:$DIR/poi-ooxml-schemas-3.10-beta2.jar:$DIR/poi-ooxml-schemas-3.8.jar:$DIR/poi-scratchpad-3.10-beta2.jar:$DIR/poi-scratchpad-3.8.jar:$DIR/pojo-mbean-1.1-javadoc.jar:$DIR/pojo-mbean-1.1.jar:$DIR/prefuse-alpha_20050401.jar:$DIR/protobuf-java-2.4.0a.jar:$DIR/rome-0.9.jar:$DIR/servlet-api-2.5-20081211.jar:$DIR/slf4j-api-1.7.2.jar:$DIR/slf4j-api-1.7.7.jar:$DIR/snappy-java-1.0.3.2.jar:$DIR/spdy-client-9.1.4.v20140401.jar:$DIR/spdy-core-9.1.4.v20140401.jar:$DIR/spdy-http-common-9.1.4.v20140401.jar:$DIR/spdy-http-server-9.1.4.v20140401.jar:$DIR/spdy-server-9.1.4.v20140401.jar:$DIR/sslext-1.2-0.jar:$DIR/stax-api-1.0.1.jar:$DIR/struts-1.2.9.jar:$DIR/sux4j-3.0.10.jar:$DIR/sux4j-3.1.2-javadoc.jar:$DIR/sux4j-3.1.2.jar:$DIR/tagsoup-1.2.1.jar:$DIR/tika-core-1.3.jar:$DIR/tika-core-1.5.jar:$DIR/tika-parsers-1.3.jar:$DIR/tika-parsers-1.5.jar:$DIR/ubi-utilx-1.2.jar:$DIR/velocity-1.7.jar:$DIR/velocity-dep-1.4.jar:$DIR/velocity-tools-1.3.jar:$DIR/vorbis-java-core-0.1-tests.jar:$DIR/vorbis-java-tika-0.1.jar:$DIR/webgraph-3.0.9.jar:$DIR/webgraph-3.3.3-javadoc.jar:$DIR/webgraph-3.3.3.jar:$DIR/webgraph-big-3.0.3.jar:$DIR/webgraph-big-3.3.3-javadoc.jar:$DIR/webgraph-big-3.3.3.jar:$DIR/websocket-api-9.1.4.v20140401.jar:$DIR/websocket-client-9.1.4.v20140401.jar:$DIR/websocket-common-9.1.4.v20140401.jar:$DIR/websocket-server-9.1.4.v20140401.jar:$DIR/websocket-servlet-9.1.4.v20140401.jar:$DIR/wstx-asl-3.2.6.jar:$DIR/xalan-2.5.1.jar:$DIR/xercesImpl-2.8.1.jar:$DIR/xml-apis-1.3.03.jar:$DIR/xmlbeans-2.3.0.jar:$DIR/xmlenc-0.52.jar:$DIR/xmpcore-5.1.2.jar:$DIR/xz-1.0.jar:$DIR/xz-1.2.jar:$DIR/homework.jar

echo $debug_msg - done!
echo
