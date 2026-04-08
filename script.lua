local ADM_KEY = "adminkey"
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera

-- СОЗДАНИЕ МЕНЮ (СТИЛЬ IY)
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Holder = Instance.new("Frame", ScreenGui)
Holder.Size = UDim2.new(0, 250, 0, 30)
Holder.Position = UDim2.new(0.5, -125, 0.1, 0)
Holder.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
Holder.BorderSizePixel = 0
Holder.Active = true
Holder.Draggable = true

local Title = Instance.new("TextLabel", Holder)
Title.Size = UDim2.new(1, -30, 1, 0)
Title.Position = UDim2.new(0, 5, 0, 0)
Title.Text = "IY CLONE (ENTER KEY)"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.SourceSans

local Input = Instance.new("TextBox", Holder)
Input.Size = UDim2.new(1, 0, 0, 30)
Input.Position = UDim2.new(0, 0, 1, 0)
Input.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Input.BorderSizePixel = 0
Input.TextColor3 = Color3.new(1, 1, 1)
Input.PlaceholderText = "Command Bar..."
Input.Text = ""
Input.Font = Enum.Font.SourceSans
Input.TextSize = 18

-- ПЕРЕМЕННЫЕ ФУНКЦИЙ
local flySpeed = 0
local flyConnection = nil
local bodyVel = nil

-- Функция Fly как в IY
local function setFly(speed)
    flySpeed = speed
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    if bodyVel then bodyVel:Destroy() end
    if flyConnection then flyConnection:Disconnect() end

    if speed > 0 then
        bodyVel = Instance.new("BodyVelocity", char.HumanoidRootPart)
        bodyVel.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        
        flyConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if char and char:FindFirstChild("HumanoidRootPart") then
                bodyVel.Velocity = camera.CFrame.LookVector * (flySpeed * 2.5)
            end
        end)
    end
end

-- Обработка ввода
Input.FocusLost:Connect(function(enter)
    if not enter then return end
    local raw = Input.Text:lower()
    
    -- Проверка ключа
    if Title.Text == "IY CLONE (ENTER KEY)" then
        if raw == ADM_KEY then
            Title.Text = "Infinite Yield Lite"
            Input.PlaceholderText = "fly [1-100], jp [1-100], chams"
        else
            Input.Text = "WRONG KEY"
            task.wait(1)
        end
    else
        -- Команды
        local args = string.split(raw, " ")
        local cmd = args[1]
        local val = tonumber(args[2])

        if cmd == "fly" then
            setFly(val or 0)
        elseif cmd == "jp" or cmd == "jump" then
            if val and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.JumpPower = val * 2
                player.Character.Humanoid.UseJumpPower = true
            end
        elseif cmd == "chams" then
            for _, p in pairs(game.Players:GetPlayers()) do
                if p ~= player and p.Character then
                    local h = Instance.new("Highlight", p.Character)
                    h.FillColor = Color3.new(1, 0, 0)
                end
            end
        elseif cmd == "unfly" then
            setFly(0)
        end
    end
    Input.Text = ""
end)
