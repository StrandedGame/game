#!/usr/local/bin/lua

print("")

url = require 'socket.url'

local args = {...}
local strgen

local MODE = assert(args[1], "No mode choosen")
local FILENAME
if string.lower(MODE) == "new" then


	FILENAME = assert(args[2], "No filename provided");
	local MODNAME = assert(args[3], "No target filename provided");
	local DESCRIPTION = assert(args[4], "No description provided");
	strgen = "'http://www.roblox.com/Data/Upload.ashx?assetid=" .. "0".. "&type=model&name="..url.escape(MODNAME).."&description="..url.escape(DESCRIPTION).."&genreTypeId=1&ispublic=false&allowComments=false&groupId='"
elseif string.lower(MODE) == "update" then
	 FILENAME = assert(args[2], "No filename provided");
	 local ASSETID = assert(args[3], "No assetId provided")
	 strgen="'http://www.roblox.com/Data/Upload.ashx?assetid=" .. ASSETID .. "&type=Model'"
else
	error("Mode is unsupported")
end 



local url = strgen

print(url)

a = os.execute("./upload.sh " .. FILENAME .. " \"" .. url .. "\"")

-- get last asset id from assetid.last file

file = io.open("./assetid.last", "r")
if file then
	local str = file:read("*a")
	if str then
		print("Last asset version id: " .. str)
		os.exit()
	end
end
error("error reading asset file")
