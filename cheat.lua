--[[
    Hitbox Expander Script
    Совместим с мобильными устройствами
]]

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Настройки
local Settings = {
    Enabled = false,
    HitboxSize = 15,
    Transparency = 0.7,
    ShowBox = true,
    TeamCheck = true,
    Color = Color3.fromRGB(255, 0, 0)
}

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HitboxExpanderGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Проверка на мобильное устройство
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

if isMobile then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
else
    ScreenGui.Parent = game:GetService("CoreGui")
end

-- Главное окно
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 420)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Закругление углов
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- Тень
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Parent = MainFrame

-- Заголовок
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

-- Фикс для нижних углов заголовка
local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0, 12)
TitleFix.Position = UDim2.new(0, 0, 1, -12)
TitleFix.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🎯 Hitbox Expander"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

-- Кнопка закрытия
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -45, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
CloseButton.Text = "✕"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

-- Контейнер для элементов
local Container = Instance.new("ScrollingFrame")
Container.Name = "Container"
Container.Size = UDim2.new(1, -20, 1, -70)
Container.Position = UDim2.new(0, 10, 0, 60)
Container.BackgroundTransparency = 1
Container.BorderSizePixel = 0
Container.ScrollBarThickness = 4
Container.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 105)
Container.CanvasSize = UDim2.new(0, 0, 0, 0)
Container.Parent = MainFrame

local ContainerList = Instance.new("UIListLayout")
ContainerList.Padding = UDim.new(0, 10)
ContainerList.SortOrder = Enum.SortOrder.LayoutOrder
ContainerList.Parent = Container

-- Функция создания переключателя
local function CreateToggle(name, defaultValue, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Name = name.."Toggle"
    ToggleFrame.Size = UDim2.new(1, 0, 0, 45)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Parent = Container
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 8)
    ToggleCorner.Parent = ToggleFrame
    
    local ToggleLabel = Instance.new("TextLabel")
    ToggleLabel.Size = UDim2.new(1, -60, 1, 0)
    ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.Text = name
    ToggleLabel.Font = Enum.Font.Gotham
    ToggleLabel.TextColor3 = Color3.fromRGB(200, 200, 205)
    ToggleLabel.TextSize = 14
    ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    ToggleLabel.Parent = ToggleFrame
    
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 50, 0, 25)
    ToggleButton.Position = UDim2.new(1, -60, 0.5, -12.5)
    ToggleButton.BackgroundColor3 = defaultValue and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(60, 60, 65)
    ToggleButton.Text = ""
    ToggleButton.Parent = ToggleFrame
    
    local ToggleBtnCorner = Instance.new("UICorner")
    ToggleBtnCorner.CornerRadius = UDim.new(1, 0)
    ToggleBtnCorner.Parent = ToggleButton
    
    local ToggleCircle = Instance.new("Frame")
    ToggleCircle.Size = UDim2.new(0, 19, 0, 19)
    ToggleCircle.Position = defaultValue and UDim2.new(1, -22, 0.5, -9.5) or UDim2.new(0, 3, 0.5, -9.5)
    ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleCircle.BorderSizePixel = 0
    ToggleCircle.Parent = ToggleButton
    
    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1, 0)
    CircleCorner.Parent = ToggleCircle
    
    local toggled = defaultValue
    
    ToggleButton.MouseButton1Click:Connect(function()
        toggled = not toggled
        callback(toggled)
        
        local colorTween = TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
            BackgroundColor3 = toggled and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(60, 60, 65)
        })
        
        local positionTween = TweenService:Create(ToggleCircle, TweenInfo.new(0.2), {
            Position = toggled and UDim2.new(1, -22, 0.5, -9.5) or UDim2.new(0, 3, 0.5, -9.5)
        })
        
        colorTween:Play()
        positionTween:Play()
    end)
    
    return ToggleButton
end

-- Функция создания слайдера
local function CreateSlider(name, min, max, defaultValue, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Name = name.."Slider"
    SliderFrame.Size = UDim2.new(1, 0, 0, 60)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Parent = Container
    
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 8)
    SliderCorner.Parent = SliderFrame
    
    local SliderLabel = Instance.new("TextLabel")
    SliderLabel.Size = UDim2.new(1, -30, 0, 20)
    SliderLabel.Position = UDim2.new(0, 15, 0, 8)
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.Text = name
    SliderLabel.Font = Enum.Font.Gotham
    SliderLabel.TextColor3 = Color3.fromRGB(200, 200, 205)
    SliderLabel.TextSize = 14
    SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    SliderLabel.Parent = SliderFrame
    
    local SliderValue = Instance.new("TextLabel")
    SliderValue.Size = UDim2.new(0, 50, 0, 20)
    SliderValue.Position = UDim2.new(1, -65, 0, 8)
    SliderValue.BackgroundTransparency = 1
    SliderValue.Text = tostring(defaultValue)
    SliderValue.Font = Enum.Font.GothamBold
    SliderValue.TextColor3 = Color3.fromRGB(0, 200, 100)
    SliderValue.TextSize = 14
    SliderValue.TextXAlignment = Enum.TextXAlignment.Right
    SliderValue.Parent = SliderFrame
    
    local SliderBar = Instance.new("Frame")
    SliderBar.Size = UDim2.new(1, -30, 0, 6)
    SliderBar.Position = UDim2.new(0, 15, 1, -18)
    SliderBar.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    SliderBar.BorderSizePixel = 0
    SliderBar.Parent = SliderFrame
    
    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = SliderBar
    
    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((defaultValue - min) / (max - min), 0, 1, 0)
    SliderFill.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = SliderBar
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = SliderFill
    
    local SliderButton = Instance.new("TextButton")
    SliderButton.Size = UDim2.new(1, 0, 1, 0)
    SliderButton.BackgroundTransparency = 1
    SliderButton.Text = ""
    SliderButton.Parent = SliderBar
    
    local dragging = false
    
    local function updateSlider(input)
        local pos = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * pos)
        
        SliderFill.Size = UDim2.new(pos, 0, 1, 0)
        SliderValue.Text = tostring(value)
        callback(value)
    end
    
    SliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)
    
    SliderButton.MouseButton1Click:Connect(function(x, y)
        updateSlider({Position = Vector2.new(x, y)})
    end)
    
    return SliderFrame
end

-- Создание элементов управления
CreateToggle("Включить Hitbox", Settings.Enabled, function(value)
    Settings.Enabled = value
end)

CreateToggle("Показать квадрат", Settings.ShowBox, function(value)
    Settings.ShowBox = value
end)

CreateToggle("Проверка команды", Settings.TeamCheck, function(value)
    Settings.TeamCheck = value
end)

CreateSlider("Размер хитбокса", 5, 50, Settings.HitboxSize, function(value)
    Settings.HitboxSize = value
end)

CreateSlider("Прозрачность", 0, 100, Settings.Transparency * 100, function(value)
    Settings.Transparency = value / 100
end)

-- Обновление размера canvas
ContainerList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Container.CanvasSize = UDim2.new(0, 0, 0, ContainerList.AbsoluteContentSize.Y + 10)
end)

-- Кнопка закрытия
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Хранилище оригинальных размеров
local OriginalSizes = {}
local HitboxParts = {}

-- Функция применения хитбокса
local function ApplyHitbox(character)
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    -- Сохраняем оригинальный размер
    if not OriginalSizes[character] then
        OriginalSizes[character] = humanoidRootPart.Size
    end
    
    -- Расширяем хитбокс
    if Settings.Enabled then
        humanoidRootPart.Size = Vector3.new(Settings.HitboxSize, Settings.HitboxSize, Settings.HitboxSize)
        humanoidRootPart.Transparency = 1
        humanoidRootPart.CanCollide = false
        
        -- Создаем визуальный куб
        if Settings.ShowBox and not HitboxParts[character] then
            local part = Instance.new("Part")
            part.Name = "HitboxVisual"
            part.Size = Vector3.new(Settings.HitboxSize, Settings.HitboxSize, Settings.HitboxSize)
            part.Transparency = Settings.Transparency
            part.Color = Settings.Color
            part.Material = Enum.Material.Neon
            part.CanCollide = false
            part.Anchored = false
            part.Parent = character
            
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = humanoidRootPart
            weld.Part1 = part
            weld.Parent = part
            
            HitboxParts[character] = part
        elseif HitboxParts[character] then
            HitboxParts[character].Size = Vector3.new(Settings.HitboxSize, Settings.HitboxSize, Settings.HitboxSize)
            HitboxParts[character].Transparency = Settings.Transparency
            HitboxParts[character].Visible = Settings.ShowBox
        end
    else
        -- Восстанавливаем оригинальный размер
        if OriginalSizes[character] then
            humanoidRootPart.Size = OriginalSizes[character]
            humanoidRootPart.Transparency = 1
            humanoidRootPart.CanCollide = false
        end
        
        -- Удаляем визуальный куб
        if HitboxParts[character] then
            HitboxParts[character]:Destroy()
            HitboxParts[character] = nil
        end
    end
end

-- Основной цикл
RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if Settings.TeamCheck then
                if player.Team ~= LocalPlayer.Team then
                    ApplyHitbox(player.Character)
                end
            else
                ApplyHitbox(player.Character)
            end
        end
    end
end)

-- Обработка новых игроков
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        wait(1)
        if Settings.TeamCheck then
            if player.Team ~= LocalPlayer.Team then
                ApplyHitbox(character)
            end
        else
            ApplyHitbox(character)
        end
    end)
end)

-- Очистка при выходе
Players.PlayerRemoving:Connect(function(player)
    if player.Character then
        OriginalSizes[player.Character] = nil
        if HitboxParts[player.Character] then
            HitboxParts[player.Character]:Destroy()
            HitboxParts[player.Character] = nil
        end
    end
end)

print("✅ Hitbox Expander загружен!")
