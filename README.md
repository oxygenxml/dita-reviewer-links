# DITA-OT EditLink plugin

This plugin is compatible with DITA OT 2.x and it allows you to add references to the original DITA topic after each presented topic title both in the PDF and XHTML-based outputs.

To add "Edit" links to each topic title for editing the original topics in the oXygen XML Web Author you need to set the following Ant properties:

* `editlink.remote.ditamap.url` The URL of the root DITA map in the remote repository (e.g., GitHub). This URL depends on the connector to the file server. For example:
  * For *GitHub*, the format is `github://getFileContent/${user}/${repo}/${branch}/path/to/file.ditamap` .
  * For *WebDAV*, the format is `webdav-http://example.com/path/to/file.ditamap`.
  * For more details, please see the [customization manual](https://www.oxygenxml.com/doc/ug-waCustom/topics/webauthor-integrate-embedded-launch.html).

* `editlink.web.author.url` The link to the Oxygen Web Author server that will be used to edit the source in the remote repository, e.g. `https://www.oxygenxml.com/oxygen-xml-web-author/`.

If you set the parameter "editlink.present.only.path.to.topic" to "true" the references will be simple relative file paths pointing to the original DITA topic location and which start to appear after each topic title.
For example the PDF output would look like this:
![https://www.oxygenxml.com/forum/files/presentingReferencesToDITATopics.png](https://www.oxygenxml.com/forum/files/presentingReferencesToDITATopics.png)

For what audience would this plugin be useful?

1) Internal reviewers can review directly the WebHelp or PDF output and when they need to make a correction they can click the "Edit Link" button, open the topic in the Oxygen Web Author and propose changes there, add comments or edit content.
2) Translators may get from the agency both a set of DITA topics and the PDFs or WebHelp output for the entire manual. If after each topic title in the published output the translator sees the path to the original DITA topic location, they can quickly find the part in the user manual PDF or WebHelp output which was generated from the DITA topic they are currently translating.
 
## Integration with the [PDF5-ML plugin](https://github.com/AntennaHouse/pdf5-ml)

To embed an Edit link DITA PDF5 output, obtained using the PDF5-ML plugin, follow this procedure:

1. Add the following import `<xsl:include href="../../com.oxygenxml.editlink/pdf5.xsl"/>` in the `com.antennahouse.pdf5.ml/customization/dita2fo_custom.xsl` file of the PDF5 plugin.
1. In the `com.oxygenxml.editlink/plugin.xml` file, uncomment the lines that configure the parameters for the PDF5 plugin: 

```
<feature extension="com.antennahouse.pdf5.ml.param" value="params.xml" type="file"/>
<feature extension="com.antennahouse.pdf5.ml.saxon.param" value="params.xml" type="file"/>
<feature extension="com.antennahouse.pdf5.ml.psmi.param" value="params.xml" type="file">
```
1. In Oxygen XML Editor/Author, edit a DITA Map PDF5 transformation scenario and open the Parameters tab. 
1. Set values for the following parameters: 
 - editlink.remote.ditamap.url - The custom OXY-URL of the DITA Map suitable for opening in Web Author.
 - editlink.web.author.url - The URL of the Web Author installation (for example: https://www.oxygenxml.com/oxygen-xml-web-author/).

Copyright and License
---------------------
Copyright 2018 Syncro Soft SRL.

This project is licensed under [Apache License 2.0](https://github.com/oxygenxml/dita-reviewer-links/blob/master/LICENSE)
