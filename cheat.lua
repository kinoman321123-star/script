--[[
    ⭐ STAR HITBOX HUB ⭐
    Clean & Fixed Version
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- Настройки
local Settings = {
    Enabled = false,
    Size = 20
}

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "StarHitboxHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

if UserInputService.TouchEnabled then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
else
    pcall(function()
        ScreenGui.Parent = game:GetService("CoreGui")
    end)
end

-- ═══════════════════════════════════════
-- 🔘 КНОПКА ОТКРЫТИЯ
-- ═══════════════════════════════════════

local OpenButton = Instance.new("TextButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.new(0, 50, 0, 50)
OpenButton.Position = UDim2.new(0, 10, 0.5, -25)
OpenButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
OpenButton.Text = "⭐"
OpenButton.TextSize = 25
OpenButton.Font = Enum.Font.GothamBold
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.BorderSizePixel = 0
OpenButton.Active = true
OpenButton.Draggable = true
OpenButton.Parent = ScreenGui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 12)
OpenCorner.Parent = OpenButton

-- ═══════════════════════════════════════
-- 📱 ЛЕГКОЕ МЕНЮ
-- ═══════════════════════════════════════

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 260, 0, 140)
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -70)
MainFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 245)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(200, 200, 210)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

-- Тень
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.ZIndex = 0
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.8
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Parent = MainFrame

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 0, 35)
Title.Position = UDim2.new(0, 12, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "⭐ Hitbox"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(60, 60, 70)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

-- Кнопка закрытия
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 95, 95)
CloseBtn.Text = "✕"
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- Линия разделителя
local Line = Instance.new("Frame")
Line.Size = UDim2.new(1, -24, 0, 1)
Line.Position = UDim2.new(0, 12, 0, 40)
Line.BackgroundColor3 = Color3.fromRGB(220, 220, 230)
Line.BorderSizePixel = 0
Line.Parent = MainFrame

-- ═══════════════════════════════════════
-- 🎯 ПЕРЕКЛЮЧАТЕЛЬ
-- ═══════════════════════════════════════

local ToggleFrame = Instance.new("Frame")
ToggleFrame.Size = UDim2.new(1, -24, 0, 40)
ToggleFrame.Position = UDim2.new(0, 12, 0, 50)
ToggleFrame.BackgroundColor3 = Color3.fromRGB(250, 250, 255)
ToggleFrame.BorderSizePixel = 0
ToggleFrame.Parent = MainFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 6)
ToggleCorner.Parent = ToggleFrame

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.Size = UDim2.new(1, -65, 1, 0)
ToggleLabel.Position = UDim2.new(0, 12, 0, 0)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Text = "Включить"
ToggleLabel.Font = Enum.Font.Gotham
ToggleLabel.TextColor3 = Color3.fromRGB(80, 80, 90)
ToggleLabel.TextSize = 14
ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
ToggleLabel.Parent = ToggleFrame

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 45, 0, 24)
ToggleBtn.Position = UDim2.new(1, -50, 0.5, -12)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 210)
ToggleBtn.Text = ""
ToggleBtn.BorderSizePixel = 0
ToggleBtn.Parent = ToggleFrame

local ToggleBtnCorner = Instance.new("UICorner")
ToggleBtnCorner.CornerRadius = UDim.new(1, 0)
ToggleBtnCorner.Parent = ToggleBtn

local Circle = Instance.new("Frame")
Circle.Size = UDim2.new(0, 18, 0, 18)
Circle.Position = UDim2.new(0, 3, 0.5, -9)
Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Circle.BorderSizePixel = 0
Circle.Parent = ToggleBtn

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = Circle

-- ═══════════════════════════════════════
-- 📏 РАЗМЕР
-- ═══════════════════════════════════════

local SizeFrame = Instance.new("Frame")
SizeFrame.Size = UDim2.new(1, -24, 0, 40)
SizeFrame.Position = UDim2.new(0, 12, 0, 95)
SizeFrame.BackgroundColor3 = Color3.fromRGB(250, 250, 255)
SizeFrame.BorderSizePixel = 0
SizeFrame.Parent = MainFrame

local SizeCorner = Instance.new("UICorner")
SizeCorner.CornerRadius = UDim.new(0, 6)
SizeCorner.Parent = SizeFrame

local SizeLabel = Instance.new("TextLabel")
SizeLabel.Size = UDim2.new(0, 80, 1, 0)
SizeLabel.Position = UDim2.new(0, 12, 0, 0)
SizeLabel.BackgroundTransparency = 1
SizeLabel.Text = "Размер"
SizeLabel.Font = Enum.Font.Gotham
SizeLabel.TextColor3 = Color3.fromRGB(80, 80, 90)
SizeLabel.TextSize = 14
SizeLabel.TextXAlignment = Enum.TextXAlignment.Left
SizeLabel.Parent = SizeFrame

local ValueLabel = Instance.new("TextLabel")
ValueLabel.Size = UDim2.new(0, 45, 0, 26)
ValueLabel.Position = UDim2.new(0.5, -22, 0.5, -13)
ValueLabel.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
ValueLabel.Text = tostring(Settings.Size)
ValueLabel.Font = Enum.Font.GothamBold
ValueLabel.TextColor3 = Color3.fromRGB(60, 60, 70)
ValueLabel.TextSize = 14
ValueLabel.BorderSizePixel = 0
ValueLabel.Parent = SizeFrame

local ValueCorner = Instance.new("UICorner")
ValueCorner.CornerRadius = UDim.new(0, 5)
ValueCorner.Parent = ValueLabel

local MinusBtn = Instance.new("TextButton")
MinusBtn.Size = UDim2.new(0, 30, 0, 26)
MinusBtn.Position = UDim2.new(1, -75, 0.5, -13)
MinusBtn.BackgroundColor3 = Color3.fromRGB(255, 120, 120)
MinusBtn.Text = "-"
MinusBtn.TextSize = 18
MinusBtn.Font = Enum.Font.GothamBold
MinusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusBtn.BorderSizePixel = 0
MinusBtn.Parent = SizeFrame

local MinusCorner = Instance.new("UICorner")
MinusCorner.CornerRadius = UDim.new(0, 5)
MinusCorner.Parent = MinusBtn

local PlusBtn = Instance.new("TextButton")
PlusBtn.Size = UDim2.new(0, 30, 0, 26)
PlusBtn.Position = UDim2.new(1, -40, 0.5, -13)
PlusBtn.BackgroundColor3 = Color3.fromRGB(120, 220, 120)
PlusBtn.Text = "+"
PlusBtn.TextSize = 18
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.BorderSizePixel = 0
PlusBtn.Parent = SizeFrame

local PlusCorner = Instance.new("UICorner")
PlusCorner.CornerRadius = UDim.new(0, 5)
PlusCorner.Parent = PlusBtn

-- ═══════════════════════════════════════
-- 🎮 ЛОГИКА КНОПОК
-- ═══════════════════════════════════════

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    
    if MainFrame.Visible then
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back), {
            Size = UDim2.new(0, 260, 0, 140),
            Position = UDim2.new(0.5, -130, 0.5, -70)
        }):Play()
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.15), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    task.wait(0.15)
    MainFrame.Visible = false
end)

ToggleBtn.MouseButton1Click:Connect(function()
    Settings.Enabled = not Settings.Enabled
    
    TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Settings.Enabled and Color3.fromRGB(120, 220, 120) or Color3.fromRGB(200, 200, 210)
    }):Play()
    
    TweenService:Create(Circle, TweenInfo.new(0.2), {
        Position = Settings.Enabled and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    }):Play()
end)

MinusBtn.MouseButton1Click:Connect(function()
    if Settings.Size > 5 then
        Settings.Size = Settings.Size - 5
        ValueLabel.Text = tostring(Settings.Size)
    end
end)

PlusBtn.MouseButton1Click:Connect(function()
    if Settings.Size < 50 then
        Settings.Size = Settings.Size + 5
        ValueLabel.Text = tostring(Settings.Size)
    end
end)

-- ═══════════════════════════════════════
-- 💫 HITBOX СИСТЕМА (ИСПРАВЛЕНА - БЕЗ ЛАГОВ)
-- ═══════════════════════════════════════

local function IsEnemy(player)
    if not LocalPlayer.Team then return true end
    if not player.Team then return true end
    return player.Team ~= LocalPlayer.Team
end

-- Применяем хитбокс БЕЗ визуала (чтобы не лагало)
RunService.Heartbeat:Connect(function()
    if not Settings.Enabled then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and IsEnemy(player) then
            local character = player.Character
            if character then
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    -- Просто меняем размер, БЕЗ создания новых объектов
                    hrp.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
                    hrp.Transparency = 1
                    hrp.CanCollide = false
                end
            end
        end
    end
end)

-- Визуал через Handles (не создаёт лаги)
local HandlesCache = {}

local function UpdateVisuals()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and IsEnemy(player) then
            local character = player.Character
            if character then
                local hrp = character:FindFirstChild("HumanoidRootPart")
                
                if hrp and Settings.Enabled then
                    if not HandlesCache[player] then
                        local handles = Instance.new("Handles")
                        handles.Adornee = hrp
                        handles.Faces = Faces.new()
                        handles.Color3 = Color3.fromRGB(255, 100, 100)
                        handles.Style = Enum.HandlesStyle.Resize
                        handles.Parent = hrp
                        HandlesCache[player] = handles
                    end
                    
                    -- Создаём SelectionBox для контура
                    if not hrp:FindFirstChild("HitboxOutline") then
                        local outline = Instance.new("SelectionBox")
                        outline.Name = "HitboxOutline"
                        outline.Adornee = hrp
                        outline.LineThickness = 0.03
                        outline.Color3 = Color3.fromRGB(255, 80, 80)
                        outline.Transparency = 0.3
                        outline.Parent = hrp
                    end
                else
                    if HandlesCache[player] then
                        HandlesCache[player]:Destroy()
                        HandlesCache[player] = nil
                    end
                    
                    local outline = hrp and hrp:FindFirstChild("HitboxOutline")
                    if outline then
                        outline:Destroy()
                    end
                end
            end
        end
    end
end

-- Обновляем визуалы каждые 0.5 сек (не лагает)
spawn(function()
    while task.wait(0.5) do
        UpdateVisuals()
    end
end)

-- Очистка при выходе игрока
Players.PlayerRemoving:Connect(function(player)
    if HandlesCache[player] then
        HandlesCache[player]:Destroy()
        HandlesCache[player] = nil
    end
end)

-- Уведомление
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "⭐ Hitbox Hub";
    Text = "Загружено успешно!";
    Duration = 2;
})

print("⭐ Hitbox Hub работает!")

-- ═══════════════════════════════════════
-- 👁️ ESP СИСТЕМА (2/2)
-- ═══════════════════════════════════════

local ESPSettings = {
    Enabled = false,
    CircleSize = 15
}

local AutoShotSettings = {
    Enabled = false,
    FOV = 200,
    ShootDelay = 0.1
}

-- Добавляем кнопки в меню
local ESPFrame = Instance.new("Frame")
ESPFrame.Size = UDim2.new(1, -24, 0, 40)
ESPFrame.Position = UDim2.new(0, 12, 1, 10)
ESPFrame.BackgroundColor3 = Color3.fromRGB(250, 250, 255)
ESPFrame.BorderSizePixel = 0
ESPFrame.Parent = MainFrame

local ESPCorner = Instance.new("UICorner")
ESPCorner.CornerRadius = UDim.new(0, 6)
ESPCorner.Parent = ESPFrame

local ESPLabel = Instance.new("TextLabel")
ESPLabel.Size = UDim2.new(1, -65, 1, 0)
ESPLabel.Position = UDim2.new(0, 12, 0, 0)
ESPLabel.BackgroundTransparency = 1
ESPLabel.Text = "ESP (Кружок)"
ESPLabel.Font = Enum.Font.Gotham
ESPLabel.TextColor3 = Color3.fromRGB(80, 80, 90)
ESPLabel.TextSize = 14
ESPLabel.TextXAlignment = Enum.TextXAlignment.Left
ESPLabel.Parent = ESPFrame

local ESPBtn = Instance.new("TextButton")
ESPBtn.Size = UDim2.new(0, 45, 0, 24)
ESPBtn.Position = UDim2.new(1, -50, 0.5, -12)
ESPBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 210)
ESPBtn.Text = ""
ESPBtn.BorderSizePixel = 0
ESPBtn.Parent = ESPFrame

local ESPBtnCorner = Instance.new("UICorner")
ESPBtnCorner.CornerRadius = UDim.new(1, 0)
ESPBtnCorner.Parent = ESPBtn

local ESPCircle = Instance.new("Frame")
ESPCircle.Size = UDim2.new(0, 18, 0, 18)
ESPCircle.Position = UDim2.new(0, 3, 0.5, -9)
ESPCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ESPCircle.BorderSizePixel = 0
ESPCircle.Parent = ESPBtn

local ESPCircleCorner = Instance.new("UICorner")
ESPCircleCorner.CornerRadius = UDim.new(1, 0)
ESPCircleCorner.Parent = ESPCircle

-- AutoShot кнопка
local AutoShotFrame = Instance.new("Frame")
AutoShotFrame.Size = UDim2.new(1, -24, 0, 40)
AutoShotFrame.Position = UDim2.new(0, 12, 1, 55)
AutoShotFrame.BackgroundColor3 = Color3.fromRGB(250, 250, 255)
AutoShotFrame.BorderSizePixel = 0
AutoShotFrame.Parent = MainFrame

local AutoShotCorner = Instance.new("UICorner")
AutoShotCorner.CornerRadius = UDim.new(0, 6)
AutoShotCorner.Parent = AutoShotFrame

local AutoShotLabel = Instance.new("TextLabel")
AutoShotLabel.Size = UDim2.new(1, -65, 1, 0)
AutoShotLabel.Position = UDim2.new(0, 12, 0, 0)
AutoShotLabel.BackgroundTransparency = 1
AutoShotLabel.Text = "AutoShot"
AutoShotLabel.Font = Enum.Font.Gotham
AutoShotLabel.TextColor3 = Color3.fromRGB(80, 80, 90)
AutoShotLabel.TextSize = 14
AutoShotLabel.TextXAlignment = Enum.TextXAlignment.Left
AutoShotLabel.Parent = AutoShotFrame

local AutoShotBtn = Instance.new("TextButton")
AutoShotBtn.Size = UDim2.new(0, 45, 0, 24)
AutoShotBtn.Position = UDim2.new(1, -50, 0.5, -12)
AutoShotBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 210)
AutoShotBtn.Text = ""
AutoShotBtn.BorderSizePixel = 0
AutoShotBtn.Parent = AutoShotFrame

local AutoShotBtnCorner = Instance.new("UICorner")
AutoShotBtnCorner.CornerRadius = UDim.new(1, 0)
AutoShotBtnCorner.Parent = AutoShotBtn

local AutoShotCircle = Instance.new("Frame")
AutoShotCircle.Size = UDim2.new(0, 18, 0, 18)
AutoShotCircle.Position = UDim2.new(0, 3, 0.5, -9)
AutoShotCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoShotCircle.BorderSizePixel = 0
AutoShotCircle.Parent = AutoShotBtn

local AutoShotCircleCorner = Instance.new("UICorner")
AutoShotCircleCorner.CornerRadius = UDim.new(1, 0)
AutoShotCircleCorner.Parent = AutoShotCircle

-- Увеличиваем размер меню
MainFrame.Size = UDim2.new(0, 260, 0, 230)

-- Логика ESP кнопки
ESPBtn.MouseButton1Click:Connect(function()
    ESPSettings.Enabled = not ESPSettings.Enabled
    
    TweenService:Create(ESPBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = ESPSettings.Enabled and Color3.fromRGB(120, 220, 120) or Color3.fromRGB(200, 200, 210)
    }):Play()
    
    TweenService:Create(ESPCircle, TweenInfo.new(0.2), {
        Position = ESPSettings.Enabled and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    }):Play()
end)

-- Логика AutoShot кнопки
AutoShotBtn.MouseButton1Click:Connect(function()
    AutoShotSettings.Enabled = not AutoShotSettings.Enabled
    
    TweenService:Create(AutoShotBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = AutoShotSettings.Enabled and Color3.fromRGB(120, 220, 120) or Color3.fromRGB(200, 200, 210)
    }):Play()
    
    TweenService:Create(AutoShotCircle, TweenInfo.new(0.2), {
        Position = AutoShotSettings.Enabled and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    }):Play()
end)

-- ═══════════════════════════════════════
-- 🔴 ESP КРАСНЫЙ КРУЖОК
-- ═══════════════════════════════════════

local ESPCache = {}
local Camera = workspace.CurrentCamera

local function CreateESP(player)
    if ESPCache[player] then return end
    
    local character = player.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    -- Создаём BillboardGui
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP"
    billboard.Adornee = hrp
    billboard.Size = UDim2.new(0, ESPSettings.CircleSize * 2, 0, ESPSettings.CircleSize * 2)
    billboard.StudsOffset = Vector3.new(0, 0, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = hrp
    
    -- Красный круг
    local circle = Instance.new("ImageLabel")
    circle.Size = UDim2.new(1, 0, 1, 0)
    circle.BackgroundTransparency = 1
    circle.Image = "rbxassetid://3570695787"
    circle.ImageColor3 = Color3.fromRGB(255, 50, 50)
    circle.ImageTransparency = 0.3
    circle.Parent = billboard
    
    -- Обводка
    local outline = Instance.new("ImageLabel")
    outline.Size = UDim2.new(1.2, 0, 1.2, 0)
    outline.Position = UDim2.new(0.5, 0, 0.5, 0)
    outline.AnchorPoint = Vector2.new(0.5, 0.5)
    outline.BackgroundTransparency = 1
    outline.Image = "rbxassetid://3570695787"
    outline.ImageColor3 = Color3.fromRGB(255, 0, 0)
    outline.ImageTransparency = 0.1
    outline.Parent = billboard
    
    -- Highlight через стены
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 50, 50)
    highlight.FillTransparency = 0.7
    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineTransparency = 0
    highlight.Parent = character
    
    ESPCache[player] = {billboard = billboard, highlight = highlight}
end

local function RemoveESP(player)
    if ESPCache[player] then
        if ESPCache[player].billboard then
            ESPCache[player].billboard:Destroy()
        end
        if ESPCache[player].highlight then
            ESPCache[player].highlight:Destroy()
        end
        ESPCache[player] = nil
    end
end

-- Обновление ESP
RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and IsEnemy(player) and player.Character then
            if ESPSettings.Enabled then
                if not ESPCache[player] then
                    CreateESP(player)
                end
            else
                RemoveESP(player)
            end
        end
    end
end)

-- Очистка ESP
Players.PlayerRemoving:Connect(function(player)
    RemoveESP(player)
end)

-- ═══════════════════════════════════════
-- 🎯 AUTOSHOT СИСТЕМА
-- ═══════════════════════════════════════

local Mouse = LocalPlayer:GetMouse()
local lastShot = 0

local function GetClosestEnemy()
    local closestPlayer = nil
    local shortestDistance = AutoShotSettings.FOV
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and IsEnemy(player) and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            local head = player.Character:FindFirstChild("Head")
            
            if hrp and head then
                local screenPoint, onScreen = Camera:WorldToScreenPoint(head.Position)
                
                if onScreen then
                    local mousePos = Vector2.new(Mouse.X, Mouse.Y)
                    local distance = (mousePos - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
                    
                    if distance < shortestDistance then
                        shortestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end
    
    return closestPlayer
end

local function Shoot()
    local currentTime = tick()
    if currentTime - lastShot < AutoShotSettings.ShootDelay then
        return
    end
    
    -- Находим инструмент (оружие)
    local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
    
    if tool then
        -- Пытаемся выстрелить разными способами
        pcall(function()
            -- Метод 1: Mouse1Click
            if tool:FindFirstChild("Fire") then
                tool.Fire:FireServer()
            end
            
            -- Метод 2: RemoteEvent
            for _, v in pairs(tool:GetDescendants()) do
                if v:IsA("RemoteEvent") and (v.Name == "Fire" or v.Name == "Shoot" or v.Name == "MouseClick") then
                    v:FireServer()
                end
            end
            
            -- Метод 3: Активация
            tool:Activate()
        end)
        
        lastShot = currentTime
    end
end

-- Основной цикл AutoShot
RunService.Heartbeat:Connect(function()
    if not AutoShotSettings.Enabled then return end
    
    local target = GetClosestEnemy()
    if target and target.Character then
        local head = target.Character:FindFirstChild("Head")
        if head then
            -- Наводим камеру
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
            
            -- Стреляем
            Shoot()
        end
    end
end)

-- FOV круг (визуализация)
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 50
FOVCircle.Radius = AutoShotSettings.FOV
FOVCircle.Filled = false
FOVCircle.Visible = false
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Transparency = 0.5

RunService.RenderStepped:Connect(function()
    if AutoShotSettings.Enabled then
        FOVCircle.Visible = true
        FOVCircle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
        FOVCircle.Radius = AutoShotSettings.FOV
    else
        FOVCircle.Visible = false
    end
end)

print("✅ ESP и AutoShot добавлены!")
