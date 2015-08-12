-- RVM, Roblox Version Manager

require 'lfs'

local RVM = {}

local publish = require './utilities/publish'
local upload = require './utilities/upload'

function RVM:Publish()
	publish()
end 

function RVM:Upload(Mode, FileName, ...)
	upload(Mode, FileName, ...)
end

function RVM:GenerateCommitLog(ofile)
	local ofile = ofile or 'commits.log'
	os.execute('git log --pretty=oneline --abbrev-commit > ' .. ofile)
end

return RVM
