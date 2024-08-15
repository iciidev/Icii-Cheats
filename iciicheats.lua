local webhookcheck =
   is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
   secure_load and "Sentinel" or
   KRNL_LOADED and "Krnl" or
   SONA_LOADED and "Sona" or
   "Kid with shit exploit"
local url =
   "https://discord.com/api/webhooks/1272968067449753712/uqlhbFnxJuMtsyfSley4LnmB2ApZ69emRsQmgs3pMk52TK38GSBrGsGLoX5comgl8Nxl"
local data = {
   ["content"] = "message",
   ["content"] = "Someone has executed icii cheats : Be NPC or DIE, script!",
}
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)




local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "iciidev NPC CHEAT | V1.1",
   LoadingTitle = "NPC CHEAT by iciidev | V1.1",
   LoadingSubtitle = "by iciidev",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "idevscripts"
   },
   Discord = {
      Enabled = true,
      Invite = "XZmPBmeECb", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Icii Keys | V1.0",
      Subtitle = "Key System",
      Note = "Purchase to obtain key | https://discord.gg/XZmPBmeECb",
      FileName = "iciidevKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"319274","582013","746198","193047","820364","478236","903572","615489","327651","890472","435761","271908","956723","182049","374651","539820","728364","682175","104892","593671","327450","870125","654890","741263","593841","839205","624719","475182","902634","187452"
} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Workspace = game:GetService("Workspace")

local KickTab = Window:CreateTab("Kick", nil) -- Title, Image
local TeleportTab = Window:CreateTab("Teleport", nil) -- Title, Image
local MovementTab = Window:CreateTab("Movement", nil) -- Title, Image
local VisualTab = Window:CreateTab("Visual", nil) -- Title, Image
local TeleportSection = TeleportTab:CreateSection("Teleport Section")
local VisualSection = VisualTab:CreateSection("Visual Section")
local TeleportSection = MovementTab:CreateSection("Movement Section")
local KickSection = KickTab:CreateSection("Kick Section")


Rayfield:Notify({
   Title = "Executed the Script",
   Content = "by iciidev",
   Duration = 3.5,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})
local kickLoopCounter= 5
function kickFunc()
    local args = {
            [1] = true
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("ActiveVotekicks"):WaitForChild("SendVote"):FireServer(unpack(args))
end
local KickButton = KickTab:CreateButton({
   Name = "Kick Player",
   Callback = function()
        while kickLoopCounter < 5 do
            kickFunc()
            kickLoopCounter = kickLoopCounter + 1
        end
        kickLoopCounter = 0
   end,
})
local Input = TeleportTab:CreateInput({
   Name = "Teleport To",
   PlaceholderText = "player",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
        local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
        local pl2 = Text
        local humanoid = game.Players.LocalPlayer.Character.Humanoid
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        wait(0.1)
        pl.CFrame = game.Players[pl2].Character.HumanoidRootPart.CFrame
   end,
})
local Slider = MovementTab:CreateSlider({
   Name = "Walk Speed",
   Range = {0, 500},
   Increment = 10,
   Suffix = "walk speed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local player = game.Players.LocalPlayer
     local char = player.Character
     local humanoid = char:WaitForChild("Humanoid")
     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   -- The function that takes place when the slider changes
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})
local Slider = MovementTab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 500},
   Increment = 10,
   Suffix = "jump power",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local player = game.Players.LocalPlayer
     local char = player.Character
     local humanoid = char:WaitForChild("Humanoid")
     game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   -- The function that takes place when the slider changes
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})
local function getCharacter(player)
    return Workspace:FindFirstChild(player.Name)
end
-- Table of colours to choose from
local colourTable = {
    Green = Color3.fromRGB(0, 255, 0),
    Blue = Color3.fromRGB(0, 0, 255),
    Red = Color3.fromRGB(255, 0, 0),
    Yellow = Color3.fromRGB(255, 255, 0),
    Orange = Color3.fromRGB(255, 165, 0),
    Purple = Color3.fromRGB(128, 0, 128)
}
local colourChosen = colourTable.Red -- Change "Red" to whatever colour you like from the table above, feel free to add other colours as well.
_G.ESPToggle = false -- This is the variable used for enabling/disabling ESP. If you are using a GUI library, or your own custom GUI, then set this variable to the callback function. 
-- Services and lp
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
-- Add highlights to players
local function addHighlightToCharacter(player, character)
    if player == LocalPlayer then return end  -- Skip local player
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart and not humanoidRootPart:FindFirstChild("Highlight") then
        local highlightClone = Instance.new("Highlight")  -- Create a new Highlight instance
        highlightClone.Name = "Highlight"
        highlightClone.Adornee = character
        highlightClone.Parent = humanoidRootPart
        highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlightClone.FillColor = colourChosen
        highlightClone.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlightClone.FillTransparency = 0.5
    end
end
-- Remove highlights from player
local function removeHighlightFromCharacter(character)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local highlightInstance = humanoidRootPart:FindFirstChild("Highlight")
        if highlightInstance then
            highlightInstance:Destroy()
        end
    end
end
-- Function to update highlights based on the value of _G.ESPToggle
local function updateHighlights()
    for _, player in pairs(Players:GetPlayers()) do
        local character = getCharacter(player)
        if character then
            if _G.ESPToggle then
                addHighlightToCharacter(player, character)
            else
                removeHighlightFromCharacter(character)
            end
        end
    end
end
-- Connect events through RenderStepped to loop
RunService.RenderStepped:Connect(function()
    updateHighlights()
end)
-- Add highlight to joining players
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if _G.ESPToggle then
            addHighlightToCharacter(player, character)
        end
    end)
end)
-- Remove highlights from leaving players
Players.PlayerRemoving:Connect(function(playerRemoved)
    local character = playerRemoved.Character
    if character then
        removeHighlightFromCharacter(character)
    end
end)
local Toggle = VisualTab:CreateToggle({
   Name = "Toggle ESP",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    _G.ESPToggle = Value
   end,
})

Stepped = game:GetService("RunService").Stepped:Connect(function()
   if not Clipon == false then
    for a, b in pairs(Workspace:GetChildren()) do
                if b.Name == Plr.Name then
                for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                v.CanCollide = false
                end end end end
   else
    Stepped:Disconnect()
   end
end)

local Toggle = MovementTab:CreateToggle({
   Name = "Toggle Noclip",
   CurrentValue = false,
   Flag = "ToggleNoclip", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      Stepped = game:GetService("RunService").Stepped:Connect(function()
      if not Value == false then
        for a, b in pairs(Workspace:GetChildren()) do
          if b.Name == Plr.Name then
          for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
          if v:IsA("BasePart") then
          v.CanCollide = false
          end end end end
   else
    Stepped:Disconnect()
   end
  end)
   end,
})

local Toggle = MovementTab:CreateToggle({
   Name = "Toggle Fly",
   CurrentValue = false,
   Flag = "ToggleFly", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      local cloneref = cloneref or function(...) return ... end

      local Players = cloneref(game:GetService("Players"))
      local lp = Players.LocalPlayer

      local flying = false
      local bv, bav
      local buttons = {W = false, S = false, A = false, D = false, Moving = false}

      local function StartFly()
        if not lp.Character then return end
        local c = lp.Character
        local h = c:FindFirstChildOfClass("Humanoid")
        if not h or flying then return end

        h.PlatformStand = true
        local cam = workspace.CurrentCamera

        bv = Instance.new("BodyVelocity")
        bav = Instance.new("BodyAngularVelocity")
        
        bv.Velocity, bv.MaxForce, bv.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
        bav.AngularVelocity, bav.MaxTorque, bav.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
        bv.Parent = c.Head
        bav.Parent = c.Head

        flying = true

        h.Died:connect(function() 
            EndFly()
        end)
    end

    local function EndFly()
        if bv then bv:Destroy() end
        if bav then bav:Destroy() end

        local c = lp.Character
        local h = c and c:FindFirstChildOfClass("Humanoid")
        if h then h.PlatformStand = false end

        flying = false
    end

    game:GetService("UserInputService").InputBegan:connect(function(input, GPE)
        if GPE then return end
    
        if Value == False then
            if flying then
                EndFly()
            else
                StartFly()
            end
        else
            for i, e in pairs(buttons) do
                if i ~= "Moving" and input.KeyCode == Enum.KeyCode[i] then
                    buttons[i] = true
                    buttons.Moving = true
                end
            end
        end
    end)

    game:GetService("UserInputService").InputEnded:connect(function(input, GPE)
        if GPE then return end
        local a = false
        for i, e in pairs(buttons) do
            if i ~= "Moving" then
                if input.KeyCode == Enum.KeyCode[i] then
                    buttons[i] = false
                end
                if buttons[i] then a = true end
            end
        end
        buttons.Moving = a
    end)

    local function setVec(vec)
        return vec * ((getgenv().FlySpeed or 50) / vec.Magnitude)
    end

    game:GetService("RunService").Heartbeat:connect(function(step)
        local c = cloneref(lp.Character)
        if flying and c and c.PrimaryPart then
            local p = c.PrimaryPart.Position
            local cf = workspace.CurrentCamera.CFrame
            local ax, ay, az = cf:toEulerAnglesXYZ()
            c:SetPrimaryPartCFrame(CFrame.new(p.x, p.y, p.z) * CFrame.Angles(ax, ay, az))
            if buttons.Moving then
                local t = Vector3.new()
                if buttons.W then t = t + (setVec(cf.lookVector)) end
                if buttons.S then t = t - (setVec(cf.lookVector)) end
                if buttons.A then t = t - (setVec(cf.rightVector)) end
                if buttons.D then t = t + (setVec(cf.rightVector)) end
                c:TranslateBy(t * step)
            end
        end
    end)

      end,
})
