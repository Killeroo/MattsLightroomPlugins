require "CollectionExporterTask"
local LrLogger = import 'LrLogger'

local myLogger = LrLogger('CollectionExporterLogger')
-- myLogger:enable("print")
myLogger:enable("logfile")

return {
    processRenderedPhotos = CollectionExporterTask.processRenderedPhotos,
}