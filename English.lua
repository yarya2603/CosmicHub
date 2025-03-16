local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "❄️ Mix HUB ❄️ | Script HUB | English",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "❄️ Mix HUB ❄️",
   LoadingSubtitle = "by SKALA",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Mix Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "❄️ Mix HUB ❄️",
      Subtitle = "Key System",
      Note = "Idite Naxyu", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"4daf83addf-MIX-3jX82sx5day","dev"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})   

Rayfield:Notify({
    Title = "❄️ Mix HUB ❄️",
    Content = "Welcome To Mix HUB",
    Duration = 9.5,
    Image = "snowflake",
 })

local PlayerTab = Window:CreateTab("Player", "user")
local Section = PlayerTab:CreateSection("Player")

local Slider = PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 500},
    Increment = 1,
    Suffix = "",
    CurrentValue = 16,
    Flag = "",
    Callback = function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end,
 })

 local Slider = PlayerTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 500},
    Increment = 1,
    Suffix = "",
    CurrentValue = 50,
    Flag = "",
    Callback = function(j)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = j
    end,
 })

 local Slider = PlayerTab:CreateSlider({
    Name = "Gravity",
    Range = {196.2, 500},
    Increment = 1,
    Suffix = "",
    CurrentValue = 196.2,
    Flag = "",
    Callback = function(g)
        game:GetService("Workspace").Gravity = g
    end,
 })

 local Button = PlayerTab:CreateButton({
	Name = "Respawn",
	Callback = function()
	    game.Players.LocalPlayer.Character.Head:Destroy()
if game.Players.LocalPlayer.Character.Humanoid.Health < 5 then 
    local deathmanok = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").position
    wait(1.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(deathmanok)
    end
end})

local Button = PlayerTab:CreateButton({
	Name = "Rejoin",
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
end})


local Button = PlayerTab:CreateButton({
	Name = "Auto Rejoin",
	Callback = function()
	    game:WaitForChild("CoreGui")
game:WaitForChild("Players")

print("REJOIN SCRIPT ENABLED")

while true do wait()
    wait(1)
getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
        pcall(game:GetService("TeleportService"):Teleport(game.PlaceId))
    end
end)

end
end})


local Button = PlayerTab:CreateButton({
	Name = "Join Smallest Server",
	Callback = function()
      		local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local _place = game.PlaceId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local Server, Next; repeat
   local Servers = ListServers(Next)
   Server = Servers.data[1]
   Next = Servers.nextPageCursor
until Server

TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
  	end    
})

local Button = PlayerTab:CreateButton({
	Name = "Noclip",
	Callback = function()
    	local noclip = true char = game.Players.LocalPlayer.Character while true do if noclip == true then for _,v in pairs(char:children()) do pcall(function() if v.className == "Part" then v.CanCollide = false elseif v.ClassName == "Model" then v.Head.CanCollide = false end end) end end game:service("RunService").Stepped:wait() end
end})

 local Section = PlayerTab:CreateSection("Utility")

 local Button = PlayerTab:CreateButton({
    Name = "BTools",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/FBKJTUyw"))();
    end
})

local Button = PlayerTab:CreateButton({
	Name = "Xray",
	Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/newxray/main/op')))()
    Rayfield:Notify({
        Title = "❄️ Mix HUB ❄️",
        Content = "Press X to toggle xray!",
        Duration = 5,
        Image = "snowflake",
     })
end})
	
local Button = PlayerTab:CreateButton({
	Name = "ClickTP",
	Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/ClickTp/main/tool')))()
  	end    
})


local Button = PlayerTab:CreateButton({
	Name = "Explorer",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MassiveHubs/loadstring/refs/heads/main/DexXenoAndRezware'))()
  	end    
})

local Button = PlayerTab:CreateButton({
	Name = "CTRL Delete",
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

local Button = PlayerTab:CreateButton({
	Name = "Infinite Jump",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SKALAScripts/Others/refs/heads/main/Infinite%20Jump.lua"))()
  	end    
})

local Button = PlayerTab:CreateButton({
	Name = "ESP",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SKALAScripts/Others/refs/heads/main/ESP.lua"))()
  	end    
})

local Button = PlayerTab:CreateButton({
	Name = "FullBright",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SKALAScripts/Others/refs/heads/main/FullBright.lua"))()
  	end    
})

local Button = PlayerTab:CreateButton({
	Name = "Display Name Remover",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SKALAScripts/Others/refs/heads/main/Display%20Name%20Remover.lua"))()
  	end    
})

local AdminTab = Window:CreateTab("Admins", "star")

local Section = AdminTab:CreateSection("Admins")

 local Button = AdminTab:CreateButton({
	Name = "Infinite Yield",
	Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
  	end    
})


local Button = AdminTab:CreateButton({
	Name = "Shattervest Admin",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/Shattervast-Admin/main/fe")) ()
  	end    
})

local Button = AdminTab:CreateButton({
	Name = "Reviz Admin",
	Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/revizz/main/adminfe'),true))()
  	end    
})

local ScriptTab = Window:CreateTab("Scripts", "scroll-text")

local Section = ScriptTab:CreateSection("FTAP")

local Button = ScriptTab:CreateButton({
	Name = "Blitz Free Premium",
	Callback = function()
    loadstring(game:HttpGet("https://you.whimper.xyz/blitz"))()
  	end    
})

local Button = ScriptTab:CreateButton({
	Name = "VHS Free Premium",
	Callback = function()
    loadstring(game:HttpGet("https://you.whimper.xyz/vhs.lua"))()
  	end    
})

local Section = ScriptTab:CreateSection("Doors")

local Button = ScriptTab:CreateButton({
	Name = "Blackking (No Key)",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))()
  	end    
})

local Section = ScriptTab:CreateSection("Dead Rails")

local Button = ScriptTab:CreateButton({
	Name = "Dead Rails Hub (No Key)",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/DeadRails"))()
  	end    
})

local Button = ScriptTab:CreateButton({
	Name = "Zephyr Hub (No Key)",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Unknownlodfc/Zephyr/refs/heads/main/Zephyr%20%7C%20Dead%20Rails"))()
  	end    
})

local Button = ScriptTab:CreateButton({
	Name = "Lunor Hub (No Key)",
	Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Just3itx/Lunor-Loadstrings/refs/heads/main/Loader'))()
  	end    
})

local CreditsTab = Window:CreateTab("Credits", "mail")

local Section = CreditsTab:CreateSection("Credits")

local Paragraph = CreditsTab:CreateParagraph({Title = "Owner", Content = "Mix Hub was made by SKALA"})

local Paragraph = CreditsTab:CreateParagraph({Title = "UI Library", Content = "Huge thanks to Rayfield for the UI Library"})

local Paragraph = CreditsTab:CreateParagraph({Title = "Scripts", Content = "All Scripts are made on Xeno"})
