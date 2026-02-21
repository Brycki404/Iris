local OldHttpGet = game.HttpGet
print("OldHttpGet:", OldHttpGet)
local OldHttpGetAsync = game.HttpGetAsync
print("OldHttpGetAsync:", OldHttpGetAsync)
local OldGet = OldHttpGet or OldHttpGetAsync or nil
assert(OldGet, "No HttpGet function found on game object.")
-- Load BetterLib first (if it's not already loaded), since every other loaded stuff will depend on it. If BetterLib fails to load, everything else won't work, but at least the error will be more informative.
loadstring(OldGet(game, "https://raw.githubusercontent.com/Brycki404/BetterLib/refs/heads/main/main.lua", true))()
-- Begin Script:

local IrisUrl = "https://raw.githubusercontent.com/Brycki404/Iris/refs/heads/main/lib/init.lua"
local Iris = loadstring(Get(LibInitUrl))()
_G.Iris = Iris
return Iris
