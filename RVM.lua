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

function RVM:Deploy(dptarget)
	local DirUtil = loadfile("./DirToRBXM/DirToRBXM.lua")
	DirUtil("pack", "./game", "./outfile.rbxmx")
	self:Upload("update", "./outfile.rbxmx", 282804955)
	self:Publish()
end 

return RVM
