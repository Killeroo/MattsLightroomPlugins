require "TestTask"
local LrLogger = import 'LrLogger'

local myLogger = LrLogger('exportLogger')
-- myLogger:enable("print")
myLogger:enable("logfile")

return {
    processRenderedPhotos = TestTask.processRenderedPhotos,
}