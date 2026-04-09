--[[
    ⭐ STAR HITBOX HUB ⭐
    Fixed Version
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
MainFrame.Size = UDim2.new(0, 280, 0, 180)
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -90)
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
-- 👁️ ПОКАЗАТЬ КВАДРАТ
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
-- 📏 РАЗМЕР С КНОПКАМИ +/-
-- ═══════════════════════════════════════

local SizeFrame = Instance.new("Frame")
SizeFrame.Size = UDim2.new(1, -30, 0, 45)
SizeFrame.Position = UDim2.new(0, 15, 1, -60)
SizeFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
SizeFrame.BorderSizePixel = 0
SizeFrame.Parent = MainFrame

local SizeCorner = Instance.new("UICorner")
SizeCorner.CornerRadius = UDim.new(0, 8)
SizeCorner.Parent = SizeFrame

local SizeLabel = Instance.new("TextLabel")
SizeLabel.Size = UDim2.new(0, 100, 1, 0)
SizeLabel.Position = UDim2.new(0, 15, 0, 0)
SizeLabel.BackgroundTransparency = 1
SizeLabel.Text = "📏 Размер"
SizeLabel.Font = Enum.Font.Gotham
SizeLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
SizeLabel.TextSize = 15
SizeLabel.TextXAlignment = Enum.TextXAlignment.Left
SizeLabel.Parent = SizeFrame

local ValueLabel = Instance.new("TextLabel")
ValueLabel.Size = UDim2.new(0, 50, 0, 30)
ValueLabel.Position = UDim2.new(0.5, -25, 0.5, -15)
ValueLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ValueLabel.Text = tostring(Settings.Size)
ValueLabel.Font = Enum.Font.GothamBold
ValueLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
ValueLabel.TextSize = 16
ValueLabel.BorderSizePixel = 0
ValueLabel.Parent = SizeFrame

local ValueCorner = Instance.new("UICorner")
ValueCorner.CornerRadius = UDim.new(0, 6)
ValueCorner.Parent = ValueLabel

local MinusBtn = Instance.new("TextButton")
MinusBtn.Size = UDim2.new(0, 35, 0, 30)
MinusBtn.Position = UDim2.new(1, -90, 0.5, -15)
MinusBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
MinusBtn.Text = "-"
MinusBtn.TextSize = 20
MinusBtn.Font = Enum.Font.GothamBold
MinusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusBtn.BorderSizePixel = 0
MinusBtn.Parent = SizeFrame

local MinusCorner = Instance.new("UICorner")
MinusCorner.CornerRadius = UDim.new(0, 6)
MinusCorner.Parent = MinusBtn

local PlusBtn = Instance.new("TextButton")
PlusBtn.Size = UDim2.new(0, 35, 0, 30)
PlusBtn.Position = UDim2.new(1, -50, 0.5, -15)
PlusBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
PlusBtn.Text = "+"
PlusBtn.TextSize = 20
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.BorderSizePixel = 0
PlusBtn.Parent = SizeFrame

local PlusCorner = Instance.new("UICorner")
PlusCorner.CornerRadius = UDim.new(0, 6)
PlusCorner.Parent = PlusBtn

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
            Size = UDim2.new(0, 280, 0, 180),
            Position = UDim2.new(0.5, -140, 0.5, -90)
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

-- Кнопки +/-
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
-- 💫 HITBOX СИСТЕМА (ИСПРАВЛЕНА)
-- ═══════════════════════════════════════

local HitboxParts = {}
local OriginalSizes = {}

local function IsEnemy(player)
    if not LocalPlayer.Team then return true end
    if not player.Team then return true end
    return player.Team ~= LocalPlayer.Team
end

local function ApplyHitbox(player)
    if not player or player == LocalPlayer then return end
    if not IsEnemy(player) then return end
    
    local character = player.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    -- Сохраняем оригинальный размер
    if not OriginalSizes[player] then
        OriginalSizes[player] = hrp.Size
    end
    
    if Settings.Enabled then
        -- Применяем хитбокс
        hrp.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
        hrp.Transparency = 1
        hrp.CanCollide = false
        hrp.Massless = true
        
        -- Создаём/обновляем визуал
        if Settings.ShowBox then
            if HitboxParts[player] and HitboxParts[player].Parent then
                -- Обновляем существующий
                local box = HitboxParts[player]
                box.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
            else
                -- Создаём новый
                local box = Instance.new("Part")
                box.Name = "HitboxVisual"
                box.Anchored = false
                box.CanCollide = false
                box.Transparency = 0.6
                box.Material = Enum.Material.ForceField
                box.Color = Color3.fromRGB(255, 0, 0)
                box.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
                box.CFrame = hrp.CFrame
                box.Massless = true
                
                -- Добавляем SelectionBox для чёткого контура
                local outline = Instance.new("SelectionBox")
                outline.LineThickness = 0.05
                outline.Color3 = Color3.fromRGB(255, 0, 0)
                outline.Adornee = box
                outline.Parent = box
                
                -- Видно через стены
                box.CastShadow = false
                for _, v in pairs(character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.LocalTransparencyModifier = 0
                    end
                end
                
                local weld = Instance.new("WeldConstraint")
                weld.Part0 = hrp
                weld.Part1 = box
                weld.Parent = box
                
                box.Parent = character
                HitboxParts[player] = box
            end
        else
            -- Удаляем визуал
            if HitboxParts[player] then
                HitboxParts[player]:Destroy()
                HitboxParts[player] = nil
            end
        end
    else
        -- Возвращаем оригинал
        if OriginalSizes[player] then
            hrp.Size = OriginalSizes[player]
        end
        
        if HitboxParts[player] then
            HitboxParts[player]:Destroy()
            HitboxParts[player] = nil
        end
    end
end

-- Основной цикл
RunService.Heartbeat:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if IsEnemy(player) then
                ApplyHitbox(player)
            else
                -- Убираем хитбокс с тиммейтов
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                if hrp and OriginalSizes[player] then
                    hrp.Size = OriginalSizes[player]
                end
                if HitboxParts[player] then
                    HitboxParts[player]:Destroy()
                    HitboxParts[player] = nil
                end
            end
        end
    end
end)

-- Новые игроки
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        task.wait(0.5)
        if IsEnemy(player) then
            ApplyHitbox(player)
        end
    end)
end)

-- Очистка
Players.PlayerRemoving:Connect(function(player)
    OriginalSizes[player] = nil
    if HitboxParts[player] then
        HitboxParts[player]:Destroy()
        HitboxParts[player] = nil
    end
end)

-- Уведомление
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "⭐ STAR HITBOX HUB";
    Text = "Загружено! Нажми ⭐";
    Duration = 3;
})

print("⭐ HITBOX HUB работает!")
