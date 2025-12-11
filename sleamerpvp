-- Sleamer PVP Enhancement Script
-- Only for educational purposes in private servers

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Remove existing GUI if any
if game:GetService("CoreGui"):FindFirstChild("SleamerPVP") then
    game:GetService("CoreGui").SleamerPVP:Destroy()
end

-- Create main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SleamerPVP"
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.new(0.8, 0.8, 0.8)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Text = "SLEAMER PVP"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = MainFrame

-- Binds Info
local BindsLabel = Instance.new("TextLabel")
BindsLabel.Size = UDim2.new(0.9, 0, 0, 120)
BindsLabel.Position = UDim2.new(0.05, 0, 0.7, 0)
BindsLabel.BackgroundTransparency = 1
BindsLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
BindsLabel.Text = "BINDS:\nQ - Aim Assist\nC - Speed (30)\nT - 3rd Person\nZ - Super Jump\nF - Fly\nRightShift - Hide Menu\n\nFLY CONTROLS:\nWASD - Move\nMouse - Look\nSpace - Up\nCtrl - Down"
BindsLabel.Font = Enum.Font.Gotham
BindsLabel.TextSize = 11
BindsLabel.TextXAlignment = Enum.TextXAlignment.Left
BindsLabel.Parent = MainFrame

-- Function to create buttons
local function CreateButton(text, yPos)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, 40)
    button.Position = UDim2.new(0.05, 0, yPos, 0)
    button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = text
    button.Font = Enum.Font.Gotham
    button.TextSize = 12
    button.BorderSizePixel = 1
    button.BorderColor3 = Color3.new(0.5, 0.5, 0.5)
    button.Parent = MainFrame
    
    button.MouseEnter:Connect(function()
        if button.BackgroundColor3 == Color3.new(0.2, 0.2, 0.2) then
            button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
        end
    end)
    
    button.MouseLeave:Connect(function()
        if button.BackgroundColor3 ~= Color3.new(0.8, 0.8, 0.8) then
            button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        end
    end)
    
    return button
end

-- Create buttons
local AimButton = CreateButton("AIM ASSIST: OFF", 0.1)
local SpeedButton = CreateButton("SPEED (30): OFF", 0.25)
local ThirdPersonButton = CreateButton("3RD PERSON: OFF", 0.4)
local JumpButton = CreateButton("SUPER JUMP: OFF", 0.55)
local FlyButton = CreateButton("FLY: OFF", 0.7)

-- States
local AimEnabled = false
local SpeedEnabled = false
local ThirdPersonEnabled = false
local JumpEnabled = false
local FlyEnabled = false

local AimConnection
local SpeedConnection
local ThirdPersonConnection
local JumpConnection
local FlyConnection

-- Fly Variables (Уменьшенная скорость с 50 до 25)
local FlySpeed = 25 -- Уменьшено с 50 до 25
local BodyVelocity
local BodyGyro

-- Fly Function
local function ToggleFly()
    FlyEnabled = not FlyEnabled
    
    if FlyEnabled then
        FlyButton.Text = "FLY: ON"
        FlyButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
        FlyButton.TextColor3 = Color3.new(0, 0, 0)
        
        -- Enable flying
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = LocalPlayer.Character.HumanoidRootPart
            
            -- Create BodyVelocity for movement
            BodyVelocity = Instance.new("BodyVelocity")
            BodyVelocity.Velocity = Vector3.new(0, 0, 0)
            BodyVelocity.MaxForce = Vector3.new(40000, 40000, 40000)
            BodyVelocity.Parent = rootPart
            
            -- Create BodyGyro for stability
            BodyGyro = Instance.new("BodyGyro")
            BodyGyro.MaxTorque = Vector3.new(40000, 40000, 40000)
            BodyGyro.P = 1000
            BodyGyro.D = 50
            BodyGyro.Parent = rootPart
            
            -- Set initial position
            BodyGyro.CFrame = rootPart.CFrame
            
            -- Fly loop
            FlyConnection = RunService.Heartbeat:Connect(function()
                if not FlyEnabled or not LocalPlayer.Character then 
                    if FlyConnection then
                        FlyConnection:Disconnect()
                    end
                    return 
                end
                
                local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not rootPart or not BodyVelocity or not BodyGyro then return end
                
                -- Get camera direction
                local camera = Workspace.CurrentCamera
                local lookVector = camera.CFrame.LookVector
                local rightVector = camera.CFrame.RightVector
                
                -- Movement direction
                local moveDirection = Vector3.new(0, 0, 0)
                
                -- Forward/Backward (W/S)
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    moveDirection = moveDirection + lookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    moveDirection = moveDirection - lookVector
                end
                
                -- Left/Right (A/D)
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    moveDirection = moveDirection - rightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    moveDirection = moveDirection + rightVector
                end
                
                -- Up/Down (Space/Ctrl)
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    moveDirection = moveDirection + Vector3.new(0, 1, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
                    moveDirection = moveDirection - Vector3.new(0, 1, 0)
                end
                
                -- Normalize and apply speed (теперь с уменьшенной скоростью 25)
                if moveDirection.Magnitude > 0 then
                    moveDirection = moveDirection.Unit * FlySpeed
                end
                
                -- Apply movement
                BodyVelocity.Velocity = moveDirection
                
                -- Update gyro to match camera rotation (only yaw for natural movement)
                local currentCFrame = rootPart.CFrame
                local cameraCFrame = camera.CFrame
                BodyGyro.CFrame = CFrame.new(currentCFrame.Position, currentCFrame.Position + cameraCFrame.LookVector * Vector3.new(1, 0, 1))
            end)
        end
        
    else
        FlyButton.Text = "FLY: OFF"
        FlyButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        FlyButton.TextColor3 = Color3.new(1, 1, 1)
        
        -- Disable flying
        if FlyConnection then
            FlyConnection:Disconnect()
        end
        
        if BodyVelocity then
            BodyVelocity:Destroy()
            BodyVelocity = nil
        end
        
        if BodyGyro then
            BodyGyro:Destroy()
            BodyGyro = nil
        end
        
        -- Reset character state
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.PlatformStand = false
        end
    end
end

-- Переменные для прыжка
local OriginalJumpPower = 50
local SuperJumpPower = 65
local IsJumping = false
local JumpCooldown = false

-- Функция для применения скорости к текущему персонажу
local function ApplySpeed()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 30
        LocalPlayer.Character.Humanoid.JumpPower = 55
    end
end

-- Функция для сброса скорости к нормальной
local function ResetSpeed()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16
        LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end

-- Улучшенная функция супер-прыжка (уменьшенная)
local function ToggleJump()
    JumpEnabled = not JumpEnabled
    
    if JumpEnabled then
        JumpButton.Text = "SUPER JUMP: ON"
        JumpButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
        JumpButton.TextColor3 = Color3.new(0, 0, 0)
        
        -- Сохраняем оригинальную силу прыжка
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            OriginalJumpPower = LocalPlayer.Character.Humanoid.JumpPower
            LocalPlayer.Character.Humanoid.JumpPower = SuperJumpPower
        end
        
        -- Улучшенное подключение для прыжка
        JumpConnection = RunService.Heartbeat:Connect(function()
            if not JumpEnabled or not LocalPlayer.Character then return end
            
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if humanoid and rootPart then
                -- Поддерживаем силу супер-прыжка
                if humanoid.JumpPower ~= SuperJumpPower then
                    humanoid.JumpPower = SuperJumpPower
                end
                
                -- Определяем, когда игрок прыгает
                if humanoid:GetState() == Enum.HumanoidStateType.Jumping and not IsJumping and not JumpCooldown then
                    IsJumping = true
                    JumpCooldown = true
                    
                    -- Применяем уменьшенную вертикальную скорость
                    if rootPart then
                        local currentVelocity = rootPart.Velocity
                        -- Уменьшена вертикальная скорость
                        rootPart.Velocity = Vector3.new(currentVelocity.X, 85, currentVelocity.Z) -- Уменьшено до 85
                    end
                    
                    -- КД для предотвращения спама прыжками
                    task.spawn(function()
                        wait(0.5)
                        JumpCooldown = false
                    end)
                    
                elseif humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
                    IsJumping = false
                end
            end
        end)
        
        -- Автоматический прыжок при включении
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    else
        JumpButton.Text = "SUPER JUMP: OFF"
        JumpButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        JumpButton.TextColor3 = Color3.new(1, 1, 1)
        
        -- Восстанавливаем оригинальную силу прыжка
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = OriginalJumpPower
        end
        
        -- Очищаем подключение прыжка
        if JumpConnection then
            JumpConnection:Disconnect()
            JumpConnection = nil
        end
        
        IsJumping = false
        JumpCooldown = false
    end
end

-- 3rd Person Camera System
local function ToggleThirdPerson()
    ThirdPersonEnabled = not ThirdPersonEnabled
    
    if ThirdPersonEnabled then
        ThirdPersonButton.Text = "3RD PERSON: ON"
        ThirdPersonButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
        ThirdPersonButton.TextColor3 = Color3.new(0, 0, 0)
        
        local camera = Workspace.CurrentCamera
        
        ThirdPersonConnection = RunService.RenderStepped:Connect(function()
            if not ThirdPersonEnabled or not LocalPlayer.Character then return end
            
            local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not rootPart then return end
            
            -- Calculate camera position behind player
            local lookVector = rootPart.CFrame.LookVector
            local offset = CFrame.new(0, 3, 8)
            local desiredPosition = rootPart.CFrame * offset
            
            -- Smooth camera movement
            camera.CFrame = camera.CFrame:Lerp(CFrame.lookAt(desiredPosition.Position, rootPart.Position), 0.1)
        end)
    else
        ThirdPersonButton.Text = "3RD PERSON: OFF"
        ThirdPersonButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        ThirdPersonButton.TextColor3 = Color3.new(1, 1, 1)
        
        if ThirdPersonConnection then
            ThirdPersonConnection:Disconnect()
        end
    end
end

-- Optimized Aim Assist Function
local function ToggleAim()
    AimEnabled = not AimEnabled
    
    if AimEnabled then
        AimButton.Text = "AIM ASSIST: ON"
        AimButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
        AimButton.TextColor3 = Color3.new(0, 0, 0)
        
        AimConnection = RunService.RenderStepped:Connect(function()
            if not AimEnabled or not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
            
            local closestPlayer = nil
            local shortestDistance = 100
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.Head.Position).Magnitude
                    if distance < shortestDistance then
                        shortestDistance = distance
                        closestPlayer = player
                    end
                end
            end
            
            if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
                local targetPos = closestPlayer.Character.Head.Position
                Workspace.CurrentCamera.CFrame = CFrame.lookAt(Workspace.CurrentCamera.CFrame.Position, targetPos)
            end
        end)
    else
        AimButton.Text = "AIM ASSIST: OFF"
        AimButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        AimButton.TextColor3 = Color3.new(1, 1, 1)
        if AimConnection then
            AimConnection:Disconnect()
        end
    end
end

-- Enhanced SpeedHack - Fixed at 30 speed
local function ToggleSpeed()
    SpeedEnabled = not SpeedEnabled
    
    if SpeedEnabled then
        SpeedButton.Text = "SPEED (30): ON"
        SpeedButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
        SpeedButton.TextColor3 = Color3.new(0, 0, 0)
        
        -- Применяем скорость сразу
        ApplySpeed()
        
        SpeedConnection = RunService.Heartbeat:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                local humanoid = LocalPlayer.Character.Humanoid
                
                -- Fixed speed at 30
                if humanoid.WalkSpeed ~= 30 then
                    humanoid.WalkSpeed = 30
                end
                
                -- Jump power boost for better mobility
                if humanoid.JumpPower ~= 55 then
                    humanoid.JumpPower = 55
                end
            end
        end)
    else
        SpeedButton.Text = "SPEED (30): OFF"
        SpeedButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        SpeedButton.TextColor3 = Color3.new(1, 1, 1)
        
        if SpeedConnection then
            SpeedConnection:Disconnect()
        end
        
        ResetSpeed()
    end
end

-- Button click events
AimButton.MouseButton1Click:Connect(ToggleAim)
SpeedButton.MouseButton1Click:Connect(ToggleSpeed)
ThirdPersonButton.MouseButton1Click:Connect(ToggleThirdPerson)
JumpButton.MouseButton1Click:Connect(ToggleJump)
FlyButton.MouseButton1Click:Connect(ToggleFly)

-- Key binds
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Q then
        ToggleAim()
    elseif input.KeyCode == Enum.KeyCode.C then
        ToggleSpeed()
    elseif input.KeyCode == Enum.KeyCode.T then
        ToggleThirdPerson()
    elseif input.KeyCode == Enum.KeyCode.Z then
        ToggleJump()
    elseif input.KeyCode == Enum.KeyCode.F then
        ToggleFly()
    elseif input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- Исправленный авто-реконнект после респавна
LocalPlayer.CharacterAdded:Connect(function(character)
    -- Ждем полной загрузки персонажа
    character:WaitForChild("Humanoid")
    
    if SpeedEnabled then
        -- Применяем скорость к новому персонажу
        task.wait(0.5)
        ApplySpeed()
        
        -- Перезапускаем соединение скорости
        if SpeedConnection then
            SpeedConnection:Disconnect()
        end
        
        SpeedConnection = RunService.Heartbeat:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                local humanoid = LocalPlayer.Character.Humanoid
                
                -- Fixed speed at 30
                if humanoid.WalkSpeed ~= 30 then
                    humanoid.WalkSpeed = 30
                end
                
                -- Jump power boost for better mobility
                if humanoid.JumpPower ~= 55 then
                    humanoid.JumpPower = 55
                end
            end
        end)
    end
    
    if ThirdPersonEnabled then
        -- Перезапускаем 3rd person для нового персонажа
        ToggleThirdPerson()
        task.wait(0.1)
        ToggleThirdPerson()
    end
    
    if JumpEnabled then
        -- Перезапускаем прыжок для нового персонажа
        ToggleJump()
        task.wait(0.1)
        ToggleJump()
    end
    
    if FlyEnabled then
        -- Перезапускаем полет для нового персонажа
        ToggleFly()
        task.wait(0.1)
        ToggleFly()
    end
end)

-- Также применяем скорость при первом запуске, если она уже включена
if SpeedEnabled then
    task.wait(1)
    ApplySpeed()
end

print("Sleamer PVP Loaded!")
print("Features: Aim Assist, Speed (30), 3rd Person, Super Jump, Fly")
print("Binds: Q, C, T, Z, F, RightShift")
print("Fly Controls: WASD to move, Mouse to look, Space to go up, Ctrl to go down")
