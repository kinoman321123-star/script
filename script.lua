--[[
    Infinity Yield Clone v1.0
    Система авторизации по ключу
    GitHub Script
    
    ЧАСТЬ 1 из 2
]]

local ADMIN_KEY = "adminkey" -- Ключ для доступа

-- Создание GUI
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

-- ==================== AUTH FRAME ====================
AuthFrame.Name = "AuthFrame"
AuthFrame.Parent = ScreenGui
AuthFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
AuthFrame.BorderSizePixel = 0
AuthFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
AuthFrame.Size = UDim2.new(0, 300, 0, 200)
AuthFrame.Active = true
AuthFrame.Draggable = true

local AuthCorner = Instance.new("UICorner")
AuthCorner.CornerRadius = UDim.new(0, 12)
AuthCorner.Parent = AuthFrame

local AuthStroke = Instance.new("UIStroke")
AuthStroke.Color = Color3.fromRGB(0, 170, 255)
AuthStroke.Thickness = 2
AuthStroke.Parent = AuthFrame

-- Auth Shadow
local AuthShadow = Instance.new("Frame")
AuthShadow.Name = "Shadow"
AuthShadow.Parent = AuthFrame
AuthShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AuthShadow.BackgroundTransparency = 0.6
AuthShadow.BorderSizePixel = 0
AuthShadow.Position = UDim2.new(0, 6, 0, 6)
AuthShadow.Size = UDim2.new(1, 0, 1, 0)
AuthShadow.ZIndex = 0

local AuthShadowCorner = Instance.new("UICorner")
AuthShadowCorner.CornerRadius = UDim.new(0, 12)
AuthShadowCorner.Parent = AuthShadow

-- Auth Title
AuthTitle.Name = "AuthTitle"
AuthTitle.Parent = AuthFrame
AuthTitle.BackgroundTransparency = 1
AuthTitle.Position = UDim2.new(0, 0, 0, 20)
AuthTitle.Size = UDim2.new(1, 0, 0, 40)
AuthTitle.Font = Enum.Font.GothamBold
AuthTitle.Text = "🔐 INFINITY YIELD CLONE"
AuthTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
AuthTitle.TextSize = 18

local AuthSubtitle = Instance.new("TextLabel")
AuthSubtitle.Parent = AuthFrame
AuthSubtitle.BackgroundTransparency = 1
AuthSubtitle.Position = UDim2.new(0, 0, 0, 60)
AuthSubtitle.Size = UDim2.new(1, 0, 0, 20)
AuthSubtitle.Font = Enum.Font.Gotham
AuthSubtitle.Text = "Введите ключ для доступа"
AuthSubtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
AuthSubtitle.TextSize = 12

-- Key Input
KeyInput.Name = "KeyInput"
KeyInput.Parent = AuthFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
KeyInput.BorderSizePixel = 0
KeyInput.Position = UDim2.new(0, 30, 0, 95)
KeyInput.Size = UDim2.new(0, 240, 0, 35)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Введите ключ..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14
KeyInput.ClearTextOnFocus = false

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 8)
KeyCorner.Parent = KeyInput

-- Submit Button
SubmitButton.Name = "SubmitButton"
SubmitButton.Parent = AuthFrame
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SubmitButton.BorderSizePixel = 0
SubmitButton.Position = UDim2.new(0, 30, 0, 145)
SubmitButton.Size = UDim2.new(0, 240, 0, 35)
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.Text = "🚀 ВОЙТИ"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.TextSize = 14

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
SubmitCorner.Parent = SubmitButton

-- ==================== MAIN FRAME ====================
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.7, 0, 0.9, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 50)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 170, 255)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Main Shadow
local MainShadow = Instance.new("Frame")
MainShadow.Name = "Shadow"
MainShadow.Parent = MainFrame
MainShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainShadow.BackgroundTransparency = 0.5
MainShadow.BorderSizePixel = 0
MainShadow.Position = UDim2.new(0, 5, 0, 5)
MainShadow.Size = UDim2.new(1, 0, 1, 0)
MainShadow.ZIndex = 0

local MainShadowCorner = Instance.new("UICorner")
MainShadowCorner.CornerRadius = UDim.new(0, 8)
MainShadowCorner.Parent = MainShadow

-- Title Label
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.Size = UDim2.new(0, 150, 0, 20)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "IY Clone v1.0"
TitleLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
TitleLabel.TextSize = 12
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Command Bar
CommandBar.Name = "CommandBar"
CommandBar.Parent = MainFrame
CommandBar.BackgroundTransparency = 1
CommandBar.Position = UDim2.new(0, 10, 0, 20)
CommandBar.Size = UDim2.new(1, -20, 0, 25)
CommandBar.Font = Enum.Font.Gotham
CommandBar.PlaceholderText = "Введите команду..."
CommandBar.Text = ""
CommandBar.TextColor3 = Color3.fromRGB(255, 255, 255)
CommandBar.TextSize = 14
CommandBar.TextXAlignment = Enum.TextXAlignment.Left
CommandBar.ClearTextOnFocus = false

-- ==================== COMMAND LIST ====================
CommandList.Name = "CommandList"
CommandList.Parent = ScreenGui
CommandList.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CommandList.BorderSizePixel = 0
CommandList.Position = UDim2.new(0.3, 0, 0.2, 0)
CommandList.Size = UDim2.new(0, 550, 0, 450)
CommandList.Visible = false
CommandList.Active = true
CommandList.Draggable = true

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 10)
ListCorner.Parent = CommandList

local ListStroke = Instance.new("UIStroke")
ListStroke.Color = Color3.fromRGB(0, 170, 255)
ListStroke.Thickness = 2
ListStroke.Parent = CommandList

-- List Title
ListTitle.Name = "ListTitle"
ListTitle.Parent = CommandList
ListTitle.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ListTitle.BorderSizePixel = 0
ListTitle.Size = UDim2.new(1, 0, 0, 45)
ListTitle.Font = Enum.Font.GothamBold
ListTitle.Text = "📋 СПИСОК КОМАНД"
ListTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ListTitle.TextSize = 18

local ListTitleCorner = Instance.new("UICorner")
ListTitleCorner.CornerRadius = UDim.new(0, 10)
ListTitleCorner.Parent = ListTitle

-- Close Button
CloseButton.Name = "CloseButton"
CloseButton.Parent = ListTitle
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -40, 0, 7.5)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

-- Scroll Frame
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Parent = CommandList
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Position = UDim2.new(0, 10, 0, 55)
ScrollFrame.Size = UDim2.new(1, -20, 1, -65)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

-- ==================== ПЕРЕМЕННЫЕ ====================
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

-- ==================== КОМАНДЫ ====================
local commands = {
    {cmd = "fly [speed]", desc = "Включить полет (скорость от 1 до 100)", usage = "fly 50", example = "fly 75"},
    {cmd = "unfly", desc = "Выключить полет", usage = "unfly", example = "unfly"},
    {cmd = "jump [power]", desc = "Установить силу прыжка (от 1 до 100)", usage = "jump 50", example = "jump 80"},
    {cmd = "espall", desc = "Включить ESP на всех игроков (бокс, линия, скелет, здоровье)", usage = "espall", example = "espall"},
    {cmd = "unesp", desc = "Отключить ESP", usage = "unesp", example = "unesp"},
    {cmd = "chams", desc = "Включить Chams на всех игроков", usage = "chams", example = "chams"},
    {cmd = "unchams", desc = "Отключить Chams", usage = "unchams", example = "unchams"},
    {cmd = "flynoclip [speed]", desc = "Включить полет с NoClip", usage = "flynoclip 50", example = "flynoclip 60"},
    {cmd = "unflynoclip", desc = "Отключить полет с NoClip", usage = "unflynoclip", example = "unflynoclip"},
    {cmd = "spisok", desc = "Показать/скрыть список всех команд", usage = "spisok", example = "spisok"},
}

-- ==================== СОЗДАНИЕ СПИСКА КОМАНД ====================
local function CreateCommandList()
    for i, cmdData in ipairs(commands) do
        local CmdFrame = Instance.new("Frame")
        CmdFrame.Name = "CmdFrame"
        CmdFrame.Parent = ScrollFrame
        CmdFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        CmdFrame.BorderSizePixel = 0
        CmdFrame.Size = UDim2.new(1, 0, 0, 75)
        
        local CmdCorner = Instance.new("UICorner")
        CmdCorner.CornerRadius = UDim.new(0, 8)
        CmdCorner.Parent = CmdFrame
        
        local CmdStroke = Instance.new("UIStroke")
        CmdStroke.Color = Color3.fromRGB(0, 170, 255)
        CmdStroke.Thickness = 1
        CmdStroke.Transparency = 0.8
        CmdStroke.Parent = CmdFrame
        
        local CmdName = Instance.new("TextLabel")
        CmdName.Parent = CmdFrame
        CmdName.BackgroundTransparency = 1
        CmdName.Position = UDim2.new(0, 15, 0, 8)
        CmdName.Size = UDim2.new(1, -30, 0, 20)
        CmdName.Font = Enum.Font.GothamBold
        CmdName.Text = "🔹 " .. cmdData.cmd
        CmdName.TextColor3 = Color3.fromRGB(0, 200, 255)
        CmdName.TextSize = 15
        CmdName.TextXAlignment = Enum.TextXAlignment.Left
        
        local CmdDesc = Instance.new("TextLabel")
        CmdDesc.Parent = CmdFrame
        CmdDesc.BackgroundTransparency = 1
        CmdDesc.Position = UDim2.new(0, 15, 0, 30)
        CmdDesc.Size = UDim2.new(1, -30, 0, 18)
        CmdDesc.Font = Enum.Font.Gotham
        CmdDesc.Text = "📝 " .. cmdData.desc
        CmdDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
        CmdDesc.TextSize = 12
        CmdDesc.TextXAlignment = Enum.TextXAlignment.Left
        
        local CmdExample = Instance.new("TextLabel")
        CmdExample.Parent = CmdFrame
        CmdExample.BackgroundTransparency = 1
        CmdExample.Position = UDim2.new(0, 15, 0, 50)
        CmdExample.Size = UDim2.new(1, -30, 0, 18)
        CmdExample.Font = Enum.Font.GothamMedium
        CmdExample.Text = "💡 Пример: " .. cmdData.example
        CmdExample.TextColor3 = Color3.fromRGB(150, 150, 150)
        CmdExample.TextSize = 11
        CmdExample.TextXAlignment = Enum.TextXAlignment.Left
    end
    
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end

CreateCommandList()

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end)

--[[
    ЧАСТЬ 2 из 2
    Функции ESP, Chams, Fly, NoClip и обработчики команд
]]

-- ==================== ESP FUNCTIONS ====================
local function CreateESP(player)
    if player == LocalPlayer then return end
    
    local char = player.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not hrp or not hum then return end
    
    -- Billboard для здоровья и имени
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
    
    -- Box ESP
    local boxAdornment = Instance.new("BoxHandleAdornment")
    boxAdornment.Name = "ESP_Box"
    boxAdornment.Parent = hrp
    boxAdornment.Size = char:GetExtentsSize()
    boxAdornment.Color3 = Color3.fromRGB(0, 170, 255)
    boxAdornment.Transparency = 0.7
    boxAdornment.AlwaysOnTop = true
    boxAdornment.ZIndex = 5
    boxAdornment.Adornee = hrp
    
    -- Линия к игроку (Tracer)
    local line = Drawing.new("Line")
    line.Visible = true
    line.Color = Color3.fromRGB(0, 170, 255)
    line.Thickness = 2
    line.Transparency = 1
    
    -- Обновление здоровья
    local healthConnection = hum.HealthChanged:Connect(function()
        if healthText then
            healthText.Text = math.floor(hum.Health) .. " HP"
            healthText.TextColor3 = Color3.fromHSV(hum.Health / hum.MaxHealth * 0.3, 1, 1)
        end
    end)
    
    -- Обновление линии
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

-- ==================== CHAMS FUNCTIONS ====================
local function CreateChams(player)
    if player == LocalPlayer then return end
    
    local char = player.Character
    if not char then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "Chams_" .. player.Name
    highlight.Parent = char
    highlight.FillColor = Color3.fromRGB(0, 170, 255)
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

-- ==================== FLY FUNCTIONS ====================
local function StartFly(speed)
    if flying then return end
    flying = true
    flySpeed = math.clamp(speed or 50, 1, 100)
    
    local bg = Instance.new("BodyGyro")
    bg.P = 9e4
    bg.Parent = RootPart
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = RootPart.CFrame
    
    local bv = Instance.new("BodyVelocity")
    bv.velocity = Vector3.new(0, 0, 0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
    bv.Parent = RootPart
    
    flyConnection = RunService.Heartbeat:Connect(function()
        if not flying then return end
        
        local camera = workspace.CurrentCamera
        local moveDirection = Vector3.new()
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDirection = moveDirection - Vector3.new(0, 1, 0)
        end
        
        if moveDirection.Magnitude > 0 then
            moveDirection = moveDirection.Unit
        end
        
        bv.velocity = moveDirection * flySpeed
        bg.cframe = camera.CFrame
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
end

-- ==================== NOCLIP FUNCTIONS ====================
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
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

-- ==================== NOTIFICATION ====================
local function Notify(text, color)
    TitleLabel.Text = text
    TitleLabel.TextColor3 = color or Color3.fromRGB(0, 255, 0)
    wait(2)
    TitleLabel.Text = "IY Clone v1.0"
    TitleLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
end

-- ==================== COMMAND HANDLER ====================
local function ExecuteCommand(cmd)
    local args = cmd:lower():split(" ")
    local command = args[1]
    
    if command == "fly" then
        local speed = tonumber(args[2]) or 50
        speed = math.clamp(speed, 1, 100)
        StartFly(speed)
        Notify("✈️ Fly ON (Speed: " .. speed .. ")", Color3.fromRGB(0, 255, 100))
        
    elseif command == "unfly" then
        StopFly()
        Notify("✈️ Fly OFF", Color3.fromRGB(255, 100, 50))
        
    elseif command == "jump" then
        local power = tonumber(args[2]) or 50
        power = math.clamp(power, 1, 100)
        Humanoid.JumpPower = power
        Notify("🦘 Jump Power: " .. power, Color3.fromRGB(0, 255, 100))
        
    elseif command == "espall" then
        if espEnabled then
            Notify("⚠️ ESP уже включен!", Color3.fromRGB(255, 200, 0))
            return
        end
        espEnabled = true
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                CreateESP(player)
            end
        end
        Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function()
                if espEnabled then
                    wait(0.5)
                    CreateESP(player)
                end
            end)
        end)
        Notify("👁️ ESP ON", Color3.fromRGB(0, 255, 100))
        
    elseif command == "unesp" then
        RemoveESP()
        Notify("👁️ ESP OFF", Color3.fromRGB(255, 100, 50))
        
    elseif command == "chams" then
        if chamsEnabled then
            Notify("⚠️ Chams уже включен!", Color3.fromRGB(255, 200, 0))
            return
        end
        chamsEnabled = true
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                CreateChams(player)
            end
        end
        Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function()
                if chamsEnabled then
                    wait(0.5)
                    CreateChams(player)
                end
            end)
        end)
        Notify("🎨 Chams ON", Color3.fromRGB(0, 255, 100))
        
    elseif command == "unchams" then
        RemoveChams()
        Notify("🎨 Chams OFF", Color3.fromRGB(255, 100, 50))
        
    elseif command == "flynoclip" then
        local speed = tonumber(args[2]) or 50
        speed = math.clamp(speed, 1, 100)
        StartFly(speed)
        StartNoClip()
        Notify("✈️ Fly+NoClip ON (Speed: " .. speed .. ")", Color3.fromRGB(0, 255, 100))
        
    elseif command == "unflynoclip" then
        StopFly()
        StopNoClip()
        Notify("✈️ Fly+NoClip OFF", Color3.fromRGB(255, 100, 50))
        
    elseif command == "spisok" then
        CommandList.Visible = not CommandList.Visible
        
    else
        Notify("❌ Неизвестная команда!", Color3.fromRGB(255, 50, 50))
    end
end

-- ==================== AUTHORIZATION ====================
local function Authenticate()
    AuthFrame:TweenPosition(UDim2.new(0.5, -150, 0.5, -100), "Out", "Quint", 0.5, true)
end

local function CheckKey()
    local inputKey = KeyInput.Text
    
    if inputKey == ADMIN_KEY then
        isAuthenticated = true
        
        -- Анимация успеха
        AuthStroke.Color = Color3.fromRGB(0, 255, 100)
        AuthTitle.Text = "✅ ДОСТУП РАЗРЕШЕН"
        AuthTitle.TextColor3 = Color3.fromRGB(0, 255, 100)
        AuthSubtitle.Text = "Загрузка..."
        SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        
        wait(1)
        
        AuthFrame:TweenPosition(UDim2.new(0.5, -150, -0.5, 0), "In", "Quint", 0.5, true)
        wait(0.5)
        AuthFrame.Visible = false
        
        MainFrame.Visible = true
        MainFrame:TweenPosition(UDim2.new(0.7, 0, 0.85, 0), "Out", "Quint", 0.5, true)
        
        Notify("✅ IY Clone загружен!", Color3.fromRGB(0, 255, 100))
        
        print("🚀 ========================")
        print("✅ Infinity Yield Clone v1.0")
        print("🔑 Авторизация успешна!")
        print("📋 Команда 'spisok' - список команд")
        print("🚀 ========================")
        
    else
        -- Анимация ошибки
        AuthStroke.Color = Color3.fromRGB(255, 50, 50)
        AuthTitle.Text = "❌ НЕВЕРНЫЙ КЛЮЧ"
        AuthTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
        AuthSubtitle.Text = "Попробуйте снова"
        SubmitButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        KeyInput.Text = ""
        
        wait(1.5)
        
        AuthStroke.Color = Color3.fromRGB(0, 170, 255)
        AuthTitle.Text = "🔐 INFINITY YIELD CLONE"
        AuthTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
        AuthSubtitle.Text = "Введите ключ для доступа"
        SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    end
end

-- ==================== EVENT HANDLERS ====================
SubmitButton.MouseButton1Click:Connect(CheckKey)

KeyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        CheckKey()
    end
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

-- Hover эффекты
SubmitButton.MouseEnter:Connect(function()
    SubmitButton:TweenSize(UDim2.new(0, 245, 0, 37), "Out", "Quad", 0.2, true)
end)

SubmitButton.MouseLeave:Connect(function()
    SubmitButton:TweenSize(UDim2.new(0, 240, 0, 35), "Out", "Quad", 0.2, true)
end)

CloseButton.MouseEnter:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
end)

CloseButton.MouseLeave:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
end)

-- Character Reset Handler
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    RootPart = char:WaitForChild("HumanoidRootPart")
    
    flying = false
    if flyConnection then flyConnection:Disconnect() end
    if noclipConnection then noclipConnection:Disconnect() end
end)

-- Запуск авторизации
Authenticate()
