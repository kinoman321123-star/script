local ADM_KEY = "adminkey"
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- СОЗДАНИЕ ИНТЕРФЕЙСА (ГОТХАМ И НЕОН)
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 280, 0, 140)
Main.Position = UDim2.new(0.5, -140, -0.3, 0) -- Начальная позиция выше экрана
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true 

local Corner = Instance.new("UICorner", Main)
Corner.CornerRadius = ToolPunchItem.new(0, 10)

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Text = "ВВЕДИТЕ КЛЮЧ"
Title.TextColor3 = Color3.fromRGB(0, 255, 150) -- Неоново-зеленый
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Instance.new("UICorner", Title)

local Input = Instance.new("TextBox", Main)
Input.Size = UDim2.new(0.9, 0, 0, 45)
Input.Position = UDim2.new(0.05, 0, 0.45, 0)
Input.PlaceholderText = "Твой ключ или команда..."
Input.Text = ""
Input.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
Input.TextColor3 = Color3.new(1, 1, 1)
Input.Font = Enum.Font.Gotham
Input.TextSize = 14
Instance.new("UICorner", Input)

-- Панель списка команд (по умолчанию скрыта)
local ListFrame = Instance.new("Frame", Main)
ListFrame.Size = UDim2.new(1, 0, 0, 120)
ListFrame.Position = UDim2.new(0, 0, 1, 10)
ListFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
ListFrame.Visible = false
Instance.new("UICorner", ListFrame)

local ListText = Instance.new("TextLabel", ListFrame)
ListText.Size = UDim2.new(0.9, 0, 0.9, 0)
ListText.Position = UDim2.new(0.05, 0, 0.05, 0)
ListText.Text = [[
Список команд:
fly [1-100], unfly
jp [1-100]
chams
god, ungod
flynoclip, unflynoclip
/spisok (скрыть)
]]
ListText.TextColor3 = Color3.new(1, 1, 1)
ListText.BackgroundTransparency = 1
ListText.Font = Enum.Font.Gotham
ListText.TextSize = 12
ListText.TextXAlignment = Enum.TextXAlignment.Left

-- АНИМАЦИЯ ПОЯВЛЕНИЯ
Main:TweenPosition(UDim2.new(0.5, -140, 0.1, 0), "Out", "Back", 1)

-- ФУНКЦИОНАЛ
local flying, flyBV, noclipLoop, godPart = false, nil, nil, nil

local function toggleFly(speed, noclip)
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    if flyBV then flyBV:Destroy() end
    if noclipLoop then noclipLoop:Disconnect() end
    
    if speed > 0 then
        flying = true
        flyBV = Instance.new("BodyVelocity", char.HumanoidRootPart)
        flyBV.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        
        task.spawn(function()
            while flying and char:FindFirstChild("HumanoidRootPart") do
                flyBV.Velocity = camera.CFrame.LookVector * (speed * 2.5)
                task.wait()
            end
        end)
        
        if noclip then
            noclipLoop = RunService.Stepped:Connect(function()
                if char then
                    for _, part in pairs(char:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
    else
        flying = false
        if char:FindFirstChild("Humanoid") then
            for _, part in pairs(char:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end

Input.FocusLost:Connect(function(enterPressed)
    if not enterPressed then return end
    
    local text = Input.Text:lower()
    local args = string.split(text, " ")
    local cmd = args[1]
    local val = tonumber(args[2])

    if Title.Text == "ВВЕДИТЕ КЛЮЧ" then
        if text == ADM_KEY then
            Title.Text = "ВВЕДИТЕ КОМАНДУ"
            Title.TextColor3 = Color3.new(1, 1, 1)
            Input.PlaceholderText = "/spisok - для справки"
        else
            Title.Text = "КЛЮЧ НЕ ВЕРНО"
            Title.TextColor3 = Color3.new(1, 0, 0) -- Красный
            task.wait(1.5)
            Title.Text = "ВВЕДИТЕ КЛЮЧ"
            Title.TextColor3 = Color3.fromRGB(0, 255, 150)
        end
    else
        -- ОБРАБОТКА КОМАНД
        if cmd == "fly" then
            toggleFly(val or 0, false)
        elseif cmd == "unfly" then
            toggleFly(0, false)
        elseif cmd == "jp" or cmd == "jump" then
            if val and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.JumpPower = val * 2
                player.Character.Humanoid.UseJumpPower = true
            end
        elseif cmd == "chams" then
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= player and v.Character then
                    local h = Instance.new("Highlight", v.Character)
                    h.FillColor = Color3.new(1, 0, 0)
                    h.AlwaysOnTop = true
                end
            end
        elseif cmd == "god" then
            if player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.MaxHealth = 1e9 -- Почти бесконечное здоровье
                player.Character.Humanoid.Health = 1e9
            end
        elseif cmd == "ungod" then
            if player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.MaxHealth = 100
                player.Character.Humanoid.Health = 100
            end
        elseif cmd == "flynoclip" then
            toggleFly(val or 0, true)
        elseif cmd == "unflynoclip" then
            toggleFly(0, false)
        elseif cmd == "/spisok" then
            ListFrame.Visible = not ListFrame.Visible
        end
    end
    Input.Text = ""
end)
