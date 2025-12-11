-- LocalScript: TapePVP_Menu_Full_Binds
-- Поместить в StarterGui > StarterPlayerScripts или в ScreenGui

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Создаем основной GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TapePVP_GUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Главное окно с закругленными углами
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainMenu"
mainFrame.Size = UDim2.new(0, 179, 0, 260)
mainFrame.Position = UDim2.new(0.5, -89.5, 0.5, -130)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true

-- Закругленные углы
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- Эффект градиента/акцента
local accentFrame = Instance.new("Frame")
accentFrame.Name = "AccentBar"
accentFrame.Size = UDim2.new(1, 0, 0, 3)
accentFrame.Position = UDim2.new(0, 0, 0, 0)
accentFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
accentFrame.BorderSizePixel = 0
local accentCorner = Instance.new("UICorner")
accentCorner.CornerRadius = UDim.new(0, 8)
accentCorner.Parent = accentFrame

-- Заголовок
local titleFrame = Instance.new("Frame")
titleFrame.Name = "TitleBar"
titleFrame.Size = UDim2.new(1, 0, 0, 35)
titleFrame.Position = UDim2.new(0, 0, 0, 5)
titleFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleFrame.BorderSizePixel = 0
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 6)
titleCorner.Parent = titleFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, -35, 1, 0)
titleLabel.Position = UDim2.new(0, 5, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "TAPE PVP"
titleLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка-минусик/плюсик для открытия/закрытия меню
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "MinusToggle"
toggleButton.Size = UDim2.new(0, 25, 0, 25)
toggleButton.Position = UDim2.new(1, -30, 0, 5)
toggleButton.AnchorPoint = Vector2.new(1, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleButton.BorderSizePixel = 0
toggleButton.Text = "━"
toggleButton.TextColor3 = Color3.fromRGB(255, 0, 0)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 18
toggleButton.AutoButtonColor = false

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 4)
toggleCorner.Parent = toggleButton

-- Контентная область
local contentFrame = Instance.new("Frame")
contentFrame.Name = "Content"
contentFrame.Size = UDim2.new(1, -10, 1, -50)
contentFrame.Position = UDim2.new(0, 5, 0, 45)
contentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
contentFrame.BorderSizePixel = 0
local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 6)
contentCorner.Parent = contentFrame

-- Кнопка SPEED OPEN ZZZZ
local speedButton = Instance.new("TextButton")
speedButton.Name = "SpeedOpenButton"
speedButton.Size = UDim2.new(1, 0, 0, 30)
speedButton.Position = UDim2.new(0, 0, 0, 10)
speedButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
speedButton.BorderSizePixel = 0
speedButton.Text = "SPEED OPEN ZZZZ"
speedButton.TextColor3 = Color3.fromRGB(255, 0, 0)
speedButton.Font = Enum.Font.GothamBold
speedButton.TextSize = 13
speedButton.AutoButtonColor = false
local speedCorner = Instance.new("UICorner")
speedCorner.CornerRadius = UDim.new(0, 5)
speedCorner.Parent = speedButton

-- Индикатор статуса для кнопки SPEED
local speedStatusIndicator = Instance.new("Frame")
speedStatusIndicator.Name = "SpeedStatusIndicator"
speedStatusIndicator.Size = UDim2.new(0, 6, 0, 6)
speedStatusIndicator.Position = UDim2.new(1, -10, 0.5, -3)
speedStatusIndicator.AnchorPoint = Vector2.new(1, 0.5)
speedStatusIndicator.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Серый (неактивно)
speedStatusIndicator.BorderSizePixel = 0
local speedIndicatorCorner = Instance.new("UICorner")
speedIndicatorCorner.CornerRadius = UDim.new(0, 3)
speedIndicatorCorner.Parent = speedStatusIndicator

-- Кнопка JUMP BOOST
local jumpButton = Instance.new("TextButton")
jumpButton.Name = "JumpButton"
jumpButton.Size = UDim2.new(1, 0, 0, 30)
jumpButton.Position = UDim2.new(0, 0, 0, 50)
jumpButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
jumpButton.BorderSizePixel = 0
jumpButton.Text = "SUPER JUMP: OFF"
jumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpButton.Font = Enum.Font.GothamBold
jumpButton.TextSize = 13
jumpButton.AutoButtonColor = false
local jumpCorner = Instance.new("UICorner")
jumpCorner.CornerRadius = UDim.new(0, 5)
jumpCorner.Parent = jumpButton

-- Индикатор статуса для кнопки JUMP
local jumpStatusIndicator = Instance.new("Frame")
jumpStatusIndicator.Name = "JumpStatusIndicator"
jumpStatusIndicator.Size = UDim2.new(0, 8, 0, 8)
jumpStatusIndicator.Position = UDim2.new(1, -10, 0.5, -4)
jumpStatusIndicator.AnchorPoint = Vector2.new(1, 0.5)
jumpStatusIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (выключено)
jumpStatusIndicator.BorderSizePixel = 0
local jumpIndicatorCorner = Instance.new("UICorner")
jumpIndicatorCorner.CornerRadius = UDim.new(0, 4)
jumpIndicatorCorner.Parent = jumpStatusIndicator

-- Кнопка ANTI-RAGDOLL
local antiRagdollButton = Instance.new("TextButton")
antiRagdollButton.Name = "AntiRagdollButton"
antiRagdollButton.Size = UDim2.new(1, 0, 0, 30)
antiRagdollButton.Position = UDim2.new(0, 0, 0, 90)
antiRagdollButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
antiRagdollButton.BorderSizePixel = 0
antiRagdollButton.Text = "ANTI-RAGDOLL: OFF"
antiRagdollButton.TextColor3 = Color3.fromRGB(255, 255, 255)
antiRagdollButton.Font = Enum.Font.GothamBold
antiRagdollButton.TextSize = 13
antiRagdollButton.AutoButtonColor = false
local antiRagdollCorner = Instance.new("UICorner")
antiRagdollCorner.CornerRadius = UDim.new(0, 5)
antiRagdollCorner.Parent = antiRagdollButton

-- Индикатор статуса для кнопки ANTI-RAGDOLL
local antiRagdollStatusIndicator = Instance.new("Frame")
antiRagdollStatusIndicator.Name = "AntiRagdollStatusIndicator"
antiRagdollStatusIndicator.Size = UDim2.new(0, 8, 0, 8)
antiRagdollStatusIndicator.Position = UDim2.new(1, -10, 0.5, -4)
antiRagdollStatusIndicator.AnchorPoint = Vector2.new(1, 0.5)
antiRagdollStatusIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (выключено)
antiRagdollStatusIndicator.BorderSizePixel = 0
local antiRagdollIndicatorCorner = Instance.new("UICorner")
antiRagdollIndicatorCorner.CornerRadius = UDim.new(0, 4)
antiRagdollIndicatorCorner.Parent = antiRagdollStatusIndicator

-- Текст с информацией о биндах
local bindInfo = Instance.new("TextLabel")
bindInfo.Name = "BindInfo"
bindInfo.Size = UDim2.new(1, 0, 0, 20)
bindInfo.Position = UDim2.new(0, 0, 0, 130)
bindInfo.BackgroundTransparency = 1
bindInfo.Text = "[Z] JUMP  [X] ANTI-RAGDOLL"
bindInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
bindInfo.Font = Enum.Font.Gotham
bindInfo.TextSize = 11
bindInfo.TextXAlignment = Enum.TextXAlignment.Center

-- Собираем иерархию
speedStatusIndicator.Parent = speedButton
jumpStatusIndicator.Parent = jumpButton
antiRagdollStatusIndicator.Parent = antiRagdollButton
titleLabel.Parent = titleFrame
accentFrame.Parent = mainFrame
titleFrame.Parent = mainFrame
toggleButton.Parent = mainFrame
contentFrame.Parent = mainFrame
speedButton.Parent = contentFrame
jumpButton.Parent = contentFrame
antiRagdollButton.Parent = contentFrame
bindInfo.Parent = contentFrame
mainFrame.Parent = screenGui
screenGui.Parent = playerGui

-- Функция для перетаскивания окна
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

titleFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

-- Логика открытия/закрытия меню через минусик
local menuOpen = true
local originalSize = mainFrame.Size
local originalPosition = mainFrame.Position
local collapsedSize = UDim2.new(0, 50, 0, 35)
local collapsedPosition = UDim2.new(1, -30, 0, 10)

-- Анимация твина
local function toggleMenu()
    menuOpen = not menuOpen
    
    local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    if menuOpen then
        -- Открываем меню
        local openTween = TweenService:Create(mainFrame, tweenInfo, {
            Size = originalSize,
            Position = originalPosition,
            BackgroundTransparency = 0
        })
        
        -- Показываем контент
        contentFrame.Visible = true
        accentFrame.Visible = true
        
        -- Меняем на минус
        toggleButton.Text = "━"
        toggleButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        
        openTween:Play()
    else
        -- Закрываем меню
        local closeTween = TweenService:Create(mainFrame, tweenInfo, {
            Size = collapsedSize,
            Position = collapsedPosition,
            BackgroundTransparency = 0.2
        })
        
        -- Скрываем контент
        contentFrame.Visible = false
        accentFrame.Visible = false
        
        -- Меняем на плюс
        toggleButton.Text = "+"
        toggleButton.TextColor3 = Color3.fromRGB(0, 255, 100)
        
        closeTween:Play()
    end
end

-- Обработчик клика на минусик/плюсик
toggleButton.MouseButton1Click:Connect(toggleMenu)

-- Эффекты при наведении на кнопку
toggleButton.MouseEnter:Connect(function()
    toggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

toggleButton.MouseLeave:Connect(function()
    toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end)

-- ================================
-- ФУНКЦИЯ JUMP BOOST
-- ================================
local JumpEnabled = false
local OriginalJumpPower = 50 -- Стандартная сила прыжка
local SuperJumpPower = 100 -- Увеличенная сила прыжка
local JumpConnection = nil
local IsJumping = false
local JumpCooldown = false

-- Улучшенная функция супер-прыжка (уменьшенная)
local function ToggleJump()
    JumpEnabled = not JumpEnabled
    
    if JumpEnabled then
        jumpButton.Text = "SUPER JUMP: ON"
        jumpButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220) -- Светло-серый
        jumpButton.TextColor3 = Color3.fromRGB(0, 0, 0) -- Черный текст
        jumpStatusIndicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый
        
        -- Сохраняем оригинальную силу прыжка
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            OriginalJumpPower = player.Character.Humanoid.JumpPower
            player.Character.Humanoid.JumpPower = SuperJumpPower
        end
        
        -- Улучшенное подключение для прыжка
        JumpConnection = RunService.Heartbeat:Connect(function()
            if not JumpEnabled or not player.Character then return end
            
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            
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
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    else
        jumpButton.Text = "SUPER JUMP: OFF"
        jumpButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Темно-серый
        jumpButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Белый текст
        jumpStatusIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный
        
        -- Восстанавливаем оригинальную силу прыжка
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character.Humanoid.JumpPower = OriginalJumpPower
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

-- Обработчик нажатия на кнопку JUMP BOOST
jumpButton.MouseButton1Click:Connect(ToggleJump)

-- Эффекты наведения на кнопку JUMP
jumpButton.MouseEnter:Connect(function()
    if JumpEnabled then
        jumpButton.BackgroundColor3 = Color3.fromRGB(240, 240, 240) -- Еще светлее при включении
    else
        jumpButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Темнее при выключении
    end
end)

jumpButton.MouseLeave:Connect(function()
    if JumpEnabled then
        jumpButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220) -- Возвращаем к цвету включенного
    else
        jumpButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Возвращаем к цвету выключенного
    end
end)

-- ================================
-- ФУНКЦИЯ ANTI-RAGDOLL
-- ================================
local AntiRagdollEnabled = false
local AntiRagdollConnections = {}

-- Сохраняем оригинальные настройки
local originalWalkSpeed = 16
local originalJumpPower = 50
local originalAutoRotate = true

-- Функция блокировки падения
local function preventFalling()
    local lastYPosition = 0
    local connection
    
    if player.Character then
        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            lastYPosition = rootPart.Position.Y
        end
    end
    
    connection = RunService.Heartbeat:Connect(function()
        if not player.Character then return end
        
        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        local currentY = rootPart.Position.Y
        local deltaY = currentY - lastYPosition
        
        -- Если падаем слишком быстро (отрицательная скорость по Y)
        if deltaY < -2 then  -- Порог падения
            -- Телепортируем на последнюю безопасную высоту
            rootPart.CFrame = CFrame.new(
                rootPart.Position.X,
                lastYPosition,
                rootPart.Position.Z
            )
        else
            -- Обновляем последнюю безопасную высоту
            lastYPosition = currentY
        end
    end)
    
    table.insert(AntiRagdollConnections, connection)
end

-- Функция блокировки отскока
local function preventKnockback()
    local lastGoodPosition = Vector3.new(0, 0, 0)
    local positionLocked = false
    
    if player.Character then
        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            lastGoodPosition = rootPart.Position
        end
    end
    
    local connection = RunService.Heartbeat:Connect(function()
        if not player.Character then return end
        
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
        
        if not humanoid or not rootPart then return end
        
        -- Фиксируем позицию, но сохраняем возможность движения от пользователя
        local humanoidMoveDirection = humanoid.MoveDirection
        local isMoving = humanoidMoveDirection.Magnitude > 0
        
        if not isMoving and not positionLocked then
            -- Запоминаем позицию когда стоим
            lastGoodPosition = rootPart.Position
        end
        
        -- Блокируем резкие изменения позиции (отскок)
        local velocity = rootPart.Velocity
        local isBeingKnockedBack = math.abs(velocity.X) > 20 or 
                                   math.abs(velocity.Z) > 20 or
                                   math.abs(velocity.Y) > 30
        
        if isBeingKnockedBack then
            -- Сбрасываем внешнюю скорость, но сохраняем движение игрока
            if isMoving then
                -- Разрешаем движение только в направлении, куда смотрит игрок
                local moveDirection = humanoidMoveDirection * originalWalkSpeed
                rootPart.Velocity = Vector3.new(
                    moveDirection.X,
                    velocity.Y,  -- Оставляем вертикальную для прыжков
                    moveDirection.Z
                )
            else
                -- Полная блокировка если не двигаемся
                rootPart.Velocity = Vector3.new(0, velocity.Y, 0)
            end
        end
    end)
    
    table.insert(AntiRagdollConnections, connection)
end

-- Функция защиты состояний Humanoid
local function protectHumanoidStates()
    local connection1
    local connection2
    
    if player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            originalWalkSpeed = humanoid.WalkSpeed
            originalJumpPower = humanoid.JumpPower
            originalAutoRotate = humanoid.AutoRotate
        end
    end
    
    -- Блокируем нежелательные состояния
    connection1 = player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        
        humanoid.StateChanged:Connect(function(oldState, newState)
            local badStates = {
                Enum.HumanoidStateType.FallingDown,
                Enum.HumanoidStateType.Dead,
                Enum.HumanoidStateType.Ragdoll,
                Enum.HumanoidStateType.Flying
            }
            
            for _, badState in ipairs(badStates) do
                if newState == badState then
                    humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    break
                end
            end
        end)
    end)
    
    -- Защищаем от изменений скорости
    connection2 = RunService.Heartbeat:Connect(function()
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if humanoid.WalkSpeed ~= originalWalkSpeed then
                    humanoid.WalkSpeed = originalWalkSpeed
                end
                
                if humanoid.JumpPower ~= originalJumpPower then
                    humanoid.JumpPower = originalJumpPower
                end
            end
        end
    end)
    
    table.insert(AntiRagdollConnections, connection1)
    table.insert(AntiRagdollConnections, connection2)
end

-- Функция удаления анимаций урона
local function removeHurtAnimations()
    local connection = RunService.Heartbeat:Connect(function()
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                    local name = track.Name:lower()
                    if name:find("fall") or 
                       name:find("hurt") or 
                       name:find("damage") or 
                       name:find("death") or
                       name:find("knock") then
                        track:Stop()
                    end
                end
            end
        end
    end)
    
    table.insert(AntiRagdollConnections, connection)
end

-- Перехват внешних воздействий
local function interceptExternalForces()
    local connection = RunService.Heartbeat:Connect(function()
        if player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BodyVelocity") or 
                   part:IsA("BodyForce") or 
                   part:IsA("BodyThrust") or
                   part:IsA("RocketPropulsion") then
                    part:Destroy()
                end
            end
        end
    end)
    
    table.insert(AntiRagdollConnections, connection)
end

-- Основная функция Anti-Ragdoll
local function ToggleAntiRagdoll()
    AntiRagdollEnabled = not AntiRagdollEnabled
    
    if AntiRagdollEnabled then
        antiRagdollButton.Text = "ANTI-RAGDOLL: ON"
        antiRagdollButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        antiRagdollButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        antiRagdollStatusIndicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        
        -- Сохраняем оригинальные настройки
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                originalWalkSpeed = humanoid.WalkSpeed
                originalJumpPower = humanoid.JumpPower
                originalAutoRotate = humanoid.AutoRotate
                
                -- Настройка Humanoid
                humanoid.AutoRotate = true
                humanoid.BreakJointsOnDeath = false
                humanoid.RequiresNeck = false
            end
        end
        
        -- Запуск систем защиты
        preventFalling()
        preventKnockback()
        protectHumanoidStates()
        removeHurtAnimations()
        interceptExternalForces()
        
        print("[Anti-Ragdoll] Защита активирована")
    else
        antiRagdollButton.Text = "ANTI-RAGDOLL: OFF"
        antiRagdollButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        antiRagdollButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        antiRagdollStatusIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        
        -- Отключаем все соединения
        for _, connection in ipairs(AntiRagdollConnections) do
            if connection then
                connection:Disconnect()
            end
        end
        
        -- Очищаем таблицу соединений
        AntiRagdollConnections = {}
        
        -- Восстанавливаем оригинальные настройки
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = originalWalkSpeed
                humanoid.JumpPower = originalJumpPower
                humanoid.AutoRotate = originalAutoRotate
            end
        end
        
        print("[Anti-Ragdoll] Защита деактивирована")
    end
end

-- Обработчик нажатия на кнопку ANTI-RAGDOLL
antiRagdollButton.MouseButton1Click:Connect(ToggleAntiRagdoll)

-- Эффекты наведения на кнопку ANTI-RAGDOLL
antiRagdollButton.MouseEnter:Connect(function()
    if AntiRagdollEnabled then
        antiRagdollButton.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
    else
        antiRagdollButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)

antiRagdollButton.MouseLeave:Connect(function()
    if AntiRagdollEnabled then
        antiRagdollButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    else
        antiRagdollButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end
end)

-- ================================
-- ФУНКЦИЯ SPEED OPEN ZZZZ
-- ================================
local function injectSpeedScript()
    -- Меняем статус индикатора на желтый (загрузка)
    speedStatusIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    speedButton.Text = "ИНЖЕКТИМ..."
    speedButton.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    -- Пытаемся выполнить loadstring
    local success, errorMessage = pcall(function()
        -- Используем указанный loadstring
        loadstring(game:HttpGet("https://pastebin.com/raw/rmxfZDPd"))()
    end)
    
    if success then
        -- Успешный инжект
        speedStatusIndicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый
        speedButton.Text = "SPEED OPEN ZZZZ ✓"
        speedButton.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        -- Возвращаем оригинальный текст через 3 секунды
        wait(3)
        speedButton.Text = "SPEED OPEN ZZZZ"
        speedButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        speedStatusIndicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Оставляем зеленым
    else
        -- Ошибка
        speedStatusIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный
        speedButton.Text = "ОШИБКА ИНЖЕКТА"
        speedButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        
        -- Выводим ошибку в консоль
        warn("Ошибка инжекта SPEED OPEN ZZZZ:", errorMessage)
        
        -- Возвращаем оригинальный текст через 3 секунды
        wait(3)
        speedButton.Text = "SPEED OPEN ZZZZ"
        speedButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        speedStatusIndicator.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Возвращаем серый
    end
end

-- Эффекты наведения на кнопку SPEED
speedButton.MouseEnter:Connect(function()
    if speedButton.Text == "SPEED OPEN ZZZZ" then
        speedButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)

speedButton.MouseLeave:Connect(function()
    if speedButton.Text == "SPEED OPEN ZZZZ" then
        speedButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end
end)

-- Обработчик нажатия на кнопку SPEED OPEN
speedButton.MouseButton1Click:Connect(injectSpeedScript)

-- ================================
-- БИНДЫ КЛАВИАТУРЫ
-- ================================
local userInputService = game:GetService("UserInputService")

-- Бинд для JUMP BOOST (клавиша Z)
userInputService.InputBegan:Connect(function(input, processed)
    -- Проверяем, что ввод не обработан другими системами (чат и т.д.)
    if processed then return end
    
    -- Бинд для JUMP BOOST (клавиша Z)
    if input.KeyCode == Enum.KeyCode.Z then
        ToggleJump()
    end
    
    -- Бинд для ANTI-RAGDOLL (клавиша X)
    if input.KeyCode == Enum.KeyCode.X then
        ToggleAntiRagdoll()
    end
    
    -- Бинд для SPEED OPEN ZZZZ (RightShift) - оставляем для обратной совместимости
    if input.KeyCode == Enum.KeyCode.RightShift then
        injectSpeedScript()
    end
end)

-- ================================
-- АВТОМАТИЧЕСКИЕ ФУНКЦИИ ПРИ РЕСПАВНЕ
-- ================================

-- Автоматическое отключение прыжка при смерти/респавне
local function onCharacterAdded(character)
    if JumpEnabled then
        -- Ждем появления Humanoid
        character:WaitForChild("Humanoid")
        -- Применяем супер-прыжок к новому персонажу
        character.Humanoid.JumpPower = SuperJumpPower
    end
end

-- Подключаем обработчик добавления персонажа
player.CharacterAdded:Connect(onCharacterAdded)

-- Применяем к текущему персонажу, если он есть
if player.Character then
    onCharacterAdded(player.Character)
end

-- Применяем Anti-Ragdoll при респавне если он включен
player.CharacterAdded:Connect(function(character)
    if AntiRagdollEnabled then
        wait(0.5)
        -- Применяем настройки к новому персонажу
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.AutoRotate = true
        humanoid.BreakJointsOnDeath = false
        humanoid.RequiresNeck = false
    end
end)

print("Tape PVP Menu with BINDS loaded! Z = JUMP, X = ANTI-RAGDOLL")
