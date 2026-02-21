-- Iris loader script. This script is responsible for loading all of the required modules for Iris and initializing it. It also caches the loaded modules and the initialized Iris in the global table, so that they can be accessed by other scripts if needed.

-- If Iris is already loaded, return it instead of loading it again.
if _G.Iris then
    return _G.Iris
end

if not _G.BetterLib or not _G.Get then
    local OldGet = game.HttpGet or game.HttpGetAsync or nil
    assert(OldGet, "No HttpGet function found.")
    -- Load BetterLib first (if it's not already loaded), since every other loaded stuff will depend on it. If BetterLib fails to load, everything else won't work, but at least the error will be more informative.
    loadstring(OldGet(game, "https://raw.githubusercontent.com/Brycki404/BetterLib/refs/heads/main/main.lua", true))()
end
-- Begin Script:

local IrisMainURL = "https://raw.githubusercontent.com/Brycki404/Iris/refs/heads/main/"
local IrisInitURL = IrisMainURL .. "init.lua"
local IrisURLs = {
    API = IrisMainURL .. "lib/API.lua";
    Internal = IrisMainURL .. "lib/Internal.lua";
    PubTypes = IrisMainURL .. "lib/PubTypes.lua";
    Types = IrisMainURL .. "lib/Types.lua";
    WidgetTypes = IrisMainURL .. "lib/WidgetTypes.lua";
    config = IrisMainURL .. "lib/config.lua";
    demoWindow = IrisMainURL .. "demoWindow.lua";
}

-- Load and cache all of the required modules before initializing Iris
-- instead of loading them on demand, since the on-demand loading would
-- cause a lot of redundant HTTP requests and would be very slow.

-- Also, the normal version of Iris requires the scripts based on Roblox heirarchy.
-- This looks like "require(script.Types)"
-- "script" referring to what would be the current script in a normal Roblox setup.
-- However we aren't going to use the "script" variable at all since we are using
-- loadstring and get requests instead of normal module scripts, so there is no
-- real way to replicate this heirarchy. We could try to fake it by creating a
-- table that represents the heirarchy and then using that table as the environment
-- for the modules, but that would be more trouble than it's worth and would still be pretty hacky.
-- So instead, we'll just load all of the modules using Get and
-- cache them in _G.IrisModules, and then instead of using require
-- calls, we will just look up the modules in that table.

local IrisModules = {}
for moduleName, url in pairs(IrisURLs) do
    IrisModules[moduleName] = loadstring(Get(url))()
end
_G.IrisModules = IrisModules

-- Finally initialize Iris and cache it in _G.Iris,
-- so that it can be accessed by other scripts if needed.

local Iris = loadstring(Get(IrisInitURL))()
_G.Iris = Iris
return Iris