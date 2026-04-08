local ADM_KEY = "adminkey"
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- СОЗДАНИЕ ИНТЕРФЕЙСА В СТИЛЕ INFINITE YIELD
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Holder = Instance.new("Frame", ScreenGui)
Holder.Name = "IY_Mobile_Clone"
Holder.Size = UDim2.new(0, 300, 0, 35)
Holder.Position = UDim2.new(0.5, -150, 0.05, 0)
Holder.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
Holder.BorderSizePixel = 0
Holder.Active = true
Holder.Draggable = true

local TopBar = Instance.new("Frame", Holder)
TopBar.Size = UDim2.new(1, 0, 0, 2)
TopBar.BackgroundColor3 = Color3.fromRGB(0, 255, 150) -- Неоновая полоска сверху
TopBar.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Holder)
Title.Size = UDim2.new(1, -10, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "ВВЕДИТЕ КЛЮЧ"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

local Input = Instance.new("TextBox", Holder)
Input.Size = UDim2.new(1, 0, 0, 30)
Input.Position = UDim2.new(0, 0, 1, 2)
Input.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Input.BorderSizePixel = 0
Input.PlaceholderText = "Напиши ключ..."
Input.Text = ""
Input.TextColor3 = Color3.new(1, 1, 1)
Input.Font = Enum.Font.SourceSans
Input.TextSize = 17

-- ПЕРЕМЕННЫЕ
local flying, noclip, godmode = false, false, false
local flyBV = nil
local noclipEvent = nil

-- ФУНКЦИИ
local function notify(txt, color)
    Title.Text = txt
    Title.TextColor3 = color or Color3.new(1,1,1)
end

local function setFly(speed, isNoclip)
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    if flyBV then flyBV:Destroy() end
    if noclipEvent then noclipEvent:Disconnect() end
    
    if speed > 0 then
        flying = true
        flyBV = Instance.new("BodyVelocity", char.HumanoidRootPart)
        flyBV.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        
        task.spawn(function()
            while flying and char:FindFirstChild("HumanoidRootPart") do
                flyBV.Velocity = camera.CFrame.LookVector * (speed * 3)
                task.wait()
            end
        end)
        
        if isNoclip then
            noclipEvent = RunService.Stepped:Connect(function()
                for _, part in pairs(char:GetChildren()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end)
        end
    else
        flying = false
        for _, part in pairs(char:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = true end
        end
    end
end

-- ОБРАБОТКА ВВОДА
Input.FocusLost:Connect(function(enter)
    if not enter then return end
    local text = Input.Text:lower()
    local args = string.split(text, " ")
    local cmd = args[1]
    local val = tonumber(args[2])

    if Title.Text == "ВВЕДИТЕ КЛЮЧ" or Title.Text == "КЛЮЧ НЕ ВЕРНО" then
        if text == ADM_KEY then
            notify("ВВЕДИТЕ КОМАНДУ", Color3.fromRGB(0, 255, 150))
            Input.PlaceholderText = "Пример: fly 29"
        else
            notify("КЛЮЧ НЕ ВЕРНО", Color3.new(1, 0, 0))
            -- Эффект тряски при ошибке
            local origPos = Holder.Position
            for i = 1, 5 do
                Holder.Position = origPos + UDim2.new(0, math.random(-5, 5), 0, 0)
                task.wait(0.05)
            end
            Holder.Position = origPos
        end
    else
        -- КОМАНДЫ
        if cmd == "fly" then
            setFly(val or 50, false)
        elseif cmd == "flynoclip" then
            setFly(val or 50, true)
        elseif cmd == "unfly" or cmd == "unflynoclip" then
            setFly(0, false)
        elseif cmd == "jp" or cmd == "jump" then
            if val and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.JumpPower = val * 2
                player.Character.Humanoid.UseJumpPower = true
            end
        elseif cmd == "god" then
            player.Character.Humanoid.MaxHealth = math.huge
            player.Character.Humanoid.Health = math.huge
            notify("БЕССМЕРТИЕ ВКЛ", Color3.new(1,1,0))
        elseif cmd == "ungod" then
            player.Character.Humanoid.MaxHealth = 100
            player.Character.Humanoid.Health = 100
            notify("БЕССМЕРТИЕ ВЫКЛ", Color3.new(1,1,1))
        elseif cmd == "chams" then
            for _, p in pairs(game.Players:GetPlayers()) do
                if p ~= player and p.Character then
                    local h = Instance.new("Highlight", p.Character)
                    h.FillColor = Color3.new(1, 0, 0)
                end
            end
        elseif cmd == "/spisok" then
            notify("fly, flynoclip, jp, god, chams", Color3.new(1,1,1))
        end
    end
    Input.Text = ""
end)

-- Плавное появление
Holder.Position = UDim2.new(0.5, -150, -0.1, 0)
TweenService:Create(Holder, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -150, 0.05, 0)}):Play()
