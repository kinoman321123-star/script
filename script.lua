--[[
    Infinity Yield Clone v1.0
    Mobile Support + Desktop
    
    КОД 1 из 2
]]

local ADMIN_KEY = "adminkey"

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Variables
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

local flying = false
local flySpeed = 1
local bodyGyro, bodyVelocity
local noclipConnection
local espEnabled = false
local espObjects = {}
local chamsEnabled = false
local chamsObjects = {}
local godMode = false
local godConnection

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "IYClone"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Auth Frame
local AuthFrame = Instance.new("Frame")
AuthFrame.Name = "AuthFrame"
AuthFrame.Parent = ScreenGui
AuthFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
AuthFrame.BorderSizePixel = 0
AuthFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
AuthFrame.Size = UDim2.new(0, 400, 0, 200)
AuthFrame.Active = true
AuthFrame.Draggable = true

local AuthCorner = Instance.new("UICorner")
AuthCorner.CornerRadius = UDim.new(0, 5)
AuthCorner.Parent = AuthFrame

local AuthTitle = Instance.new("TextLabel")
AuthTitle.Parent = AuthFrame
AuthTitle.BackgroundTransparency = 1
AuthTitle.Size = UDim2.new(1, 0, 0, 50)
AuthTitle.Font = Enum.Font.Code
AuthTitle.Text = "Infinity Yield"
AuthTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
AuthTitle.TextSize = 20

local AuthSubtitle = Instance.new("TextLabel")
AuthSubtitle.Parent = AuthFrame
AuthSubtitle.BackgroundTransparency = 1
AuthSubtitle.Position = UDim2.new(0, 0, 0, 50)
AuthSubtitle.Size = UDim2.new(1, 0, 0, 30)
AuthSubtitle.Font = Enum.Font.Code
AuthSubtitle.Text = "FE Admin Commands"
AuthSubtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
AuthSubtitle.TextSize = 14

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = AuthFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
KeyInput.BorderSizePixel = 0
KeyInput.Position = UDim2.new(0, 50, 0, 100)
KeyInput.Size = UDim2.new(0, 300, 0, 35)
KeyInput.Font = Enum.Font.Code
KeyInput.PlaceholderText = "Enter Key..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 3)
KeyCorner.Parent = KeyInput

local SubmitButton = Instance.new("TextButton")
SubmitButton.Parent = AuthFrame
SubmitButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SubmitButton.BorderSizePixel = 0
SubmitButton.Position = UDim2.new(0, 50, 0, 150)
SubmitButton.Size = UDim2.new(0, 300, 0, 35)
SubmitButton.Font = Enum.Font.Code
SubmitButton.Text = "Submit"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.TextSize = 14

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 3)
SubmitCorner.Parent = SubmitButton

-- Main Frame (Command Bar)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(1, -350, 1, -60)
MainFrame.Size = UDim2.new(0, 340, 0, 50)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 5)
MainCorner.Parent = MainFrame

local PrefixLabel = Instance.new("TextLabel")
PrefixLabel.Parent = MainFrame
PrefixLabel.BackgroundTransparency = 1
PrefixLabel.Position = UDim2.new(0, 5, 0, 0)
PrefixLabel.Size = UDim2.new(0, 30, 1, 0)
PrefixLabel.Font = Enum.Font.Code
PrefixLabel.Text = ";"
PrefixLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PrefixLabel.TextSize = 20
PrefixLabel.TextXAlignment = Enum.TextXAlignment.Left

local CommandBar = Instance.new("TextBox")
CommandBar.Parent = MainFrame
CommandBar.BackgroundTransparency = 1
CommandBar.Position = UDim2.new(0, 25, 0, 0)
CommandBar.Size = UDim2.new(1, -30, 1, 0)
CommandBar.Font = Enum.Font.Code
CommandBar.PlaceholderText = "Command Bar"
CommandBar.Text = ""
CommandBar.TextColor3 = Color3.fromRGB(255, 255, 255)
CommandBar.TextSize = 16
CommandBar.TextXAlignment = Enum.TextXAlignment.Left
CommandBar.ClearTextOnFocus = false

-- Command List
local CmdList = Instance.new("Frame")
CmdList.Name = "CmdList"
CmdList.Parent = ScreenGui
CmdList.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
CmdList.BorderSizePixel = 0
CmdList.Position = UDim2.new(0.5, -250, 0.5, -200)
CmdList.Size = UDim2.new(0, 500, 0, 400)
CmdList.Visible = false
CmdList.Active = true
CmdList.Draggable = true

local CmdListCorner = Instance.new("UICorner")
CmdListCorner.CornerRadius = UDim.new(0, 5)
CmdListCorner.Parent = CmdList

local CmdListTitle = Instance.new("TextLabel")
CmdListTitle.Parent = CmdList
CmdListTitle.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
CmdListTitle.BorderSizePixel = 0
CmdListTitle.Size = UDim2.new(1, 0, 0, 40)
CmdListTitle.Font = Enum.Font.Code
CmdListTitle.Text = "Commands"
CmdListTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdListTitle.TextSize = 18

local CmdListTitleCorner = Instance.new("UICorner")
CmdListTitleCorner.CornerRadius = UDim.new(0, 5)
CmdListTitleCorner.Parent = CmdListTitle

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = CmdListTitle
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -40, 0, 0)
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Font = Enum.Font.Code
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 18

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Parent = CmdList
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollFrame.Size = UDim2.new(1, -20, 1, -60)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollBarThickness = 5
ScrollFrame.BorderSizePixel = 0

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Commands
local commands = {
    {name = "fly [speed]", desc = "Makes you fly (1-10 recommended for mobile)"},
    {name = "unfly", desc = "Disables fly"},
    {name = "noclip", desc = "Walk through walls"},
    {name = "unnoclip", desc = "Disables noclip"},
    {name = "god", desc = "God mode (invincibility)"},
    {name = "ungod", desc = "Disables god mode"},
    {name = "jump [power]", desc = "Changes jump power (1-100)"},
    {name = "espall", desc = "ESP on all players"},
    {name = "unesp", desc = "Removes ESP"},
    {name = "chams", desc = "Chams on all players"},
    {name = "unchams", desc = "Removes chams"},
    {name = "cmds", desc = "Shows command list"},
}

local function CreateCmdList()
    for _, cmd in ipairs(commands) do
        local CmdFrame = Instance.new("Frame")
        CmdFrame.Parent = ScrollFrame
        CmdFrame.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
        CmdFrame.BorderSizePixel = 0
        CmdFrame.Size = UDim2.new(1, 0, 0, 50)
        
        local CmdFrameCorner = Instance.new("UICorner")
        CmdFrameCorner.CornerRadius = UDim.new(0, 3)
        CmdFrameCorner.Parent = CmdFrame
        
        local CmdName = Instance.new("TextLabel")
        CmdName.Parent = CmdFrame
        CmdName.BackgroundTransparency = 1
        CmdName.Position = UDim2.new(0, 10, 0, 5)
        CmdName.Size = UDim2.new(1, -20, 0, 20)
        CmdName.Font = Enum.Font.Code
        CmdName.Text = cmd.name
        CmdName.TextColor3 = Color3.fromRGB(255, 255, 255)
        CmdName.TextSize = 14
        CmdName.TextXAlignment = Enum.TextXAlignment.Left
        
        local CmdDesc = Instance.new("TextLabel")
        CmdDesc.Parent = CmdFrame
        CmdDesc.BackgroundTransparency = 1
        CmdDesc.Position = UDim2.new(0, 10, 0, 25)
        CmdDesc.Size = UDim2.new(1, -20, 0, 20)
        CmdDesc.Font = Enum.Font.Code
        CmdDesc.Text = cmd.desc
        CmdDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
        CmdDesc.TextSize = 12
        CmdDesc.TextXAlignment = Enum.TextXAlignment.Left
    end
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end

CreateCmdList()

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end)

-- Mobile Fly Controls
local FlyGui = Instance.new("Frame")
FlyGui.Name = "FlyControls"
FlyGui.Parent = ScreenGui
FlyGui.BackgroundTransparency = 1
FlyGui.Position = UDim2.new(0, 10, 0.5, -100)
FlyGui.Size = UDim2.new(0, 200, 0, 200)
FlyGui.Visible = false

local function CreateFlyButton(name, position, key)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = FlyGui
    btn.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
    btn.BackgroundTransparency = 0.3
    btn.BorderSizePixel = 0
    btn.Position = position
    btn.Size = UDim2.new(0, 60, 0, 60)
    btn.Font = Enum.Font.Code
    btn.Text = key
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 20
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    return btn
end

local FlyW = CreateFlyButton("W", UDim2.new(0, 70, 0, 0), "▲")
local FlyS = CreateFlyButton("S", UDim2.new(0, 70, 0, 140), "▼")
local FlyA = CreateFlyButton("A", UDim2.new(0, 0, 0, 70), "◄")
local FlyD = CreateFlyButton("D", UDim2.new(0, 140, 0, 70), "►")
local FlyUp = CreateFlyButton("Up", UDim2.new(0, 70, 0, 70), "↑")

-- Mobile Fly State
local flyStates = {
    forward = false,
    backward = false,
    left = false,
    right = false,
    up = false,
    down = false
}

FlyW.MouseButton1Down:Connect(function() flyStates.forward = true end)
FlyW.MouseButton1Up:Connect(function() flyStates.forward = false end)

FlyS.MouseButton1Down:Connect(function() flyStates.backward = true end)
FlyS.MouseButton1Up:Connect(function() flyStates.backward = false end)

FlyA.MouseButton1Down:Connect(function() flyStates.left = true end)
FlyA.MouseButton1Up:Connect(function() flyStates.left = false end)

FlyD.MouseButton1Down:Connect(function() flyStates.right = true end)
FlyD.MouseButton1Up:Connect(function() flyStates.right = false end)

FlyUp.MouseButton1Down:Connect(function() flyStates.up = true end)
FlyUp.MouseButton1Up:Connect(function() flyStates.up = false end)

--[[
    КОД 2 из 2
    Полностью рабочий Fly + God Mode
]]

-- ESP Functions
local function CreateESP(player)
    if player == LocalPlayer then return end
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not hrp or not hum then return end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP"
    billboard.Parent = hrp
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 100, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Parent = billboard
    nameLabel.BackgroundTransparency = 1
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.Font = Enum.Font.Code
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextSize = 12
    nameLabel.TextStrokeTransparency = 0
    
    local healthLabel = Instance.new("TextLabel")
    healthLabel.Parent = billboard
    healthLabel.BackgroundTransparency = 1
    healthLabel.Position = UDim2.new(0, 0, 0.5, 0)
    healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
    healthLabel.Font = Enum.Font.Code
    healthLabel.Text = math.floor(hum.Health) .. " HP"
    healthLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    healthLabel.TextSize = 12
    healthLabel.TextStrokeTransparency = 0
    
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ESPBox"
    box.Parent = hrp
    box.Size = char:GetExtentsSize()
    box.Color3 = Color3.fromRGB(255, 0, 0)
    box.Transparency = 0.7
    box.AlwaysOnTop = true
    box.ZIndex = 5
    box.Adornee = hrp
    
    local healthConn = hum.HealthChanged:Connect(function()
        healthLabel.Text = math.floor(hum.Health) .. " HP"
    end)
    
    table.insert(espObjects, {billboard, box, healthConn})
end

local function RemoveESP()
    for _, obj in ipairs(espObjects) do
        if obj[1] then obj[1]:Destroy() end
        if obj[2] then obj[2]:Destroy() end
        if obj[3] then obj[3]:Disconnect() end
    end
    espObjects = {}
    espEnabled = false
end

-- Chams Functions
local function CreateChams(player)
    if player == LocalPlayer then return end
    local char = player.Character
    if not char then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "Chams"
    highlight.Parent = char
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    
    table.insert(chamsObjects, highlight)
end

local function RemoveChams()
    for _, obj in ipairs(chamsObjects) do
        obj:Destroy()
    end
    chamsObjects = {}
    chamsEnabled = false
end

-- FLY FUNCTION (Fixed for Mobile + Desktop)
local function StartFly(speed)
    if flying then return end
    flying = true
    flySpeed = speed or 1
    
    local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    if isMobile then
        FlyGui.Visible = true
    end
    
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 9e4
    bodyGyro.maxTorque = Vector3.new(9e4, 9e4, 9e4)
    bodyGyro.cframe = RootPart.CFrame
    bodyGyro.Parent = RootPart
    
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.velocity = Vector3.new(0, 0, 0)
    bodyVelocity.maxForce = Vector3.new(9e4, 9e4, 9e4)
    bodyVelocity.Parent = RootPart
    
    local flyLoop
    flyLoop = RunService.Heartbeat:Connect(function()
        if not flying or not RootPart or not RootPart.Parent then
            if flyLoop then flyLoop:Disconnect() end
            return
        end
        
        local cam = workspace.CurrentCamera
        local direction = Vector3.new()
        
        -- Desktop Controls
        if UserInputService:IsKeyDown(Enum.KeyCode.W) or flyStates.forward then
            direction = direction + cam.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) or flyStates.backward then
            direction = direction - cam.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) or flyStates.left then
            direction = direction - cam.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) or flyStates.right then
            direction = direction + cam.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) or flyStates.up then
            direction = direction + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or flyStates.down then
            direction = direction - Vector3.new(0, 1, 0)
        end
        
        if direction.Magnitude > 0 then
            direction = direction.Unit
        end
        
        bodyVelocity.velocity = direction * (flySpeed * 50)
        bodyGyro.cframe = cam.CFrame
        
        Humanoid.PlatformStand = true
    end)
end

local function StopFly()
    flying = false
    FlyGui.Visible = false
    
    if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
    if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
    
    if Humanoid then
        Humanoid.PlatformStand = false
    end
    
    for k in pairs(flyStates) do
        flyStates[k] = false
    end
end

-- NOCLIP
local function StartNoclip()
    noclipConnection = RunService.Stepped:Connect(function()
        if Character then
            for _, part in pairs(Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

local function StopNoclip()
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
end

-- GOD MODE (Fixed - Complete Invincibility)
local function EnableGod()
    if godMode then return end
    godMode = true
    
    -- Remove all damage scripts
    if Character:FindFirstChild("Health") then
        Character.Health:Destroy()
    end
    
    -- Set max health
    Humanoid.MaxHealth = math.huge
    Humanoid.Health = math.huge
    
    -- Prevent damage
    godConnection = Humanoid.HealthChanged:Connect(function(health)
        if godMode and health < Humanoid.MaxHealth then
            Humanoid.Health = Humanoid.MaxHealth
        end
    end)
    
    -- Prevent death from falling/spikes
    for _, v in pairs(Character:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then
            v.CanCollide = true
            v.Massless = true
        end
    end
    
    -- Prevent ragdoll
    if Character:FindFirstChild("Humanoid") then
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    end
end

local function DisableGod()
    godMode = false
    if godConnection then
        godConnection:Disconnect()
        godConnection = nil
    end
    if Humanoid then
        Humanoid.MaxHealth = 100
        Humanoid.Health = 100
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
    end
end

-- Notification
local function Notify(text)
    PrefixLabel.Text = text
    task.wait(2)
    PrefixLabel.Text = ";"
end

-- Command Handler
local function ExecuteCommand(cmd)
    local args = cmd:lower():split(" ")
    local command = args[1]
    
    if command == "fly" then
        local speed = tonumber(args[2]) or 1
        StartFly(speed)
        Notify("✓")
        
    elseif command == "unfly" then
        StopFly()
        Notify("✓")
        
    elseif command == "noclip" then
        StartNoclip()
        Notify("✓")
        
    elseif command == "unnoclip" then
        StopNoclip()
        Notify("✓")
        
    elseif command == "god" then
        EnableGod()
        Notify("✓")
        
    elseif command == "ungod" then
        DisableGod()
        Notify("✓")
        
    elseif command == "jump" then
        local power = tonumber(args[2]) or 50
        Humanoid.JumpPower = power
        Humanoid.UseJumpPower = true
        Notify("✓")
        
    elseif command == "espall" then
        espEnabled = true
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character then CreateESP(p) end
        end
        Notify("✓")
        
    elseif command == "unesp" then
        RemoveESP()
        Notify("✓")
        
    elseif command == "chams" then
        chamsEnabled = true
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character then CreateChams(p) end
        end
        Notify("✓")
        
    elseif command == "unchams" then
        RemoveChams()
        Notify("✓")
        
    elseif command == "cmds" then
        CmdList.Visible = not CmdList.Visible
        
    else
        Notify("✗")
    end
end

-- Auth Check
local function CheckKey()
    if KeyInput.Text == ADMIN_KEY then
        AuthFrame:TweenPosition(UDim2.new(0.5, -200, -0.5, 0), "In", "Quad", 0.5, true)
        task.wait(0.5)
        AuthFrame.Visible = false
        MainFrame.Visible = true
        MainFrame:TweenPosition(UDim2.new(1, -350, 1, -70), "Out", "Quad", 0.5, true)
        print("[IY] Loaded successfully")
    else
        AuthTitle.Text = "Invalid Key"
        AuthTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
        task.wait(1)
        AuthTitle.Text = "Infinity Yield"
        AuthTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        KeyInput.Text = ""
    end
end

-- Event Connections
SubmitButton.MouseButton1Click:Connect(CheckKey)
KeyInput.FocusLost:Connect(function(enter) if enter then CheckKey() end end)
CommandBar.FocusLost:Connect(function(enter)
    if enter and CommandBar.Text ~= "" then
        ExecuteCommand(CommandBar.Text)
        CommandBar.Text = ""
    end
end)
CloseBtn.MouseButton1Click:Connect(function() CmdList.Visible = false end)

-- Character Reset Handler
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    RootPart = char:WaitForChild("HumanoidRootPart")
    StopFly()
    StopNoclip()
    DisableGod()
end)

-- Player ESP/Chams Auto-add
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        if espEnabled then CreateESP(player) end
        if chamsEnabled then CreateChams(player) end
    end)
end)

AuthFrame:TweenPosition(UDim2.new(0.5, -200, 0.5, -100), "Out", "Quad", 0.5, true)
