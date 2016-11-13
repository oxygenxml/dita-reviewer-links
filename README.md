# DITA-OT EditLink plugin

DITA-OT plugin which adds an "edit" link to each topic title. This links opens the web author to edit the source of the corresponding topic.

The plugin requires several Java System Properties to be passed to DITA-OT:
- `ditamap.path` - the path inside the project dir to the DITA map.
- `cwd` - the path on the local file system to the current directory
- `repo.url` - the URL of the project root that can be used by the Web Author to access the project
- `webapp.url` - the URL where Web Author is deployed
- `github.url` - optional, if not specified then `https://github.com/` will be used.
