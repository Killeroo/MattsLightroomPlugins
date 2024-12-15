require "TestTask"
local LrLogger = import 'LrLogger'

local myLogger = LrLogger('exportLogger')
myLogger:enable("print")

return {
    processRenderedPhotos = TestTask.processRenderedPhotos,
}