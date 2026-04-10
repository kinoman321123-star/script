-- Foven Hub | Blesk
-- Mobile Script

local function createWarning()
    local WarningGui = Instance.new("ScreenGui")
    local WarningFrame = Instance.new("Frame")
    local WarningTitle = Instance.new("TextLabel")
    local WarningText = Instance.new("TextLabel")
    local CloseButton = Instance.new("TextButton")
    local ContinueButton = Instance.new("TextButton")
    local UICorner1 = Instance.new("UICorner")
    local UICorner2 = Instance.new("UICorner")
    local UICorner3 = Instance.new("UICorner")

    WarningGui.Name = "WarningGui"
    WarningGui.Parent = game.CoreGui
    WarningGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    WarningFrame.Parent = WarningGui
    WarningFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    WarningFrame.BorderSizePixel = 0
    WarningFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    WarningFrame.Size = UDim2.new(0, 300, 0, 200)

    UICorner1.CornerRadius = UDim.new(0, 8)
    UICorner1.Parent = WarningFrame

    WarningTitle.Parent = WarningFrame
    WarningTitle.BackgroundTransparency = 1
    WarningTitle.Position = UDim2.new(0, 0, 0, 10)
    WarningTitle.Size = UDim2.new(1, 0, 0, 30)
    WarningTitle.Font = Enum.Font.GothamBold
    WarningTitle.Text = "⚠️ ПРЕДУПРЕЖДЕНИЕ"
    WarningTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
    WarningTitle.TextSize = 18

    WarningText.Parent = WarningFrame
    WarningText.BackgroundTransparency = 1
    WarningText.Position = UDim2.new(0, 15, 0, 50)
    WarningText.Size = UDim2.new(1, -30, 0, 80)
    WarningText.Font = Enum.Font.Gotham
    WarningText.Text = "Использование данного скрипта может привести к бану аккаунта!\n\nАвтор не несёт ответственности за последствия."
    WarningText.TextColor3 = Color3.fromRGB(200, 200, 200)
    WarningText.TextSize = 14
    WarningText.TextWrapped = true
    WarningText.TextYAlignment = Enum.TextYAlignment.Top

    CloseButton.Parent = WarningFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(0, 15, 1, -45)
    CloseButton.Size = UDim2.new(0, 130, 0, 35)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "Закрыть"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 14

    UICorner2.CornerRadius = UDim.new(0, 6)
    UICorner2.Parent = CloseButton

    ContinueButton.Parent = WarningFrame
    ContinueButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    ContinueButton.BorderSizePixel = 0
    ContinueButton.Position = UDim2.new(1, -145, 1, -45)
    ContinueButton.Size = UDim2.new(0, 130, 0, 35)
    ContinueButton.Font = Enum.Font.GothamBold
    ContinueButton.Text = "Продолжить"
    ContinueButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ContinueButton.TextSize = 14

    UICorner3.CornerRadius = UDim.new(0, 6)
    UICorner3.Parent = ContinueButton

    CloseButton.MouseButton1Click:Connect(function()
        WarningGui:Destroy()
    end)

    ContinueButton.MouseButton1Click:Connect(function()
        WarningGui:Destroy()
        loadMainScript()
    end)
end

function loadMainScript()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local RootPart = Character:WaitForChild("HumanoidRootPart")

    -- Переменные
    local flyEnabled = false
    local speedEnabled = false
    local espEnabled = false
    local tpClickEnabled = false
    local spiderEnabled = false
    local speedValue = 16
    local flySpeed = 50

    -- GUI
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local CloseBtn = Instance.new("TextButton")
    local ScrollFrame = Instance.new("ScrollingFrame")
    
    local FlyButton = Instance.new("TextButton")
    local SpeedButton = Instance.new("TextButton")
    local SpeedSlider = Instance.new("TextBox")
    local EspButton = Instance.new("TextButton")
    local TpClickButton = Instance.new("TextButton")
    local SpiderButton = Instance.new("TextButton")

    ScreenGui.Name = "FovenHub"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
    MainFrame.Size = UDim2.new(0, 350, 0, 400)
    MainFrame.Active = true
    MainFrame.Draggable = true

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 10)
    MainCorner.Parent = MainFrame

    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 40)

    local TopCorner = Instance.new("UICorner")
    TopCorner.CornerRadius = UDim.new(0, 10)
    TopCorner.Parent = TopBar

    Title.Parent = TopBar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.Size = UDim2.new(1, -50, 1, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Foven Hub | Blesk"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left

    CloseBtn.Parent = TopBar
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Position = UDim2.new(1, -35, 0, 5)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 18

    ScrollFrame.Parent = MainFrame
    ScrollFrame.BackgroundTransparency = 1
    ScrollFrame.BorderSizePixel = 0
    ScrollFrame.Position = UDim2.new(0, 10, 0, 50)
    ScrollFrame.Size = UDim2.new(1, -20, 1, -60)
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 450)
    ScrollFrame.ScrollBarThickness = 4

    -- Функция создания кнопок
    local function createButton(name, position)
        local button = Instance.new("TextButton")
        button.Parent = ScrollFrame
        button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        button.BorderSizePixel = 0
        button.Position = UDim2.new(0, 0, 0, position)
        button.Size = UDim2.new(1, -10, 0, 45)
        button.Font = Enum.Font.Gotham
        button.Text = name
        button.TextColor3 = Color3.fromRGB(200, 200, 200)
        button.TextSize = 14
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = button
        
        return button
    end

    FlyButton = createButton("Fly: OFF", 10)
    SpeedButton = createButton("Speed: OFF", 65)
    SpeedSlider = createButton("Speed Value: 16", 120)
    SpeedSlider.Text = "Speed Value: 16"
    EspButton = createButton("ESP: OFF", 175)
    TpClickButton = createButton("TP Click: OFF", 230)
    SpiderButton = createButton("Spider: OFF", 285)

    -- Fly
    local flyConnection
    FlyButton.MouseButton1Click:Connect(function()
        flyEnabled = not flyEnabled
        FlyButton.Text = flyEnabled and "Fly: ON" or "Fly: OFF"
        FlyButton.BackgroundColor3 = flyEnabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(35, 35, 35)
        
        if flyEnabled then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.Parent = RootPart
            
            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
            bodyGyro.P = 10000
            bodyGyro.Parent = RootPart
            
            flyConnection = RunService.Heartbeat:Connect(function()
                if flyEnabled then
                    local camera = workspace.CurrentCamera
                    local moveDirection = Vector3.new(0, 0, 0)
                    
                    bodyGyro.CFrame = camera.CFrame
                    bodyVelocity.Velocity = camera.CFrame.LookVector * flySpeed
                end
            end)
        else
            if flyConnection then flyConnection:Disconnect() end
            for _, v in pairs(RootPart:GetChildren()) do
                if v:IsA("BodyVelocity") or v:IsA("BodyGyro") then
                    v:Destroy()
                end
            end
        end
    end)

    -- Speed
    SpeedButton.MouseButton1Click:Connect(function()
        speedEnabled = not speedEnabled
        SpeedButton.Text = speedEnabled and "Speed: ON" or "Speed: OFF"
        SpeedButton.BackgroundColor3 = speedEnabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(35, 35, 35)
        Humanoid.WalkSpeed = speedEnabled and speedValue or 16
    end)

    SpeedSlider.MouseButton1Click:Connect(function()
        SpeedSlider.Text = ""
    end)

    SpeedSlider.FocusLost:Connect(function()
        local value = tonumber(SpeedSlider.Text)
        if value then
            speedValue = value
            if speedEnabled then
                Humanoid.WalkSpeed = speedValue
            end
        end
        SpeedSlider.Text = "Speed Value: " .. speedValue
    end)

    -- ESP
    EspButton.MouseButton1Click:Connect(function()
        espEnabled = not espEnabled
        EspButton.Text = espEnabled and "ESP: ON" or "ESP: OFF"
        EspButton.BackgroundColor3 = espEnabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(35, 35, 35)
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                for _, part in pairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        if espEnabled then
                            local highlight = Instance.new("BoxHandleAdornment")
                            highlight.Size = part.Size
                            highlight.Adornee = part
                            highlight.Color3 = Color3.fromRGB(255, 0, 0)
                            highlight.Transparency = 0.5
                            highlight.ZIndex = 1
                            highlight.AlwaysOnTop = true
                            highlight.Parent = part
                        else
                            for _, v in pairs(part:GetChildren()) do
                                if v:IsA("BoxHandleAdornment") then
                                    v:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    -- TP Click
    local mouse = LocalPlayer:GetMouse()
    TpClickButton.MouseButton1Click:Connect(function()
        tpClickEnabled = not tpClickEnabled
        TpClickButton.Text = tpClickEnabled and "TP Click: ON" or "TP Click: OFF"
        TpClickButton.BackgroundColor3 = tpClickEnabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(35, 35, 35)
    end)

    mouse.Button1Down:Connect(function()
        if tpClickEnabled and mouse.Target then
            RootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
        end
    end)

    -- Spider
    SpiderButton.MouseButton1Click:Connect(function()
        spiderEnabled = not spiderEnabled
        SpiderButton.Text = spiderEnabled and "Spider: ON" or "Spider: OFF"
        SpiderButton.BackgroundColor3 = spiderEnabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(35, 35, 35)
    end)

    RunService.Heartbeat:Connect(function()
        if spiderEnabled then
            local ray = Ray.new(RootPart.Position, RootPart.CFrame.LookVector * 2)
            local hit = workspace:FindPartOnRay(ray, Character)
            if hit then
                Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
            end
        end
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end

createWarning()
