local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/Beta.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "👾 Cosmic Hub | English 👾 ",
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
    Games = Window:AddTab({ Title = "Games", Icon = "gamepad-2"}),
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

    Tabs.Games:AddParagraph({
        Title = "----- Dead Rails -----",
        Content = ""
    })

    Tabs.Games:AddButton({
        Title = "Dead Rails Hub (No Key)",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/DeadRails"))()
        end
    })

    Tabs.Games:AddButton({
        Title = "Dead Rails Hub by markk (No Key)",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Markklol/AnimalSimulator/refs/heads/main/DRails.lua"))()
        end
    })

    Tabs.Games:AddButton({
        Title = "Lunor Hub (No Key)",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Just3itx/Lunor-Loadstrings/refs/heads/main/Loader'))()
        end
    })

    Tabs.Games:AddButton({
        Title = "Zephyr Hub (No Key)",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Unknownlodfc/Zephyr/refs/heads/main/Zephyr%20%7C%20Dead%20Rails"))()
        end
    })

    Tabs.Games:AddButton({
        Title = "Tbao Hub (No Key)",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()
        end
    })

    Tabs.Games:AddButton({
        Title = "Speed X Hub (Key)",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
        end
    })

    Tabs.Games:AddParagraph({
        Title = "----- MM2 / Murder Mystery 2 -----",
        Content = ""
    })

    Tabs.Games:AddButton({
        Title = "Highlight Hub (No Key)",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/HighlightMM2/main/Lite"))()
        end
    })

    Tabs.Games:AddButton({
        Title = "Foggy Hub (No Key)",
        Description = "",
        Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/mm2-piano-reborn/refs/heads/main/scr"))()
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
InterfaceManager:SetFolder("CosmicHubEnglish")
SaveManager:SetFolder("CosmicHubEnglish/SaveConfig")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
