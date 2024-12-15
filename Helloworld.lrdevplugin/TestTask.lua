local LrDialogs = import 'LrDialogs'
local LrLogger = import 'LrLogger'
local LrFileUtils = import 'LrFileUtils'
local LrPathUtils = import 'LrPathUtils'

local myLogger = LrLogger('exportLogger')
myLogger:enable("print")

TestTask = {}

-- https://stackoverflow.com/a/7615129
function mysplit(inputstr, sep)
    if sep == nil then
      sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
    end
    return t
end

--https://stackoverflow.com/a/2705804
function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function count(inputStr, char)
    local count = 0
    for _ in string.gmatch(inputStr, "([^"..char.."]+)") do
        count = count + 1
      end
    return count
end
  

function TestTask.processRenderedPhotos( functionContext, exportContext )
    myLogger:trace("I've entered a new world of dialogs")
    
    local exportSession = exportContext.exportSession

	local nPhotos = exportSession:countRenditions()
    local titleNew = nPhotos .. " photos exporting..."
	local progressScope = exportContext:configureProgress {
						title = titleNew,
					}

    -- for photo in exportSession:photosToExport() do
    --     local path = photo:getRawMetadata('path')
    --     -- myLogger:trace(path)
    -- end


    for _, rendition in exportContext:renditions{ stopIfCanceled = true} do
        local success, pathOrMessage = rendition:waitForRender()

        if success then
            local photo = rendition.photo
            local catalogePath = photo:getRawMetadata('path')
            local directories = mysplit(catalogePath, '\\')

            -- Create new folder name based off location in catalogue
            local dirCount = tablelength(directories)
            local folderName = ""
            for key,value in pairs(directories) do 
                local dirName = directories[key]

                if key == 1 or key == dirCount then
                    -- ignore the root drive and file name in path
                else 
                    local dashCount = count(dirName, '-')
                    if dashCount == 2 then 
                        --ignore the date format that lightroom uses 
                    else
                        folderName = folderName .. "-" .. directories[key]
                    end
                end
            end

            -- Check a folder of that name doesn't already exist
            local parentDir = LrPathUtils.parent(pathOrMessage)
            local destDir = LrPathUtils.child(parentDir, folderName)
            local filename = LrPathUtils.leafName(pathOrMessage)
            local destFilepath = LrPathUtils.child(destDir, filename)
            if LrFileUtils.exists(destDir) then
                LrFileUtils.move(pathOrMessage, destFilepath)
            else
                LrFileUtils.createDirectory(destDir)
                LrFileUtils.move(pathOrMessage, destFilepath)
            end

            -- Remove original
            LrFileUtils.delete(pathOrMessage)


            myLogger:trace(folderName)
            myLogger:trace(parentDir)
            myLogger:trace(destDir)
            myLogger:trace(destFilepath)
            myLogger:trace(pathOrMessage)
            myLogger:trace(filename)
        end
    end
end