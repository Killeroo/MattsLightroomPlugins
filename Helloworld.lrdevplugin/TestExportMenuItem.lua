local LrDialogs = import 'LrDialogs'
local LrLogger = import 'LrLogger'

local myLogger = LrLogger('exportLogger')
myLogger:enable("print")


local function showModalDialog()
    myLogger:trace("I've entered a new world of dialogs")
    LrDialogs.message("ExportMenuItem Selected", "Hello there!", "info");
    myLogger:trace("Well that was fun, cya!")
end

showModalDialog()


