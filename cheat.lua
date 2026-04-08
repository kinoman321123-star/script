-- Проверка ключа
local ADMIN_KEY = "adminkey"
local hasAccess = false

-- Функция для создания окна ввода ключа
local function createKeySystem()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local KeyBox = Instance.new("TextBox")
    local UICorner2 = Instance.new("UICorner")
    local SubmitButton = Instance.new("TextButton")
    local UICorner3 = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")
    
    ScreenGui.Parent = game.CoreGui
    ScreenGui.Name = "KeySystem"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    Frame.Size = UDim2.new(0, 300, 0, 200)
    Frame.Active = true
    Frame.Draggable = true
    
    UICorner.CornerRadius = UDim.new(0, 15)
    UICorner.Parent = Frame
    
    Title.Parent = Frame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 0, 0, 10)
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "🔐 Введите ключ"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20
    
    KeyBox.Parent = Frame
    KeyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    KeyBox.BorderSizePixel = 0
    KeyBox.Position = UDim2.new(0.5, -120, 0.5, -15)
    KeyBox.Size = UDim2.new(0, 240, 0, 40)
    KeyBox.Font = Enum.Font.Gotham
    KeyBox.PlaceholderText = "Введите ключ..."
    KeyBox.Text = ""
    KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyBox.TextSize = 14
    KeyBox.ClearTextOnFocus = false
    
    UICorner2.CornerRadius = UDim.new(0, 8)
    UICorner2.Parent = KeyBox
    
    SubmitButton.Parent = Frame
    SubmitButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    SubmitButton.BorderSizePixel = 0
    SubmitButton.Position = UDim2.new(0.5, -80, 0.5, 40)
    SubmitButton.Size = UDim2.new(0, 160, 0, 40)
    SubmitButton.Font = Enum.Font.GothamBold
    SubmitButton.Text = "✓ Войти"
    SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitButton.TextSize = 16
    
    UICorner3.CornerRadius = UDim.new(0, 10)
    UICorner3.Parent = SubmitButton
    
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(88, 101, 242)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(115, 125, 255))
    }
    UIGradient.Rotation = 45
    UIGradient.Parent = SubmitButton
    
    -- Анимация кнопки
    SubmitButton.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(SubmitButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 170, 0, 45)}):Play()
    end)
    
    SubmitButton.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(SubmitButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 160, 0, 40)}):Play()
    end)
    
    SubmitButton.MouseButton1Click:Connect(function()
        if KeyBox.Text == ADMIN_KEY then
            hasAccess = true
            game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -150, -0.5, 0)}):Play()
            wait(0.4)
            ScreenGui:Destroy()
            createMainGUI()
        else
            KeyBox.Text = ""
            KeyBox.PlaceholderText = "❌ Неверный ключ!"
            wait(1)
            KeyBox.PlaceholderText = "Введите ключ..."
        end
    end)
end

-- Основной GUI
function createMainGUI()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    
    -- Настройки
    local Settings = {
        SilentAim = {
            Enabled = false,
            HitboxSize = 10,
            FOV = 100,
            ShowFOV = true,
            TeamCheck = true,
            WallCheck = false
        },
        Chams = {
            Enabled = false,
            Color = Color3.fromRGB(255, 0, 255),
            Transparency = 0.5,
            TeamCheck = true
        }
    }
    
    -- GUI элементы
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopBar = Instance.new("Frame")
    local UICorner2 = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local MinimizeButton = Instance.new("TextButton")
    local UICorner3 = Instance.new("UICorner")
    local ContentFrame = Instance.new("Frame")
    
    ScreenGui.Parent = game.CoreGui
    ScreenGui.Name = "SilentAimGUI"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Главная рамка
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    MainFrame.Size = UDim2.new(0, 500, 0, 400)
    MainFrame.ClipsDescendants = true
    
    UICorner.CornerRadius = UDim.new(0, 15)
    UICorner.Parent = MainFrame
    
    -- Верхняя панель
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 50)
    TopBar.Active = true
    
    UICorner2.CornerRadius = UDim.new(0, 15)
    UICorner2.Parent = TopBar
    
    -- Делаем перетаскиваемым
    local dragging, dragInput, dragStart, startPos
    
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            TweenService:Create(MainFrame, TweenInfo.new(0.1), {
                Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            }):Play()
        end
    end)
    
    Title.Parent = TopBar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.Size = UDim2.new(0.7, 0, 1, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "🎯 Silent Aim & Chams"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    MinimizeButton.Parent = TopBar
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 95, 95)
    MinimizeButton.Position = UDim2.new(1, -40, 0.5, -15)
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Text = "−"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 20
    
    UICorner3.CornerRadius = UDim.new(0, 8)
    UICorner3.Parent = MinimizeButton
    
    local isMinimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = UDim2.new(0, 500, 0, 50)}):Play()
            MinimizeButton.Text = "+"
        else
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = UDim2.new(0, 500, 0, 400)}):Play()
            MinimizeButton.Text = "−"
        end
    end)
    
    -- Контент
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Position = UDim2.new(0, 20, 0, 70)
    ContentFrame.Size = UDim2.new(1, -40, 1, -90)
    
    -- Функция создания переключателя
    local function createToggle(name, parent, position, callback)
        local ToggleFrame = Instance.new("Frame")
        local ToggleLabel = Instance.new("TextLabel")
        local ToggleButton = Instance.new("TextButton")
        local ToggleCorner = Instance.new("UICorner")
        local ToggleIndicator = Instance.new("Frame")
        local IndicatorCorner = Instance.new("UICorner")
        
        ToggleFrame.Parent = parent
        ToggleFrame.BackgroundTransparency = 1
        ToggleFrame.Position = position
        ToggleFrame.Size = UDim2.new(1, 0, 0, 40)
        
        ToggleLabel.Parent = ToggleFrame
        ToggleLabel.BackgroundTransparency = 1
        ToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
        ToggleLabel.Font = Enum.Font.Gotham
        ToggleLabel.Text = name
        ToggleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
        ToggleLabel.TextSize = 14
        ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        ToggleButton.Parent = ToggleFrame
        ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        ToggleButton.Position = UDim2.new(1, -60, 0.5, -15)
        ToggleButton.Size = UDim2.new(0, 60, 0, 30)
        ToggleButton.Text = ""
        
        ToggleCorner.CornerRadius = UDim.new(1, 0)
        ToggleCorner.Parent = ToggleButton
        
        ToggleIndicator.Parent = ToggleButton
        ToggleIndicator.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
        ToggleIndicator.Position = UDim2.new(0, 3, 0.5, -12)
        ToggleIndicator.Size = UDim2.new(0, 24, 0, 24)
        
        IndicatorCorner.CornerRadius = UDim.new(1, 0)
        IndicatorCorner.Parent = ToggleIndicator
        
        local enabled = false
        ToggleButton.MouseButton1Click:Connect(function()
            enabled = not enabled
            callback(enabled)
            
            if enabled then
                TweenService:Create(ToggleIndicator, TweenInfo.new(0.2), {
                    Position = UDim2.new(1, -27, 0.5, -12),
                    BackgroundColor3 = Color3.fromRGB(88, 101, 242)
                }):Play()
                TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(60, 70, 150)
                }):Play()
            else
                TweenService:Create(ToggleIndicator, TweenInfo.new(0.2), {
                    Position = UDim2.new(0, 3, 0.5, -12),
                    BackgroundColor3 = Color3.fromRGB(180, 180, 180)
                }):Play()
                TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                }):Play()
            end
        end)
        
        return ToggleFrame
    end
    
    -- Функция создания слайдера
    local function createSlider(name, parent, position, min, max, default, callback)
        local SliderFrame = Instance.new("Frame")
        local SliderLabel = Instance.new("TextLabel")
        local SliderValue = Instance.new("TextLabel")
        local SliderBack = Instance.new("Frame")
        local SliderCorner = Instance.new("UICorner")
        local SliderFill = Instance.new("Frame")
        local FillCorner = Instance.new("UICorner")
        local SliderButton = Instance.new("TextButton")
        
        SliderFrame.Parent = parent
        SliderFrame.BackgroundTransparency = 1
        SliderFrame.Position = position
        SliderFrame.Size = UDim2.new(1, 0, 0, 50)
        
        SliderLabel.Parent = SliderFrame
        SliderLabel.BackgroundTransparency = 1
        SliderLabel.Size = UDim2.new(0.5, 0, 0, 20)
        SliderLabel.Font = Enum.Font.Gotham
        SliderLabel.Text = name
        SliderLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
        SliderLabel.TextSize = 14
        SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        SliderValue.Parent = SliderFrame
        SliderValue.BackgroundTransparency = 1
        SliderValue.Position = UDim2.new(0.5, 0, 0, 0)
        SliderValue.Size = UDim2.new(0.5, 0, 0, 20)
        SliderValue.Font = Enum.Font.GothamBold
        SliderValue.Text = tostring(default)
        SliderValue.TextColor3 = Color3.fromRGB(88, 101, 242)
        SliderValue.TextSize = 14
        SliderValue.TextXAlignment = Enum.TextXAlignment.Right
        
        SliderBack.Parent = SliderFrame
        SliderBack.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        SliderBack.Position = UDim2.new(0, 0, 0, 30)
        SliderBack.Size = UDim2.new(1, 0, 0, 8)
        
        SliderCorner.CornerRadius = UDim.new(1, 0)
        SliderCorner.Parent = SliderBack
        
        SliderFill.Parent = SliderBack
        SliderFill.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        
        FillCorner.CornerRadius = UDim.new(1, 0)
        FillCorner.Parent = SliderFill
        
        SliderButton.Parent = SliderBack
        SliderButton.BackgroundTransparency = 1
        SliderButton.Size = UDim2.new(1, 0, 1, 0)
        SliderButton.Text = ""
        
        local dragging = false
        SliderButton.MouseButton1Down:Connect(function()
            dragging = true
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        SliderButton.MouseMoved:Connect(function(x)
            if dragging then
                local sizeX = math.clamp((x - SliderBack.AbsolutePosition.X) / SliderBack.AbsoluteSize.X, 0, 1)
                local value = math.floor(min + (max - min) * sizeX)
                
                SliderFill.Size = UDim2.new(sizeX, 0, 1, 0)
                SliderValue.Text = tostring(value)
                callback(value)
            end
        end)
        
        return SliderFrame
    end
    
    -- Создание UI элементов
    local yPos = 0
    
    -- Silent Aim секция
    local SilentAimTitle = Instance.new("TextLabel")
    SilentAimTitle.Parent = ContentFrame
    SilentAimTitle.BackgroundTransparency = 1
    SilentAimTitle.Position = UDim2.new(0, 0, 0, yPos)
    SilentAimTitle.Size = UDim2.new(1, 0, 0, 30)
    SilentAimTitle.Font = Enum.Font.GothamBold
    SilentAimTitle.Text = "🎯 Silent Aim"
    SilentAimTitle.TextColor3 = Color3.fromRGB(88, 101, 242)
    SilentAimTitle.TextSize = 16
    SilentAimTitle.TextXAlignment = Enum.TextXAlignment.Left
    yPos = yPos + 35
    
    createToggle("Включить Silent Aim", ContentFrame, UDim2.new(0, 0, 0, yPos), function(enabled)
        Settings.SilentAim.Enabled = enabled
    end)
    yPos = yPos + 45
    
    createSlider("Размер хитбокса", ContentFrame, UDim2.new(0, 0, 0, yPos), 1, 50, 10, function(value)
        Settings.SilentAim.HitboxSize = value
    end)
    yPos = yPos + 55
    
    createSlider("FOV", ContentFrame, UDim2.new(0, 0, 0, yPos), 10, 500, 100, function(value)
        Settings.SilentAim.FOV = value
    end)
    yPos = yPos + 55
    
    -- Chams секция
    local ChamsTitle = Instance.new("TextLabel")
    ChamsTitle.Parent = ContentFrame
    ChamsTitle.BackgroundTransparency = 1
    ChamsTitle.Position = UDim2.new(0, 0, 0, yPos)
    ChamsTitle.Size = UDim2.new(1, 0, 0, 30)
    ChamsTitle.Font = Enum.Font.GothamBold
    ChamsTitle.Text = "👁️ Chams (ESP)"
    ChamsTitle.TextColor3 = Color3.fromRGB(88, 101, 242)
    ChamsTitle.TextSize = 16
    ChamsTitle.TextXAlignment = Enum.TextXAlignment.Left
    yPos = yPos + 35
    
    createToggle("Включить Chams", ContentFrame, UDim2.new(0, 0, 0, yPos), function(enabled)
        Settings.Chams.Enabled = enabled
    end)
    
    -- Silent Aim функционал
    local FOVCircle = Drawing.new("Circle")
    FOVCircle.Thickness = 2
    FOVCircle.NumSides = 50
    FOVCircle.Radius = Settings.SilentAim.FOV
    FOVCircle.Filled = false
    FOVCircle.Visible = Settings.SilentAim.ShowFOV
    FOVCircle.Color = Color3.fromRGB(88, 101, 242)
    FOVCircle.Transparency = 1
    
    local function getClosestPlayer()
        local closestPlayer = nil
        local shortestDistance = math.huge
        local camera = workspace.CurrentCamera
        local localPlayer = Players.LocalPlayer
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local character = player.Character
                local hrp = character.HumanoidRootPart
                local screenPos, onScreen = camera:WorldToViewportPoint(hrp.Position)
                
                if onScreen then
                    local mousePos = UserInputService:GetMouseLocation()
                    local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    
                    if distance < Settings.SilentAim.FOV and distance < shortestDistance then
                        closestPlayer = player
                        shortestDistance = distance
                    end
                end
            end
        end
        
        return closestPlayer
    end
    
    -- Хук на стрельбу
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local args = {...}
        local method = getnamecallmethod()
        
        if Settings.SilentAim.Enabled and method == "FireServer" and tostring(self) == "RemoteEvent" then
            local target = getClosestPlayer()
            if target and target.Character then
                local head = target.Character:FindFirstChild("Head")
                if head then
                    args[2] = head.Position
                end
            end
        end
        
        return oldNamecall(self, unpack(args))
    end)
    
    -- Chams функционал
    local function addChams(character)
        if not Settings.Chams.Enabled then return end
        
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                local highlight = Instance.new("Highlight")
                highlight.Name = "Cham"
                highlight.FillColor = Settings.Chams.Color
                highlight.FillTransparency = Settings.Chams.Transparency
                highlight.OutlineTransparency = 1
                highlight.Parent = part
            end
        end
    end
    
    local function removeChams(character)
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("Highlight") and part.Name == "Cham" then
                part:Destroy()
            end
        end
    end
    
    -- Применение chams ко всем игрокам
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character then
            addChams(player.Character)
        end
        
        player.CharacterAdded:Connect(function(character)
            wait(0.5)
            if Settings.Chams.Enabled then
                addChams(character)
            end
        end)
    end
    
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            wait(0.5)
            if Settings.Chams.Enabled then
                addChams(character)
            end
        end)
    end)
    
    -- Обновление FOV круга
    RunService.RenderStepped:Connect(function()
        local mousePos = UserInputService:GetMouseLocation()
        FOVCircle.Position = mousePos
        FOVCircle.Radius = Settings.SilentAim.FOV
        FOVCircle.Visible = Settings.SilentAim.Enabled and Settings.SilentAim.ShowFOV
    end)
    
    print("✅ Silent Aim & Chams загружен!")
end

-- Запуск
createKeySystem()
