return function()

	local DEPDIR = os.getenv("RBXDEPLOYMENTDIR")
	local DEPFILE = "assetid"

	if not DEPDIR or not DEPFILE then
		error("DEPDIR or DEPFILE must be set: is your RBXDEPLOYMENTDIR environment variable set?")
	end

	-- Assuming that mod is updated.. ?

	local FILE = io.open("assetid.last", "r")
	local NUM = FILE:read("*a")
	print(NUM)
	if not NUM:match("%d") then
		error("is not an assetid: " .. NUM)
	end

	local DIR = DEPDIR
	local PATH = DEPDIR.."/"..DEPFILE
	file = io.open(PATH, "w+")
	file:write(NUM)
	file:close()
	os.execute("cd "..DIR.. " && git add " .. DEPFILE .. "  && git commit -m update && git push")
	print("Published succesfully")

end