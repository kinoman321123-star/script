--[[
    Infinity Yield Clone v1.0
    Оптимизация для мобильных устройств
    
    КОД 1 из 2
]]

local ADMIN_KEY = "adminkey"

local ScreenGui = Instance.new("ScreenGui")
local AuthFrame = Instance.new("Frame")
local AuthTitle = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local SubmitButton = Instance.new("TextButton")
local MainFrame = Instance.new("Frame")
local CommandBar = Instance.new("TextBox")
local TitleLabel = Instance.new("TextLabel")
local CommandList = Instance.new("Frame")
local ListTitle = Instance.new("TextLabel")
local ScrollFrame = Instance.new("ScrollingFrame")
local CloseButton = Instance.new("TextButton")

ScreenGui.Name = "InfinityYieldClone"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- ==================== AUTH FRAME (Mobile) ====================
AuthFrame.Name = "AuthFrame"
AuthFrame.Parent = ScreenGui
AuthFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
AuthFrame.BorderSizePixel = 0
AuthFrame.Position = UDim2.new(0.5, -140, 0.5, -90)
AuthFrame.Size = UDim2.new(0, 280, 0, 180)
AuthFrame.Active = true
AuthFrame.Draggable = true

local AuthCorner = Instance.new("UICorner")
AuthCorner.CornerRadius = UDim.new(0, 15)
AuthCorner.Parent = AuthFrame

local AuthStroke = Instance.new("UIStroke")
AuthStroke.Color = Color3.fromRGB(100, 200, 255)
AuthStroke.Thickness = 2.5
AuthStroke.Transparency = 0
AuthStroke.Parent = AuthFrame

-- Градиент для Auth
local AuthGradient = Instance.new("UIGradient")
AuthGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 40))
}
AuthGradient.Rotation = 45
AuthGradient.Parent = AuthFrame

AuthTitle.Name = "AuthTitle"
AuthTitle.Parent = AuthFrame
AuthTitle.BackgroundTransparency = 1
AuthTitle.Position = UDim2.new(0, 0, 0, 15)
AuthTitle.Size = UDim2.new(1, 0, 0, 35)
AuthTitle.Font = Enum.Font.GothamBold
AuthTitle.Text = "🔐 IY CLONE"
AuthTitle.TextColor3 = Color3.fromRGB(100, 200, 255)
AuthTitle.TextSize = 20

local AuthSubtitle = Instance.new("TextLabel")
AuthSubtitle.Parent = AuthFrame
AuthSubtitle.BackgroundTransparency = 1
AuthSubtitle.Position = UDim2.new(0, 0, 0, 50)
AuthSubtitle.Size = UDim2.new(1, 0, 0, 18)
AuthSubtitle.Font = Enum.Font.Gotham
AuthSubtitle.Text = "Введите ключ"
AuthSubtitle.TextColor3 = Color3.fromRGB(180, 180, 200)
AuthSubtitle.TextSize = 11

KeyInput.Name = "KeyInput"
KeyInput.Parent = AuthFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
KeyInput.BorderSizePixel = 0
KeyInput.Position = UDim2.new(0, 20, 0, 80)
KeyInput.Size = UDim2.new(0, 240, 0, 32)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Ключ..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 13
KeyInput.ClearTextOnFocus = false

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 10)
KeyCorner.Parent = KeyInput

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(60, 60, 80)
KeyStroke.Thickness = 1.5
KeyStroke.Parent = KeyInput

SubmitButton.Name = "SubmitButton"
SubmitButton.Parent = AuthFrame
SubmitButton.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
SubmitButton.BorderSizePixel = 0
SubmitButton.Position = UDim2.new(0, 20, 0, 125)
SubmitButton.Size = UDim2.new(0, 240, 0, 35)
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.Text = "🚀 ВОЙТИ"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.TextSize = 14

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 10)
SubmitCorner.Parent = SubmitButton

-- ==================== MAIN FRAME (Mobile Optimized) ====================
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -150, 0.85, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 45)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(100, 200, 255)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 40))
}
MainGradient.Rotation = 90
MainGradient.Parent = MainFrame

TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.Size = UDim2.new(0, 100, 0, 15)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "IY v1.0"
TitleLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
TitleLabel.TextSize = 10
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

CommandBar.Name = "CommandBar"
CommandBar.Parent = MainFrame
CommandBar.BackgroundTransparency = 1
CommandBar.Position = UDim2.new(0, 10, 0, 15)
CommandBar.Size = UDim2.new(1, -20, 0, 25)
CommandBar.Font = Enum.Font.Gotham
CommandBar.PlaceholderText = "Команда..."
CommandBar.Text = ""
CommandBar.TextColor3 = Color3.fromRGB(255, 255, 255)
CommandBar.TextSize = 12
CommandBar.TextXAlignment = Enum.TextXAlignment.Left
CommandBar.ClearTextOnFocus = false

-- ==================== COMMAND LIST (Mobile) ====================
CommandList.Name = "CommandList"
CommandList.Parent = ScreenGui
CommandList.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
CommandList.BorderSizePixel = 0
CommandList.Position = UDim2.new(0.5, -160, 0.5, -200)
CommandList.Size = UDim2.new(0, 320, 0, 400)
CommandList.Visible = false
CommandList.Active = true
CommandList.Draggable = true

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 15)
ListCorner.Parent = CommandList

local ListStroke = Instance.new("UIStroke")
ListStroke.Color = Color3.fromRGB(100, 200, 255)
ListStroke.Thickness = 2.5
ListStroke.Parent = CommandList

local ListGradient = Instance.new("UIGradient")
ListGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
}
ListGradient.Rotation = 135
ListGradient.Parent = CommandList

ListTitle.Name = "ListTitle"
ListTitle.Parent = CommandList
ListTitle.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
ListTitle.BorderSizePixel = 0
ListTitle.Size = UDim2.new(1, 0, 0, 40)
ListTitle.Font = Enum.Font.GothamBold
ListTitle.Text = "📋 КОМАНДЫ"
ListTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ListTitle.TextSize = 16

local ListTitleCorner = Instance.new("UICorner")
ListTitleCorner.CornerRadius = UDim.new(0, 15)
ListTitleCorner.Parent = ListTitle

CloseButton.Name = "CloseButton"
CloseButton.Parent = ListTitle
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Parent = CommandList
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Position = UDim2.new(0, 8, 0, 48)
ScrollFrame.Size = UDim2.new(1, -16, 1, -56)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollBarThickness = 4
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 200, 255)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

local isAuthenticated = false
local flying = false
local flySpeed = 50
local flyConnection = nil
local noclipConnection = nil
local espEnabled = false
local espObjects = {}
local chamsEnabled = false
local chamsObjects = {}
local godMode = false

local commands = {
    {cmd = "fly [speed]", desc = "Полет (1-100)", example = "fly 75", icon = "✈️"},
    {cmd = "unfly", desc = "Отключить полет", example = "unfly", icon = "❌"},
    {cmd = "jump [power]", desc = "Сила прыжка (1-100)", example = "jump 80", icon = "🦘"},
    {cmd = "god", desc = "Бессмертие (God Mode)", example = "god", icon = "🛡️"},
    {cmd = "ungod", desc = "Отключить бессмертие", example = "ungod", icon = "💔"},
    {cmd = "espall", desc = "ESP на игроков", example = "espall", icon = "👁️"},
    {cmd = "unesp", desc = "Отключить ESP", example = "unesp", icon = "🚫"},
    {cmd = "chams", desc = "Chams на игроков", example = "chams", icon = "🎨"},
    {cmd = "unchams", desc = "Отключить Chams", example = "unchams", icon = "🚫"},
    {cmd = "flynoclip [speed]", desc = "Полет + NoClip", example = "flynoclip 60", icon = "🚀"},
    {cmd = "unflynoclip", desc = "Отключить все", example = "unflynoclip", icon = "🛑"},
    {cmd = "spisok", desc = "Показать команды", example = "spisok", icon = "📋"},
}

local function CreateCommandList()
    for i, cmdData in ipairs(commands) do
        local CmdFrame = Instance.new("Frame")
        CmdFrame.Name = "CmdFrame"
        CmdFrame.Parent = ScrollFrame
        CmdFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        CmdFrame.BorderSizePixel = 0
        CmdFrame.Size = UDim2.new(1, 0, 0, 60)
        
        local CmdCorner = Instance.new("UICorner")
        CmdCorner.CornerRadius = UDim.new(0, 10)
        CmdCorner.Parent = CmdFrame
        
        local CmdStroke = Instance.new("UIStroke")
        CmdStroke.Color = Color3.fromRGB(60, 60, 80)
        CmdStroke.Thickness = 1
        CmdStroke.Parent = CmdFrame
        
        local IconLabel = Instance.new("TextLabel")
        IconLabel.Parent = CmdFrame
        IconLabel.BackgroundTransparency = 1
        IconLabel.Position = UDim2.new(0, 8, 0, 0)
        IconLabel.Size = UDim2.new(0, 30, 1, 0)
        IconLabel.Font = Enum.Font.GothamBold
        IconLabel.Text = cmdData.icon
        IconLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
        IconLabel.TextSize = 18
        
        local CmdName = Instance.new("TextLabel")
        CmdName.Parent = CmdFrame
        CmdName.BackgroundTransparency = 1
        CmdName.Position = UDim2.new(0, 40, 0, 5)
        CmdName.Size = UDim2.new(1, -45, 0, 18)
        CmdName.Font = Enum.Font.GothamBold
        CmdName.Text = cmdData.cmd
        CmdName.TextColor3 = Color3.fromRGB(100, 200, 255)
        CmdName.TextSize = 13
        CmdName.TextXAlignment = Enum.TextXAlignment.Left
        
        local CmdDesc = Instance.new("TextLabel")
        CmdDesc.Parent = CmdFrame
        CmdDesc.BackgroundTransparency = 1
        CmdDesc.Position = UDim2.new(0, 40, 0, 23)
        CmdDesc.Size = UDim2.new(1, -45, 0, 15)
        CmdDesc.Font = Enum.Font.Gotham
        CmdDesc.Text = cmdData.desc
        CmdDesc.TextColor3 = Color3.fromRGB(180, 180, 200)
        CmdDesc.TextSize = 10
        CmdDesc.TextXAlignment = Enum.TextXAlignment.Left
        
        local CmdExample = Instance.new("TextLabel")
        CmdExample.Parent = CmdFrame
        CmdExample.BackgroundTransparency = 1
        CmdExample.Position = UDim2.new(0, 40, 0, 38)
        CmdExample.Size = UDim2.new(1, -45, 0, 15)
        CmdExample.Font = Enum.Font.GothamMedium
        CmdExample.Text = "💡 " .. cmdData.example
        CmdExample.TextColor3 = Color3.fromRGB(120, 120, 140)
        CmdExample.TextSize = 9
        CmdExample.TextXAlignment = Enum.TextXAlignment.Left
    end
    
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 5)
end

CreateCommandList()

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 5)
end)

--[[
    КОД 2 из 2
    Рабочие функции
]]

local function CreateESP(player)
    if player == LocalPlayer then return end
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not hrp or not hum then return end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Billboard"
    billboard.Parent = hrp
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 100, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    
    local healthText = Instance.new("TextLabel")
    healthText.Parent = billboard
    healthText.BackgroundTransparency = 1
    healthText.Size = UDim2.new(1, 0, 0.5, 0)
    healthText.Font = Enum.Font.GothamBold
    healthText.TextColor3 = Color3.fromRGB(0, 255, 0)
    healthText.TextSize = 14
    healthText.TextStrokeTransparency = 0
    healthText.Text = math.floor(hum.Health) .. " HP"
    
    local nameText = Instance.new("TextLabel")
    nameText.Parent = billboard
    nameText.BackgroundTransparency = 1
    nameText.Position = UDim2.new(0, 0, 0.5, 0)
    nameText.Size = UDim2.new(1, 0, 0.5, 0)
    nameText.Font = Enum.Font.GothamBold
    nameText.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameText.TextSize = 12
    nameText.TextStrokeTransparency = 0
    nameText.Text = player.Name
    
    local boxAdornment = Instance.new("BoxHandleAdornment")
    boxAdornment.Name = "ESP_Box"
    boxAdornment.Parent = hrp
    boxAdornment.Size = char:GetExtentsSize()
    boxAdornment.Color3 = Color3.fromRGB(100, 200, 255)
    boxAdornment.Transparency = 0.7
    boxAdornment.AlwaysOnTop = true
    boxAdornment.ZIndex = 5
    boxAdornment.Adornee = hrp
    
    local line = Drawing.new("Line")
    line.Visible = true
    line.Color = Color3.fromRGB(100, 200, 255)
    line.Thickness = 2
    line.Transparency = 1
    
    local healthConnection = hum.HealthChanged:Connect(function()
        if healthText then
            healthText.Text = math.floor(hum.Health) .. " HP"
            healthText.TextColor3 = Color3.fromHSV(hum.Health / hum.MaxHealth * 0.3, 1, 1)
        end
    end)
    
    local lineConnection = RunService.RenderStepped:Connect(function()
        if not espEnabled or not hrp or not hrp.Parent then
            line:Remove()
            lineConnection:Disconnect()
            return
        end
        local camera = workspace.CurrentCamera
        local vector, onScreen = camera:WorldToViewportPoint(hrp.Position)
        if onScreen then
            line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
            line.To = Vector2.new(vector.X, vector.Y)
            line.Visible = true
        else
            line.Visible = false
        end
    end)
    
    table.insert(espObjects, {billboard, boxAdornment, line, lineConnection, healthConnection})
end

local function RemoveESP()
    for _, objects in ipairs(espObjects) do
        if objects[1] then objects[1]:Destroy() end
        if objects[2] then objects[2]:Destroy() end
        if objects[3] then objects[3]:Remove() end
        if objects[4] then objects[4]:Disconnect() end
        if objects[5] then objects[5]:Disconnect() end
    end
    espObjects = {}
    espEnabled = false
end

local function CreateChams(player)
    if player == LocalPlayer then return end
    local char = player.Character
    if not char then return end
    local highlight = Instance.new("Highlight")
    highlight.Name = "Chams_" .. player.Name
    highlight.Parent = char
    highlight.FillColor = Color3.fromRGB(100, 200, 255)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    table.insert(chamsObjects, highlight)
end

local function RemoveChams()
    for _, chams in ipairs(chamsObjects) do
        chams:Destroy()
    end
    chamsObjects = {}
    chamsEnabled = false
end

-- РАБОЧИЙ FLY
local function StartFly(speed)
    if flying then return end
    flying = true
    flySpeed = math.clamp(speed or 50, 1, 100)
    
    local BG = Instance.new("BodyGyro")
    local BV = Instance.new("BodyVelocity")
    
    BG.P = 9e4
    BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    BG.cframe = RootPart.CFrame
    BG.Parent = RootPart
    
    BV.velocity = Vector3.new(0, 0, 0)
    BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
    BV.Parent = RootPart
    
    Humanoid.PlatformStand = true
    
    flyConnection = RunService.Heartbeat:Connect(function()
        if not flying or not RootPart or not RootPart.Parent then 
            if BG then BG:Destroy() end
            if BV then BV:Destroy() end
            return 
        end
        
        local cam = workspace.CurrentCamera
        local direction = Vector3.new()
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            direction = direction + (cam.CFrame.LookVector)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            direction = direction - (cam.CFrame.LookVector)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            direction = direction - (cam.CFrame.RightVector)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            direction = direction + (cam.CFrame.RightVector)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            direction = direction + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.ButtonR2) then
            direction = direction - Vector3.new(0, 1, 0)
        end
        
        if direction.Magnitude > 0 then
            direction = direction.Unit
        end
        
        BV.velocity = direction * flySpeed
        BG.cframe = cam.CFrame
    end)
end

local function StopFly()
    flying = false
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
    if RootPart then
        for _, v in ipairs(RootPart:GetChildren()) do
            if v:IsA("BodyGyro") or v:IsA("BodyVelocity") then
                v:Destroy()
            end
        end
    end
    if Humanoid then
        Humanoid.PlatformStand = false
    end
end

local function StartNoClip()
    noclipConnection = RunService.Stepped:Connect(function()
        if Character then
            for _, part in ipairs(Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

local function StopNoClip()
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    if Character then
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.CanCollide = true
            end
        end
    end
end

-- GOD MODE (Бессмертие)
local godConnection
local function EnableGodMode()
    if godMode then return end
    godMode = true
    
    if Humanoid then
        Humanoid.MaxHealth = math.huge
        Humanoid.Health = math.huge
        
        godConnection = Humanoid.HealthChanged:Connect(function(health)
            if godMode and health < math.huge then
                Humanoid.Health = math.huge
            end
        end)
    end
end

local function DisableGodMode()
    godMode = false
    if godConnection then
        godConnection:Disconnect()
        godConnection = nil
    end
    if Humanoid then
        Humanoid.MaxHealth = 100
        Humanoid.Health = 100
    end
end

local function Notify(text, color)
    TitleLabel.Text = text
    TitleLabel.TextColor3 = color or Color3.fromRGB(100, 255, 100)
    task.wait(2)
    TitleLabel.Text = "IY v1.0"
    TitleLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
end

local function ExecuteCommand(cmd)
    local args = cmd:lower():split(" ")
    local command = args[1]
    
    if command == "fly" then
        local speed = tonumber(args[2]) or 50
        speed = math.clamp(speed, 1, 100)
        StartFly(speed)
        Notify("✈️ Fly ON (" .. speed .. ")", Color3.fromRGB(100, 255, 100))
        
    elseif command == "unfly" then
        StopFly()
        Notify("✈️ Fly OFF", Color3.fromRGB(255, 150, 100))
        
    elseif command == "jump" then
        local power = tonumber(args[2]) or 50
        power = math.clamp(power, 1, 100)
        if Humanoid then
            Humanoid.JumpPower = power
            Humanoid.UseJumpPower = true
        end
        Notify("🦘 Jump: " .. power, Color3.fromRGB(100, 255, 100))
        
    elseif command == "god" then
        EnableGodMode()
        Notify("🛡️ God Mode ON", Color3.fromRGB(255, 215, 0))
        
    elseif command == "ungod" then
        DisableGodMode()
        Notify("💔 God Mode OFF", Color3.fromRGB(255, 150, 100))
        
    elseif command == "espall" then
        if espEnabled then
            Notify("⚠️ ESP уже ON", Color3.fromRGB(255, 200, 100))
            return
        end
        espEnabled = true
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                CreateESP(player)
            end
        end
        Notify("👁️ ESP ON", Color3.fromRGB(100, 255, 100))
        
    elseif command == "unesp" then
        RemoveESP()
        Notify("👁️ ESP OFF", Color3.fromRGB(255, 150, 100))
        
    elseif command == "chams" then
        if chamsEnabled then
            Notify("⚠️ Chams уже ON", Color3.fromRGB(255, 200, 100))
            return
        end
        chamsEnabled = true
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                CreateChams(player)
            end
        end
        Notify("🎨 Chams ON", Color3.fromRGB(100, 255, 100))
        
    elseif command == "unchams" then
        RemoveChams()
        Notify("🎨 Chams OFF", Color3.fromRGB(255, 150, 100))
        
    elseif command == "flynoclip" then
        local speed = tonumber(args[2]) or 50
        speed = math.clamp(speed, 1, 100)
        StartFly(speed)
        StartNoClip()
        Notify("🚀 Fly+NoClip ON", Color3.fromRGB(100, 255, 100))
        
    elseif command == "unflynoclip" then
        StopFly()
        StopNoClip()
        Notify("🛑 Выключено", Color3.fromRGB(255, 150, 100))
        
    elseif command == "spisok" then
        CommandList.Visible = not CommandList.Visible
        
    else
        Notify("❌ Неизвестная команда", Color3.fromRGB(255, 100, 100))
    end
end

local function CheckKey()
    local inputKey = KeyInput.Text
    if inputKey == ADMIN_KEY then
        isAuthenticated = true
        AuthStroke.Color = Color3.fromRGB(100, 255, 100)
        AuthTitle.Text = "✅ ДОСТУП OK"
        AuthTitle.TextColor3 = Color3.fromRGB(100, 255, 100)
        AuthSubtitle.Text = "Загрузка..."
        SubmitButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
        task.wait(1)
        AuthFrame:TweenPosition(UDim2.new(0.5, -140, -0.3, 0), "In", "Quint", 0.5, true)
        task.wait(0.5)
        AuthFrame.Visible = false
        MainFrame.Visible = true
        MainFrame:TweenPosition(UDim2.new(0.5, -150, 0.9, 0), "Out", "Quint", 0.5, true)
        Notify("✅ Загружено!", Color3.fromRGB(100, 255, 100))
        print("🚀 IY Clone v1.0 | Авторизация OK")
    else
        AuthStroke.Color = Color3.fromRGB(255, 100, 100)
        AuthTitle.Text = "❌ НЕВЕРНЫЙ КЛЮЧ"
        AuthTitle.TextColor3 = Color3.fromRGB(255, 100, 100)
        AuthSubtitle.Text = "Попробуйте снова"
        SubmitButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        KeyInput.Text = ""
        task.wait(1.5)
        AuthStroke.Color = Color3.fromRGB(100, 200, 255)
        AuthTitle.Text = "🔐 IY CLONE"
        AuthTitle.TextColor3 = Color3.fromRGB(100, 200, 255)
        AuthSubtitle.Text = "Введите ключ"
        SubmitButton.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    end
end

SubmitButton.MouseButton1Click:Connect(CheckKey)
KeyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then CheckKey() end
end)
CommandBar.FocusLost:Connect(function(enterPressed)
    if enterPressed and CommandBar.Text ~= "" then
        ExecuteCommand(CommandBar.Text)
        CommandBar.Text = ""
    end
end)
CloseButton.MouseButton1Click:Connect(function()
    CommandList.Visible = false
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    RootPart = char:WaitForChild("HumanoidRootPart")
    flying = false
    godMode = false
    if flyConnection then flyConnection:Disconnect() end
    if noclipConnection then noclipConnection:Disconnect() end
    if godConnection then godConnection:Disconnect() end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        if espEnabled then CreateESP(player) end
        if chamsEnabled then CreateChams(player) end
    end)
end)

AuthFrame:TweenPosition(UDim2.new(0.5, -140, 0.5, -90), "Out", "Quint", 0.5, true)
