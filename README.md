# DITA-OT EditLink plugin

DITA-OT plugin which adds an "edit" link to each topic title. This links opens the web author to edit the source of the corresponding topic.

To use the plugin, set the following Ant properties:

* `editlink.remote.ditamap.url` The URL of the root DITA map in the remote repository (e.g., GitHub). For example `/oxygenxml/user-guide/userguide.ditamap`
* `editlink.web.author.url` The link to the Oxygen Web Author server that will be used to edit the source in the remote repository, e.g. `https://www.oxygenxml.com/webapp-demo-aws/app/oxygen.html`

 