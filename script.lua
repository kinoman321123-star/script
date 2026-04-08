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

--[[
    КОД 3 из 3
    Дополнительные функции
]]

-- Переменные для новых функций
local isInvisible = false
local originalTransparency = {}
local speedEnabled = false
local speedValue = 16
local originalSpeed = 16
local tpClickEnabled = false
local tpClickConnection

-- ==================== INVISIBILITY ====================
local function EnableInvisibility()
    if isInvisible then return end
    isInvisible = true
    
    -- Сохраняем оригинальную прозрачность
    for _, part in pairs(Character:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("Decal") or part:IsA("Texture") then
            originalTransparency[part] = part.Transparency
            part.Transparency = 1
        elseif part:IsA("Accessory") then
            local handle = part:FindFirstChild("Handle")
            if handle then
                originalTransparency[handle] = handle.Transparency
                handle.Transparency = 1
            end
        end
    end
    
    -- Скрываем голову
    if Character:FindFirstChild("Head") then
        local face = Character.Head:FindFirstChild("face")
        if face then
            originalTransparency[face] = face.Transparency
            face.Transparency = 1
        end
    end
    
    -- Делаем HumanoidRootPart видимым для себя (чтобы видеть где ты)
    if RootPart then
        RootPart.Transparency = 0.5
    end
    
    Notify("👻 Invisible ON")
end

local function DisableInvisibility()
    if not isInvisible then return end
    isInvisible = false
    
    -- Восстанавливаем оригинальную прозрачность
    for part, transparency in pairs(originalTransparency) do
        if part and part.Parent then
            part.Transparency = transparency
        end
    end
    
    originalTransparency = {}
    Notify("👁️ Visible")
end

-- ==================== SPEED ====================
local function SetSpeed(speed)
    if not Humanoid then return end
    speedEnabled = true
    speedValue = math.clamp(speed, 16, 500)
    
    -- Сохраняем оригинальную скорость
    if not originalSpeed or originalSpeed == speedValue then
        originalSpeed = 16
    end
    
    Humanoid.WalkSpeed = speedValue
    Notify("🏃 Speed: " .. speedValue)
end

local function ResetSpeed()
    speedEnabled = false
    if Humanoid then
        Humanoid.WalkSpeed = originalSpeed or 16
    end
    Notify("🚶 Normal Speed")
end

-- Постоянное обновление скорости (на случай если игра сбрасывает)
RunService.Heartbeat:Connect(function()
    if speedEnabled and Humanoid then
        if Humanoid.WalkSpeed ~= speedValue then
            Humanoid.WalkSpeed = speedValue
        end
    end
end)

-- ==================== TP CLICK (Mobile + Desktop) ====================
local function EnableTPClick()
    if tpClickEnabled then return end
    tpClickEnabled = true
    
    local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    
    if isMobile then
        -- Для мобильных устройств (тап по экрану)
        tpClickConnection = UserInputService.TouchTap:Connect(function(touchPositions, gameProcessed)
            if gameProcessed then return end
            if not RootPart then return end
            
            local touchPos = touchPositions[1]
            if not touchPos then return end
            
            local camera = workspace.CurrentCamera
            local unitRay = camera:ScreenPointToRay(touchPos.X, touchPos.Y)
            local ray = Ray.new(unitRay.Origin, unitRay.Direction * 500)
            
            local hit, position = workspace:FindPartOnRayWithIgnoreList(
                ray,
                {Character, camera},
                false,
                true
            )
            
            if hit then
                RootPart.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
            end
        end)
    else
        -- Для ПК (клик мышью с зажатым Ctrl)
        tpClickConnection = Mouse.Button1Down:Connect(function()
            if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then return end
            if not RootPart then return end
            
            local target = Mouse.Target
            if target then
                local position = Mouse.Hit.Position
                RootPart.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
            end
        end)
    end
    
    Notify("📍 TP Click ON")
end

local function DisableTPClick()
    tpClickEnabled = false
    if tpClickConnection then
        tpClickConnection:Disconnect()
        tpClickConnection = nil
    end
    Notify("📍 TP Click OFF")
end

-- ==================== ВИЗУАЛЬНЫЙ ИНДИКАТОР TP CLICK ====================
local TPIndicator = Instance.new("Frame")
TPIndicator.Name = "TPIndicator"
TPIndicator.Parent = ScreenGui
TPIndicator.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
TPIndicator.BackgroundTransparency = 0.3
TPIndicator.BorderSizePixel = 0
TPIndicator.Position = UDim2.new(0.5, -100, 0, 10)
TPIndicator.Size = UDim2.new(0, 200, 0, 30)
TPIndicator.Visible = false

local TPIndicatorCorner = Instance.new("UICorner")
TPIndicatorCorner.CornerRadius = UDim.new(0, 5)
TPIndicatorCorner.Parent = TPIndicator

local TPIndicatorText = Instance.new("TextLabel")
TPIndicatorText.Parent = TPIndicator
TPIndicatorText.BackgroundTransparency = 1
TPIndicatorText.Size = UDim2.new(1, 0, 1, 0)
TPIndicatorText.Font = Enum.Font.Code
TPIndicatorText.Text = "📍 Tap to Teleport"
TPIndicatorText.TextColor3 = Color3.fromRGB(255, 255, 255)
TPIndicatorText.TextSize = 14

-- Обновление индикатора
RunService.Heartbeat:Connect(function()
    TPIndicator.Visible = tpClickEnabled
    if tpClickEnabled then
        local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
        if isMobile then
            TPIndicatorText.Text = "📍 Tap to Teleport"
        else
            TPIndicatorText.Text = "📍 Ctrl + Click to TP"
        end
    end
end)

-- ==================== ОБНОВЛЕНИЕ КОМАНД ====================
-- Добавляем новые команды в список
table.insert(commands, {name = "invis", desc = "Makes you invisible"})
table.insert(commands, {name = "vis", desc = "Makes you visible"})
table.insert(commands, {name = "speed [number]", desc = "Changes walk speed (16-500)"})
table.insert(commands, {name = "unspeed", desc = "Resets speed to normal"})
table.insert(commands, {name = "tpclick", desc = "Teleport by clicking/tapping"})
table.insert(commands, {name = "untpclick", desc = "Disables teleport click"})

-- Обновляем ScrollFrame с новыми командами
local function UpdateCommandList()
    for _, child in pairs(ScrollFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
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

UpdateCommandList()

-- ==================== ОБНОВЛЕНИЕ ОБРАБОТЧИКА КОМАНД ====================
local originalExecuteCommand = ExecuteCommand

function ExecuteCommand(cmd)
    local args = cmd:lower():split(" ")
    local command = args[1]
    
    -- Новые команды
    if command == "invis" then
        EnableInvisibility()
        
    elseif command == "vis" then
        DisableInvisibility()
        
    elseif command == "speed" then
        local speed = tonumber(args[2]) or 50
        SetSpeed(speed)
        
    elseif command == "unspeed" then
        ResetSpeed()
        
    elseif command == "tpclick" then
        EnableTPClick()
        
    elseif command == "untpclick" then
        DisableTPClick()
        
    else
        -- Старые команды
        originalExecuteCommand(cmd)
    end
end

-- ==================== ОБНОВЛЕНИЕ ПРИ РЕСПАВНЕ ====================
local originalCharacterAdded = LocalPlayer.CharacterAdded:Connect(function() end)
originalCharacterAdded:Disconnect()

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    RootPart = char:WaitForChild("HumanoidRootPart")
    
    -- Сброс всех эффектов
    StopFly()
    StopNoclip()
    DisableGod()
    DisableInvisibility()
    ResetSpeed()
    DisableTPClick()
    
    originalTransparency = {}
    isInvisible = false
    speedEnabled = false
    tpClickEnabled = false
    
    -- Восстанавливаем скорость если была включена
    task.wait(0.5)
    if speedEnabled then
        SetSpeed(speedValue)
    end
end)

-- ==================== ANTI-CHEAT BYPASS (для невидимости) ====================
-- Некоторые игры детектят невидимость, этот код обходит простую проверку
RunService.Heartbeat:Connect(function()
    if isInvisible and Character then
        -- Периодически обновляем невидимость
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                if part.Transparency ~= 1 then
                    part.Transparency = 1
                end
            end
        end
    end
end)

-- ==================== ДОПОЛНИТЕЛЬНЫЕ УЛУЧШЕНИЯ ====================

-- Автоматическое применение god mode при получении урона
if godMode then
    local dmgConnection
    dmgConnection = Humanoid.HealthChanged:Connect(function(health)
        if godMode and health < Humanoid.MaxHealth then
            Humanoid.Health = Humanoid.MaxHealth
        end
    end)
end

-- Визуальный фидбек для скорости
local SpeedIndicator = Instance.new("TextLabel")
SpeedIndicator.Parent = ScreenGui
SpeedIndicator.BackgroundTransparency = 1
SpeedIndicator.Position = UDim2.new(0, 10, 1, -50)
SpeedIndicator.Size = UDim2.new(0, 150, 0, 30)
SpeedIndicator.Font = Enum.Font.Code
SpeedIndicator.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedIndicator.TextSize = 14
SpeedIndicator.TextXAlignment = Enum.TextXAlignment.Left
SpeedIndicator.TextStrokeTransparency = 0
SpeedIndicator.Visible = false

RunService.Heartbeat:Connect(function()
    if speedEnabled and Humanoid then
        SpeedIndicator.Visible = true
        SpeedIndicator.Text = "🏃 Speed: " .. math.floor(Humanoid.WalkSpeed)
    else
        SpeedIndicator.Visible = false
    end
end)

-- Визуальный фидбек для невидимости
local InvisIndicator = Instance.new("TextLabel")
InvisIndicator.Parent = ScreenGui
InvisIndicator.BackgroundTransparency = 1
InvisIndicator.Position = UDim2.new(0, 10, 1, -80)
InvisIndicator.Size = UDim2.new(0, 150, 0, 30)
InvisIndicator.Font = Enum.Font.Code
InvisIndicator.Text = "👻 Invisible"
InvisIndicator.TextColor3 = Color3.fromRGB(150, 150, 255)
InvisIndicator.TextSize = 14
InvisIndicator.TextXAlignment = Enum.TextXAlignment.Left
InvisIndicator.TextStrokeTransparency = 0
InvisIndicator.Visible = false

RunService.Heartbeat:Connect(function()
    InvisIndicator.Visible = isInvisible
end)

print("[IY] Extended functions loaded")
print("[IY] New commands: invis, vis, speed [num], unspeed, tpclick, untpclick")

--[[
    КОД 4 из 4
    CFG System + Spider + TPGun
]]

-- ==================== CFG SYSTEM ====================
local savedConfigs = {}
local CFGFrame
local CFGCommandsList
local currentCFGName = ""
local tempCommands = {}

-- Создание CFG UI
local function CreateCFGUI()
    CFGFrame = Instance.new("Frame")
    CFGFrame.Name = "CFGFrame"
    CFGFrame.Parent = ScreenGui
    CFGFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
    CFGFrame.BorderSizePixel = 0
    CFGFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
    CFGFrame.Size = UDim2.new(0, 400, 0, 400)
    CFGFrame.Visible = false
    CFGFrame.Active = true
    CFGFrame.Draggable = true
    
    local CFGCorner = Instance.new("UICorner")
    CFGCorner.CornerRadius = UDim.new(0, 5)
    CFGCorner.Parent = CFGFrame
    
    -- Title Bar
    local CFGTitle = Instance.new("TextLabel")
    CFGTitle.Parent = CFGFrame
    CFGTitle.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
    CFGTitle.BorderSizePixel = 0
    CFGTitle.Size = UDim2.new(1, 0, 0, 40)
    CFGTitle.Font = Enum.Font.Code
    CFGTitle.Text = "CFG Creator"
    CFGTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    CFGTitle.TextSize = 18
    
    local CFGTitleCorner = Instance.new("UICorner")
    CFGTitleCorner.CornerRadius = UDim.new(0, 5)
    CFGTitleCorner.Parent = CFGTitle
    
    -- Close Button
    local CFGCloseBtn = Instance.new("TextButton")
    CFGCloseBtn.Parent = CFGTitle
    CFGCloseBtn.BackgroundTransparency = 1
    CFGCloseBtn.Position = UDim2.new(1, -40, 0, 0)
    CFGCloseBtn.Size = UDim2.new(0, 40, 0, 40)
    CFGCloseBtn.Font = Enum.Font.Code
    CFGCloseBtn.Text = "X"
    CFGCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CFGCloseBtn.TextSize = 18
    
    -- CFG Name Label
    local CFGNameLabel = Instance.new("TextLabel")
    CFGNameLabel.Parent = CFGFrame
    CFGNameLabel.BackgroundTransparency = 1
    CFGNameLabel.Position = UDim2.new(0, 10, 0, 50)
    CFGNameLabel.Size = UDim2.new(1, -20, 0, 30)
    CFGNameLabel.Font = Enum.Font.Code
    CFGNameLabel.Text = "Config: " .. currentCFGName
    CFGNameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    CFGNameLabel.TextSize = 14
    CFGNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Command Input
    local CmdInput = Instance.new("TextBox")
    CmdInput.Parent = CFGFrame
    CmdInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    CmdInput.BorderSizePixel = 0
    CmdInput.Position = UDim2.new(0, 10, 0, 90)
    CmdInput.Size = UDim2.new(1, -90, 0, 35)
    CmdInput.Font = Enum.Font.Code
    CmdInput.PlaceholderText = "Enter command..."
    CmdInput.Text = ""
    CmdInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    CmdInput.TextSize = 14
    
    local CmdInputCorner = Instance.new("UICorner")
    CmdInputCorner.CornerRadius = UDim.new(0, 3)
    CmdInputCorner.Parent = CmdInput
    
    -- Add Button (+)
    local AddBtn = Instance.new("TextButton")
    AddBtn.Parent = CFGFrame
    AddBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    AddBtn.BorderSizePixel = 0
    AddBtn.Position = UDim2.new(1, -70, 0, 90)
    AddBtn.Size = UDim2.new(0, 60, 0, 35)
    AddBtn.Font = Enum.Font.Code
    AddBtn.Text = "+"
    AddBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    AddBtn.TextSize = 24
    
    local AddBtnCorner = Instance.new("UICorner")
    AddBtnCorner.CornerRadius = UDim.new(0, 3)
    AddBtnCorner.Parent = AddBtn
    
    -- Commands List
    CFGCommandsList = Instance.new("ScrollingFrame")
    CFGCommandsList.Parent = CFGFrame
    CFGCommandsList.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
    CFGCommandsList.BorderSizePixel = 0
    CFGCommandsList.Position = UDim2.new(0, 10, 0, 135)
    CFGCommandsList.Size = UDim2.new(1, -20, 0, 200)
    CFGCommandsList.CanvasSize = UDim2.new(0, 0, 0, 0)
    CFGCommandsList.ScrollBarThickness = 5
    
    local CFGListCorner = Instance.new("UICorner")
    CFGListCorner.CornerRadius = UDim.new(0, 3)
    CFGListCorner.Parent = CFGCommandsList
    
    local CFGListLayout = Instance.new("UIListLayout")
    CFGListLayout.Parent = CFGCommandsList
    CFGListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    CFGListLayout.Padding = UDim.new(0, 5)
    
    -- Save Button
    local SaveBtn = Instance.new("TextButton")
    SaveBtn.Parent = CFGFrame
    SaveBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    SaveBtn.BorderSizePixel = 0
    SaveBtn.Position = UDim2.new(0, 10, 0, 345)
    SaveBtn.Size = UDim2.new(0.5, -15, 0, 45)
    SaveBtn.Font = Enum.Font.Code
    SaveBtn.Text = "💾 SAVE"
    SaveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SaveBtn.TextSize = 16
    
    local SaveBtnCorner = Instance.new("UICorner")
    SaveBtnCorner.CornerRadius = UDim.new(0, 3)
    SaveBtnCorner.Parent = SaveBtn
    
    -- Cancel Button
    local CancelBtn = Instance.new("TextButton")
    CancelBtn.Parent = CFGFrame
    CancelBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CancelBtn.BorderSizePixel = 0
    CancelBtn.Position = UDim2.new(0.5, 5, 0, 345)
    CancelBtn.Size = UDim2.new(0.5, -15, 0, 45)
    CancelBtn.Font = Enum.Font.Code
    CancelBtn.Text = "✕ CANCEL"
    CancelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CancelBtn.TextSize = 16
    
    local CancelBtnCorner = Instance.new("UICorner")
    CancelBtnCorner.CornerRadius = UDim.new(0, 3)
    CancelBtnCorner.Parent = CancelBtn
    
    -- Add Command Function
    AddBtn.MouseButton1Click:Connect(function()
        local cmdText = CmdInput.Text
        if cmdText ~= "" then
            table.insert(tempCommands, cmdText)
            
            local CmdItem = Instance.new("Frame")
            CmdItem.Parent = CFGCommandsList
            CmdItem.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            CmdItem.BorderSizePixel = 0
            CmdItem.Size = UDim2.new(1, 0, 0, 35)
            
            local CmdItemCorner = Instance.new("UICorner")
            CmdItemCorner.CornerRadius = UDim.new(0, 3)
            CmdItemCorner.Parent = CmdItem
            
            local CmdText = Instance.new("TextLabel")
            CmdText.Parent = CmdItem
            CmdText.BackgroundTransparency = 1
            CmdText.Position = UDim2.new(0, 10, 0, 0)
            CmdText.Size = UDim2.new(1, -50, 1, 0)
            CmdText.Font = Enum.Font.Code
            CmdText.Text = cmdText
            CmdText.TextColor3 = Color3.fromRGB(255, 255, 255)
            CmdText.TextSize = 13
            CmdText.TextXAlignment = Enum.TextXAlignment.Left
            
            local RemoveBtn = Instance.new("TextButton")
            RemoveBtn.Parent = CmdItem
            RemoveBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
            RemoveBtn.BorderSizePixel = 0
            RemoveBtn.Position = UDim2.new(1, -35, 0, 5)
            RemoveBtn.Size = UDim2.new(0, 30, 0, 25)
            RemoveBtn.Font = Enum.Font.Code
            RemoveBtn.Text = "✕"
            RemoveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            RemoveBtn.TextSize = 14
            
            local RemoveBtnCorner = Instance.new("UICorner")
            RemoveBtnCorner.CornerRadius = UDim.new(0, 3)
            RemoveBtnCorner.Parent = RemoveBtn
            
            RemoveBtn.MouseButton1Click:Connect(function()
                for i, cmd in ipairs(tempCommands) do
                    if cmd == cmdText then
                        table.remove(tempCommands, i)
                        break
                    end
                end
                CmdItem:Destroy()
                CFGCommandsList.CanvasSize = UDim2.new(0, 0, 0, CFGListLayout.AbsoluteContentSize.Y)
            end)
            
            CmdInput.Text = ""
            CFGCommandsList.CanvasSize = UDim2.new(0, 0, 0, CFGListLayout.AbsoluteContentSize.Y)
        end
    end)
    
    -- Save Config
    SaveBtn.MouseButton1Click:Connect(function()
        if #tempCommands > 0 then
            savedConfigs[currentCFGName] = tempCommands
            Notify("💾 Config '" .. currentCFGName .. "' saved!")
            CFGFrame.Visible = false
            tempCommands = {}
        else
            Notify("⚠️ Add commands first!")
        end
    end)
    
    -- Cancel
    CancelBtn.MouseButton1Click:Connect(function()
        CFGFrame.Visible = false
        tempCommands = {}
    end)
    
    CFGCloseBtn.MouseButton1Click:Connect(function()
        CFGFrame.Visible = false
        tempCommands = {}
    end)
    
    CFGListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        CFGCommandsList.CanvasSize = UDim2.new(0, 0, 0, CFGListLayout.AbsoluteContentSize.Y)
    end)
end

CreateCFGUI()

-- ==================== SPIDER (Лазание по стенам) ====================
local spiderEnabled = false
local spiderConnection

local function EnableSpider()
    if spiderEnabled then return end
    spiderEnabled = true
    
    spiderConnection = RunService.Heartbeat:Connect(function()
        if not spiderEnabled or not Character or not Humanoid then return end
        
        -- Проверяем столкновение со стенами
        local ray = Ray.new(
            RootPart.Position,
            RootPart.CFrame.LookVector * 2
        )
        
        local hit, position, normal = workspace:FindPartOnRayWithIgnoreList(
            ray,
            {Character}
        )
        
        if hit and hit:IsA("BasePart") then
            -- Если касаемся стены/потолка
            local bodyVel = RootPart:FindFirstChild("SpiderVelocity")
            if not bodyVel then
                bodyVel = Instance.new("BodyVelocity")
                bodyVel.Name = "SpiderVelocity"
                bodyVel.MaxForce = Vector3.new(0, 0, 0)
                bodyVel.Parent = RootPart
            end
            
            -- Проверяем нажатие клавиш
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                bodyVel.MaxForce = Vector3.new(4000, 4000, 4000)
                bodyVel.Velocity = normal * -20 -- Движение к стене
            elseif UserInputService:IsKeyDown(Enum.KeyCode.S) then
                bodyVel.MaxForce = Vector3.new(4000, 4000, 4000)
                bodyVel.Velocity = normal * 20 -- Отталкивание от стены
            else
                bodyVel.MaxForce = Vector3.new(0, 4000, 0)
                bodyVel.Velocity = Vector3.new(0, 2, 0) -- Удержание на стене
            end
            
            Humanoid.PlatformStand = false
        else
            -- Если не касаемся стены, убираем BodyVelocity
            local bodyVel = RootPart:FindFirstChild("SpiderVelocity")
            if bodyVel then
                bodyVel:Destroy()
            end
        end
    end)
    
    Notify("🕷️ Spider ON")
end

local function DisableSpider()
    spiderEnabled = false
    if spiderConnection then
        spiderConnection:Disconnect()
        spiderConnection = nil
    end
    
    local bodyVel = RootPart:FindFirstChild("SpiderVelocity")
    if bodyVel then
        bodyVel:Destroy()
    end
    
    Notify("🕷️ Spider OFF")
end

-- ==================== TPGUN (Murder Mystery 2) ====================
local function TPToGun()
    if not workspace:FindFirstChild("Normal") then
        Notify("⚠️ Not in MM2 game")
        return
    end
    
    local found = false
    
    -- Ищем GunDrop (упавший пистолет)
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name == "GunDrop" and obj:IsA("Model") then
            local handle = obj:FindFirstChild("Handle")
            if handle and RootPart then
                RootPart.CFrame = handle.CFrame + Vector3.new(0, 3, 0)
                Notify("🔫 TP to Gun!")
                found = true
                break
            end
        end
    end
    
    -- Если не нашли GunDrop, ищем Gun в руках шерифа
    if not found then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local gun = player.Character:FindFirstChild("Gun") or 
                           player.Backpack:FindFirstChild("Gun")
                
                if gun and RootPart then
                    -- ТП к шерифу (осторожно!)
                    local sheriffRoot = player.Character:FindFirstChild("HumanoidRootPart")
                    if sheriffRoot then
                        RootPart.CFrame = sheriffRoot.CFrame + Vector3.new(5, 0, 0)
                        Notify("🔫 TP near Sheriff!")
                        found = true
                        break
                    end
                end
            end
        end
    end
    
    if not found then
        Notify("❌ Gun not found!")
    end
end

-- ==================== ОБНОВЛЕНИЕ КОМАНД ====================
table.insert(commands, {name = "cfg create [name]", desc = "Create new config"})
table.insert(commands, {name = "cfg [name]", desc = "Load saved config"})
table.insert(commands, {name = "spider", desc = "Climb walls and ceilings"})
table.insert(commands, {name = "unspider", desc = "Disable spider mode"})
table.insert(commands, {name = "tpgun", desc = "TP to gun (MM2 only)"})

UpdateCommandList()

-- ==================== ОБНОВЛЕНИЕ ОБРАБОТЧИКА КОМАНД ====================
local originalExecuteCommand2 = ExecuteCommand

function ExecuteCommand(cmd)
    local args = cmd:lower():split(" ")
    local command = args[1]
    
    -- CFG Commands
    if command == "cfg" then
        if args[2] == "create" and args[3] then
            currentCFGName = args[3]
            tempCommands = {}
            CFGFrame.Visible = true
            
            -- Очищаем список команд
            for _, child in pairs(CFGCommandsList:GetChildren()) do
                if child:IsA("Frame") then
                    child:Destroy()
                end
            end
            
            -- Обновляем название
            local nameLabel = CFGFrame:FindFirstChild("TextLabel", true)
            if nameLabel and nameLabel.Text:find("Config:") then
                nameLabel.Text = "Config: " .. currentCFGName
            end
            
            Notify("📝 Creating config: " .. currentCFGName)
            
        elseif args[2] and savedConfigs[args[2]] then
            -- Загрузка конфига
            local configName = args[2]
            Notify("⚙️ Loading: " .. configName)
            
            task.wait(0.5)
            
            for _, savedCmd in ipairs(savedConfigs[configName]) do
                ExecuteCommand(savedCmd)
                task.wait(0.1)
            end
            
            Notify("✅ Config loaded!")
        else
            Notify("❌ Config not found!")
        end
        
    -- Spider
    elseif command == "spider" then
        EnableSpider()
        
    elseif command == "unspider" then
        DisableSpider()
        
    -- TPGun
    elseif command == "tpgun" then
        TPToGun()
        
    else
        -- Старые команды
        originalExecuteCommand2(cmd)
    end
end

-- ==================== ВИЗУАЛЬНЫЙ ИНДИКАТОР SPIDER ====================
local SpiderIndicator = Instance.new("TextLabel")
SpiderIndicator.Parent = ScreenGui
SpiderIndicator.BackgroundTransparency = 1
SpiderIndicator.Position = UDim2.new(0, 10, 1, -110)
SpiderIndicator.Size = UDim2.new(0, 150, 0, 30)
SpiderIndicator.Font = Enum.Font.Code
SpiderIndicator.Text = "🕷️ Spider Mode"
SpiderIndicator.TextColor3 = Color3.fromRGB(150, 255, 150)
SpiderIndicator.TextSize = 14
SpiderIndicator.TextXAlignment = Enum.TextXAlignment.Left
SpiderIndicator.TextStrokeTransparency = 0
SpiderIndicator.Visible = false

RunService.Heartbeat:Connect(function()
    SpiderIndicator.Visible = spiderEnabled
end)

-- ==================== ОБНОВЛЕНИЕ ПРИ РЕСПАВНЕ ====================
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    RootPart = char:WaitForChild("HumanoidRootPart")
    
    -- Сброс spider
    DisableSpider()
end)

print("[IY] CFG System loaded")
print("[IY] Spider mode loaded")
print("[IY] TPGun (MM2) loaded")
print("[IY] Commands: cfg create [name], cfg [name], spider, unspider, tpgun")
