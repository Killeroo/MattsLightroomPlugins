# Matt's Lightroom Plugins
Some Lightroom Classic plugins that I have stitched together over the years, primarily used for exporting images into paths that reflect the Collection or Catalog path of an image inside of Lightroom. 

Free to do whatever you want with, I am surprised they even work to be honest.

# Contents

### `Collections Exporter` 

Upon export, moves any images into the collections that they were exported from. Works when selecting single or multiple Collections when exporting (but won't work if no collection is selected.. obviously)
### `Catalog Exporter`

Similar to the above but after the export the photo is moved into a folder with a name which combines all folders in the Lightroom catalog path of the image. Sounds weird but it's pretty useful when exporting multiple catalog folders at once.

# How to use

Clone the repo (or download a zip of the repo), in Lightroom go `File -> Plug-in Manager...`, navigate to the downloaded and/or extracted repo and click into one of the plugin and press open. Plugin should export good and proper. 

When installed each plugin should add a new extry in the `Export To:` dropdown menu in the Export dialog window.

For more details you can check out the excellent [Jeffrey Friedl's Blog](https://web.archive.org/web/20260626131331/https://regex.info/blog/lightroom-goodies/plugin-installation).

# License 

Licensed under CC0 1.0 Universal 
(TLDR, you can do whatever you want with this code)