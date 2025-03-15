local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/Beta.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local PlayerName = game.Players.LocalPlayer.Name

local Window = Fluent:CreateWindow({
    Title = "👾 Cosmic Hub 👾 ",
    SubTitle = "Version: 1.0.0",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Admins = Window:AddTab({ Title = "Admins", Icon = "star" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}

    Fluent:Notify({
        Title = "👾 Cosmic Hub 👾",
        Content = "Welcome To Cosmic Hub",
        SubContent = "", -- Optional
        Duration = 8 -- Set to nil to make the notification not disappear
    })

    local Slider = Tabs.Player:AddSlider("WalkSpeed", {
        Title = "WalkSpeed",
        Description = "",
        Default = 16,
        Min = 16,
        Max = 500,
        Rounding = 1,
        Callback = function(s)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
        end
    })

    local Slider = Tabs.Player:AddSlider("JumpPower", {
        Title = "JumpPower",
        Description = "",
        Default = 50,
        Min = 50,
        Max = 500,
        Rounding = 1,
        Callback = function(j)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = j
        end
    })
    local Slider = Tabs.Player:AddSlider("Gravity", {
        Title = "Gravity",
        Description = "",
        Default = 196.2,
        Min = 196.2,
        Max = 500,
        Rounding = 1,
        Callback = function(g)
            game:GetService("Workspace").Gravity = g
        end
    })

    Tabs.Player:AddButton({
        Title = "Respawn",
        Description = "",
        Callback = function()
            game.Players.LocalPlayer.Character.Head:Destroy()
            if game.Players.LocalPlayer.Character.Humanoid.Health < 5 then 
                local deathmanok = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").position
                wait(1.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(deathmanok)
            end
        end
    })

    Tabs.Player:AddButton({
        Title = "Rejoin",
        Description = "",
        Callback = function()
            local TeleportService = game:GetService("TeleportService")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            
            local Rejoin = coroutine.create(function()
                local Success, ErrorMessage = pcall(function()
                    TeleportService:Teleport(game.PlaceId, LocalPlayer)
                end)
            
                if ErrorMessage and not Success then
                    warn(ErrorMessage)
                end
            end)
            
            coroutine.resume(Rejoin)
        end
    })

    Tabs.Player:AddButton({
        Title = "Btools",
        Description = "",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/FBKJTUyw"))();
        end
    })

    Tabs.Player:AddButton({
        Title = "X-Ray",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/newxray/main/op')))()
        Fluent:Notify({
            Title = "👾 Cosmic Hub 👾",
            Content = "Press X to toggle xray!",
            SubContent = "", -- Optional
            Duration = 4 -- Set to nil to make the notification not disappear
        })
        end
    })

    Tabs.Player:AddButton({
        Title = "TP Tool",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/ClickTp/main/tool')))()
        end
    })

    Tabs.Player:AddButton({
        Title = "Explorer",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/MassiveHubs/loadstring/refs/heads/main/DexXenoAndRezware'))()
        end
    })

    Tabs.Player:AddButton({
        Title = "CTRL Delete",
        Description = "",
        Callback = function()
            local Plr = game:GetService("Players").LocalPlayer
            local Mouse = Plr:GetMouse()
             
            Mouse.Button1Down:connect(function()
            if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
            if not Mouse.Target then return end
            Mouse.Target:Destroy()
            end)
        end
    })

    Tabs.Player:AddButton({
        Title = "Infinite Jump",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKALAScripts/Others/refs/heads/main/Infinite%20Jump.lua"))()
        end
    })

    Tabs.Player:AddButton({
        Title = "ESP",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKALAScripts/Others/refs/heads/main/ESP.lua"))()
        end
    })

    Tabs.Player:AddButton({
        Title = "FullBright",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKALAScripts/Others/refs/heads/main/FullBright.lua"))()
        end
    })

    Tabs.Player:AddButton({
        Title = "Display Name Remover",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SKALAScripts/Others/refs/heads/main/Display%20Name%20Remover.lua"))()
        end
    })

    Tabs.Admins:AddButton({
        Title = "Infinite Yield",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
        end
    })

    Tabs.Admins:AddButton({
        Title = "Shattervest Admin",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/Shattervast-Admin/main/fe")) ()
        end
    })

    Tabs.Admins:AddButton({
        Title = "Reviz Admin",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/revizz/main/adminfe'),true))()
        end
    })
-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
