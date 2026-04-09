--[[
    ⭐ STAR HITBOX HUB ⭐
    Compact Mobile Version
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- Настройки
local Settings = {
    Enabled = false,
    Size = 20,
    ShowBox = false
}

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "StarHitboxHub"
ScreenGui.ResetOnSpawn = false

if UserInputService.TouchEnabled then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
else
    pcall(function()
        ScreenGui.Parent = game:GetService("CoreGui")
    end)
end

-- ═══════════════════════════════════════
-- 🔘 КНОПКА ОТКРЫТИЯ/ЗАКРЫТИЯ
-- ═══════════════════════════════════════

local OpenButton = Instance.new("TextButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.new(0, 60, 0, 60)
OpenButton.Position = UDim2.new(0, 10, 0.5, -30)
OpenButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
OpenButton.Text = "⭐"
OpenButton.TextSize = 30
OpenButton.Font = Enum.Font.GothamBold
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.BorderSizePixel = 0
OpenButton.Active = true
OpenButton.Draggable = true
OpenButton.Parent = ScreenGui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 15)
OpenCorner.Parent = OpenButton

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Color = Color3.fromRGB(100, 150, 255)
OpenStroke.Thickness = 3
OpenStroke.Parent = OpenButton

-- ═══════════════════════════════════════
-- 📱 КОМПАКТНОЕ МЕНЮ
-- ═══════════════════════════════════════

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 280, 0, 220)
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(100, 150, 255)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 0, 40)
Title.Position = UDim2.new(0, 15, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "⭐ HITBOX HUB"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

-- Кнопка закрытия
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "✕"
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- ═══════════════════════════════════════
-- 🎯 ПЕРЕКЛЮЧАТЕЛЬ HITBOX
-- ═══════════════════════════════════════

local ToggleFrame = Instance.new("Frame")
ToggleFrame.Size = UDim2.new(1, -30, 0, 45)
ToggleFrame.Position = UDim2.new(0, 15, 0, 50)
ToggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ToggleFrame.BorderSizePixel = 0
ToggleFrame.Parent = MainFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleFrame

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.Size = UDim2.new(1, -70, 1, 0)
ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Text = "🎯 Включить Hitbox"
ToggleLabel.Font = Enum.Font.Gotham
ToggleLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
ToggleLabel.TextSize = 15
ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
ToggleLabel.Parent = ToggleFrame

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 50, 0, 26)
ToggleBtn.Position = UDim2.new(1, -55, 0.5, -13)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
ToggleBtn.Text = ""
ToggleBtn.BorderSizePixel = 0
ToggleBtn.Parent = ToggleFrame

local ToggleBtnCorner = Instance.new("UICorner")
ToggleBtnCorner.CornerRadius = UDim.new(1, 0)
ToggleBtnCorner.Parent = ToggleBtn

local Circle = Instance.new("Frame")
Circle.Size = UDim2.new(0, 20, 0, 20)
Circle.Position = UDim2.new(0, 3, 0.5, -10)
Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Circle.BorderSizePixel = 0
Circle.Parent = ToggleBtn

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = Circle

-- ═══════════════════════════════════════
-- 👁️ ПОКАЗАТЬ ХИТБОКС
-- ═══════════════════════════════════════

local ShowFrame = Instance.new("Frame")
ShowFrame.Size = UDim2.new(1, -30, 0, 45)
ShowFrame.Position = UDim2.new(0, 15, 0, 105)
ShowFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ShowFrame.BorderSizePixel = 0
ShowFrame.Parent = MainFrame

local ShowCorner = Instance.new("UICorner")
ShowCorner.CornerRadius = UDim.new(0, 8)
ShowCorner.Parent = ShowFrame

local ShowLabel = Instance.new("TextLabel")
ShowLabel.Size = UDim2.new(1, -70, 1, 0)
ShowLabel.Position = UDim2.new(0, 15, 0, 0)
ShowLabel.BackgroundTransparency = 1
ShowLabel.Text = "👁️ Показать квадрат"
ShowLabel.Font = Enum.Font.Gotham
ShowLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
ShowLabel.TextSize = 15
ShowLabel.TextXAlignment = Enum.TextXAlignment.Left
ShowLabel.Parent = ShowFrame

local ShowBtn = Instance.new("TextButton")
ShowBtn.Size = UDim2.new(0, 50, 0, 26)
ShowBtn.Position = UDim2.new(1, -55, 0.5, -13)
ShowBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
ShowBtn.Text = ""
ShowBtn.BorderSizePixel = 0
ShowBtn.Parent = ShowFrame

local ShowBtnCorner = Instance.new("UICorner")
ShowBtnCorner.CornerRadius = UDim.new(1, 0)
ShowBtnCorner.Parent = ShowBtn

local ShowCircle = Instance.new("Frame")
ShowCircle.Size = UDim2.new(0, 20, 0, 20)
ShowCircle.Position = UDim2.new(0, 3, 0.5, -10)
ShowCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ShowCircle.BorderSizePixel = 0
ShowCircle.Parent = ShowBtn

local ShowCircleCorner = Instance.new("UICorner")
ShowCircleCorner.CornerRadius = UDim.new(1, 0)
ShowCircleCorner.Parent = ShowCircle

-- ═══════════════════════════════════════
-- 📏 СЛАЙДЕР РАЗМЕРА
-- ═══════════════════════════════════════

local SliderFrame = Instance.new("Frame")
SliderFrame.Size = UDim2.new(1, -30, 0, 55)
SliderFrame.Position = UDim2.new(0, 15, 0, 160)
SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
SliderFrame.BorderSizePixel = 0
SliderFrame.Parent = MainFrame

local SliderCorner = Instance.new("UICorner")
SliderCorner.CornerRadius = UDim.new(0, 8)
SliderCorner.Parent = SliderFrame

local SliderLabel = Instance.new("TextLabel")
SliderLabel.Size = UDim2.new(1, -60, 0, 20)
SliderLabel.Position = UDim2.new(0, 15, 0, 8)
SliderLabel.BackgroundTransparency = 1
SliderLabel.Text = "📏 Размер"
SliderLabel.Font = Enum.Font.Gotham
SliderLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
SliderLabel.TextSize = 15
SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
SliderLabel.Parent = SliderFrame

local ValueLabel = Instance.new("TextLabel")
ValueLabel.Size = UDim2.new(0, 50, 0, 20)
ValueLabel.Position = UDim2.new(1, -60, 0, 8)
ValueLabel.BackgroundTransparency = 1
ValueLabel.Text = tostring(Settings.Size)
ValueLabel.Font = Enum.Font.GothamBold
ValueLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
ValueLabel.TextSize = 15
ValueLabel.Parent = SliderFrame

local SliderBar = Instance.new("Frame")
SliderBar.Size = UDim2.new(1, -30, 0, 6)
SliderBar.Position = UDim2.new(0, 15, 1, -15)
SliderBar.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
SliderBar.BorderSizePixel = 0
SliderBar.Parent = SliderFrame

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(1, 0)
BarCorner.Parent = SliderBar

local Fill = Instance.new("Frame")
Fill.Size = UDim2.new((Settings.Size - 5) / 45, 0, 1, 0)
Fill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
Fill.BorderSizePixel = 0
Fill.Parent = SliderBar

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1, 0)
FillCorner.Parent = Fill

local SliderBtn = Instance.new("TextButton")
SliderBtn.Size = UDim2.new(1, 0, 1, 20)
SliderBtn.Position = UDim2.new(0, 0, 0, -10)
SliderBtn.BackgroundTransparency = 1
SliderBtn.Text = ""
SliderBtn.Parent = SliderBar

-- ═══════════════════════════════════════
-- 🎮 ЛОГИКА КНОПОК
-- ═══════════════════════════════════════

-- Открытие/Закрытие меню
OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    
    if MainFrame.Visible then
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
            Size = UDim2.new(0, 280, 0, 220),
            Position = UDim2.new(0.5, -140, 0.5, -110)
        }):Play()
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.2), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    task.wait(0.2)
    MainFrame.Visible = false
end)

-- Переключатель Hitbox
ToggleBtn.MouseButton1Click:Connect(function()
    Settings.Enabled = not Settings.Enabled
    
    TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Settings.Enabled and Color3.fromRGB(100, 200, 100) or Color3.fromRGB(60, 60, 70)
    }):Play()
    
    TweenService:Create(Circle, TweenInfo.new(0.2), {
        Position = Settings.Enabled and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
    }):Play()
end)

-- Показать квадрат
ShowBtn.MouseButton1Click:Connect(function()
    Settings.ShowBox = not Settings.ShowBox
    
    TweenService:Create(ShowBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Settings.ShowBox and Color3.fromRGB(100, 200, 100) or Color3.fromRGB(60, 60, 70)
    }):Play()
    
    TweenService:Create(ShowCircle, TweenInfo.new(0.2), {
        Position = Settings.ShowBox and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
    }):Play()
end)

-- Слайдер
local dragging = false

local function updateSlider(input)
    local pos = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
    local value = math.floor(5 + 45 * pos)
    
    Settings.Size = value
    Fill.Size = UDim2.new(pos, 0, 1, 0)
    ValueLabel.Text = tostring(value)
end

SliderBtn.MouseButton1Down:Connect(function()
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

-- ═══════════════════════════════════════
-- 💫 HITBOX СИСТЕМА
-- ═══════════════════════════════════════

local HitboxParts = {}

local function UpdateHitbox(character)
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    -- Удаляем старый визуал
    if HitboxParts[character] then
        HitboxParts[character]:Destroy()
        HitboxParts[character] = nil
    end
    
    if Settings.Enabled then
        -- Увеличиваем хитбокс
        hrp.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
        hrp.Transparency = 1
        hrp.CanCollide = false
        hrp.Massless = true
        
        -- Показываем визуал
        if Settings.ShowBox then
            local box = Instance.new("Part")
            box.Name = "HitboxVis"
            box.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
            box.CFrame = hrp.CFrame
            box.Transparency = 0.7
            box.Color = Color3.fromRGB(255, 0, 0)
            box.Material = Enum.Material.Neon
            box.CanCollide = false
            box.Anchored = false
            box.Massless = true
            box.Parent = character
            
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = hrp
            weld.Part1 = box
            weld.Parent = box
            
            HitboxParts[character] = box
        end
    else
        -- Возвращаем стандартный размер
        hrp.Size = Vector3.new(2, 2, 1)
        hrp.Transparency = 1
    end
end

-- Обновление хитбоксов
RunService.Heartbeat:Connect(function()
    if not Settings.Enabled then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local hrp = character:FindFirstChild("HumanoidRootPart")
            
            if hrp then
                -- Обновляем размер
                if hrp.Size ~= Vector3.new(Settings.Size, Settings.Size, Settings.Size) then
                    hrp.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
                    hrp.Transparency = 1
                    hrp.CanCollide = false
                    hrp.Massless = true
                end
                
                -- Обновляем визуал
                if Settings.ShowBox then
                    if not HitboxParts[character] or not HitboxParts[character].Parent then
                        UpdateHitbox(character)
                    else
                        local box = HitboxParts[character]
                        if box.Size ~= Vector3.new(Settings.Size, Settings.Size, Settings.Size) then
                            box.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
                        end
                    end
                else
                    if HitboxParts[character] then
                        HitboxParts[character]:Destroy()
                        HitboxParts[character] = nil
                    end
                end
            end
        end
    end
end)

-- Новые игроки
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        task.wait(1)
        if Settings.Enabled then
            UpdateHitbox(character)
        end
    end)
end)

-- Очистка
Players.PlayerRemoving:Connect(function(player)
    if player.Character and HitboxParts[player.Character] then
        HitboxParts[player.Character]:Destroy()
        HitboxParts[player.Character] = nil
    end
end)

-- Уведомление
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "⭐ STAR HITBOX HUB";
    Text = "Загружено! Нажми на звезду";
    Duration = 3;
})

print("⭐ STAR HITBOX HUB загружен!")
