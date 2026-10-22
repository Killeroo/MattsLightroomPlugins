require "CatalogExporterTask"
local LrLogger = import 'LrLogger'

local myLogger = LrLogger('CatalogExporter')
-- myLogger:enable("print")
myLogger:enable("logfile")

return {
    processRenderedPhotos = CatalogExporterTask.processRenderedPhotos,
}