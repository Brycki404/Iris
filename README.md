
# Iris (the loadstring version)

If you came to this page you already know what Iris is since this is a fork of that repository. I suggest going back to that page if you need to look at the documentation or to find more information.

How to use in your own scripts:
```lua
local Iris = loadstring(game:HttpGet("https://raw.githubusercontent.com/Brycki404/Iris/refs/heads/main/loader.lua", true))()
-- Basic Iris Usage Example:
Iris:Connect(function()
    Iris.Window({"My First Window!"})
        Iris.Text({"Hello, World"})
        Iris.Button({"Save"})
        Iris.InputNum({"Input"})
    Iris.End()
end)
```

If you use a multiple script structure, you can just get the Iris library from the global variable it makes internally after loading it at least once in another script via the method above.
```lua
-- Basic Iris Usage Example:
Iris:Connect(function()
    Iris.Window({"My First Window!"})
        Iris.Text({"Hello, World"})
        Iris.Button({"Save"})
        Iris.InputNum({"Input"})
    Iris.End()
end)
```
