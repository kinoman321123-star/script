-- Настройки
local ADM_KEY = "adminkey"
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Создание UI
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 260, 0, 130)
Main.Position = UDim2.new(0.5, -130, 0.2, 0)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.Active = true
Main.Draggable = true 

local Corner = Instance.new("UICorner", Main)
Corner.CornerRadius = ToolPunchItem.new(0, 10)

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Text = "ВВЕДИТЕ КЛЮЧ"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Instance.new("UICorner", Title)

local Input = Instance.new("TextBox", Main)
Input.Size = UDim2.new(0.9, 0, 0, 40)
Input.Position = UDim2.new(0.05, 0, 0.45, 0)
Input.PlaceholderText = "Ключ или Команда..."
Input.Text = ""
Input.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Input.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Input)

-- Функционал
local flying = false
local flyBV = nil

local function setFly(speed)
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    if flyBV then flyBV:Destroy() end
    
    if speed > 0 then
        flying = true
        flyBV = Instance.new("BodyVelocity", char.HumanoidRootPart)
        flyBV.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        
        task.spawn(function()
            while flying and char:FindFirstChild("HumanoidRootPart") do
                -- Летим по направлению взгляда (удобно для тачскрина)
                flyBV.Velocity = camera.CFrame.LookVector * (speed * 3)
                task.wait()
            end
        end)
    else
        flying = false
    end
end

-- Обработка ввода (Enter на клавиатуре телефона)
Input.FocusLost:Connect(function(enterPressed)
    if not enterPressed then return end
    
    local text = Input.Text:lower()
    local args = string.split(text, " ")
    local cmd = args[1]
    local val = tonumber(args[2]) -- Считывает любое введенное число

    if Title.Text == "ВВЕДИТЕ КЛЮЧ" then
        if text == ADM_KEY then
            Title.Text = "fly [1-100], jump [1-100], chams"
            Input.PlaceholderText = "Например: fly 29"
        else
            Input.Text = "НЕВЕРНО"
            task.wait(1)
        end
    else
        -- Свободный ввод значений
        if cmd == "fly" then
            setFly(val or 0)
        elseif cmd == "jump" then
            if val and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.JumpPower = val * 2.5
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
        end
    end
    Input.Text = ""
end)
