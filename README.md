# DITA-OT EditLink plugin

This plugin is compatible with DITA OT 2.x and it allows you to add references to the original DITA topic after each presented topic title both in the PDF and XHTML-based outputs.

If you set the parameter "editlink.present.only.path.to.topic" to "true" the references will be simple relative file paths pointing to the original DITA topic location and which start to appear after each topic title.

Instead of file paths you can also add links to a remote oXygen XML Web Author server where the topics can also be edited directly.
To add "Edit" links to each topic title for editing the original topics in the oXygen XML Web Author you need to set the following Ant properties:

* `editlink.remote.ditamap.url` The URL of the root DITA map in the remote repository (e.g., GitHub). This URL depends on the connector to the file server. For example:
  * For *GitHub*, the format is `github://getFileContent/${user}/${repo}/${branch}/path/to/file.ditamap` .
  * For *WebDAV*, the format is `webdav-http://example.com/path/to/file.ditamap`.

* `editlink.web.author.url` The link to the Oxygen Web Author server that will be used to edit the source in the remote repository, e.g. `https://www.oxygenxml.com/webapp-demo-aws/app/oxygen.html`

 
