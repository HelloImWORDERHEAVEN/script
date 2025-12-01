-- Волшебное Тулево Script
-- Ключ: 555
-- ВНИМАНИЕ: Использование читов нарушает правила Roblox

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

-- Настройки по умолчанию
local Settings = {
    Key = "555",
    MenuKey = Enum.KeyCode.RightControl,
    AimLock = {
        Enabled = false,
        KeyBind = Enum.KeyCode.Q,
        Target = nil,
        Smoothness = 0.5,
        FOV = 50
    },
    Visual = {
        DarkAtmosphere = false,
        ESP = {
            Enabled = false,
            Skeleton = true,
            Box = true,
            Tracers = false
        }
    },
    Settings = {
        PotatoGraphics = false
    }
}

-- Переменные GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabButtonsFrame = Instance.new("Frame")
local ContentFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local StarsBackground = Instance.new("ImageLabel")

-- Создание интерфейса
function CreateGUI()
    if game:GetService("CoreGui"):FindFirstChild("MagicTulevoGUI") then
        game:GetService("CoreGui").MagicTulevoGUI:Destroy()
    end
    
    ScreenGui.Name = "MagicTulevoGUI"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Фон со звездами
    StarsBackground.Name = "StarsBackground"
    StarsBackground.Parent = ScreenGui
    StarsBackground.Size = UDim2.new(1, 0, 1, 0)
    StarsBackground.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    StarsBackground.ZIndex = 0
    
    -- Анимированные звезды
    spawn(function()
        while wait(0.1) do
            for i = 1, 50 do
                local Star = Instance.new("Frame")
                Star.Size = UDim2.new(0, math.random(1, 3), 0, math.random(1, 3))
                Star.Position = UDim2.new(0, math.random(0, 1000), 0, math.random(0, 600))
                Star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Star.BorderSizePixel = 0
                Star.Parent = StarsBackground
                
                spawn(function()
                    wait(math.random(1, 3))
                    Star:Destroy()
                end)
            end
        end
    end)
    
    -- Основной фрейм
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BorderColor3 = Color3.fromRGB(80, 80, 80)
    MainFrame.Size = UDim2.new(0, 500, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    -- Заголовок
    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Text = "Волшебное Тулево | Key: 555"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 16
    
    -- Фрейм для кнопок вкладок
    TabButtonsFrame.Name = "TabButtonsFrame"
    TabButtonsFrame.Parent = MainFrame
    TabButtonsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabButtonsFrame.BorderSizePixel = 0
    TabButtonsFrame.Position = UDim2.new(0, 0, 0, 40)
    TabButtonsFrame.Size = UDim2.new(0, 120, 0, 360)
    
    -- Фрейм для контента
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ContentFrame.BorderSizePixel = 0
    ContentFrame.Position = UDim2.new(0, 120, 0, 40)
    ContentFrame.Size = UDim2.new(0, 380, 0, 360)
    
    -- Создание вкладок
    CreateTabs()
    
    -- Скрыть GUI по умолчанию
    ScreenGui.Enabled = false
end

-- Создание вкладок
function CreateTabs()
    local tabs = {"Aim", "Visual", "Settings"}
    local tabContents = {}
    
    for i, tabName in ipairs(tabs) do
        -- Кнопка вкладки
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName .. "Tab"
        TabButton.Parent = TabButtonsFrame
        TabButton.Size = UDim2.new(1, 0, 0, 40)
        TabButton.Position = UDim2.new(0, 0, 0, (i-1)*40)
        TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.Font = Enum.Font.Gotham
        TabButton.TextSize = 14
        TabButton.BorderSizePixel = 0
        
        -- Контент вкладки
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = tabName .. "Content"
        TabContent.Parent = ContentFrame
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.ScrollBarThickness = 5
        TabContent.Visible = (i == 1)
        tabContents[tabName] = TabContent
        
        TabButton.MouseButton1Click:Connect(function()
            for _, content in pairs(tabContents) do
                content.Visible = false
            end
            TabContent.Visible = true
        end)
    end
    
    -- Заполнение вкладок
    CreateAimTab(tabContents["Aim"])
    CreateVisualTab(tabContents["Visual"])
    CreateSettingsTab(tabContents["Settings"])
end

-- Вкладка Aim
function CreateAimTab(tab)
    local padding = 10
    local yOffset = 10
    
    -- Заголовок
    local Title = CreateLabel(tab, "AimLock Settings", 10, yOffset)
    yOffset = yOffset + 30
    
    -- Включение AimLock
    local AimToggle = CreateToggle(tab, "Enable AimLock", 10, yOffset, Settings.AimLock.Enabled, function(value)
        Settings.AimLock.Enabled = value
    end)
    yOffset = yOffset + 40
    
    -- Выбор кнопки для AimLock
    local KeybindLabel = CreateLabel(tab, "AimLock Key: " .. tostring(Settings.AimLock.KeyBind), 10, yOffset)
    yOffset = yOffset + 30
    
    local KeybindButton = CreateButton(tab, "Change Keybind", 10, yOffset, 150, 30, function()
        KeybindLabel.Text = "Press any key..."
        
        local connection
        connection = UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                Settings.AimLock.KeyBind = input.KeyCode
                KeybindLabel.Text = "AimLock Key: " .. tostring(input.KeyCode)
                connection:Disconnect()
            end
        end)
    end)
    yOffset = yOffset + 40
    
    -- Настройка сглаживания
    local SmoothnessLabel = CreateLabel(tab, "Smoothness: " .. Settings.AimLock.Smoothness, 10, yOffset)
    yOffset = yOffset + 30
    
    local SmoothnessSlider = CreateSlider(tab, 10, yOffset, 200, function(value)
        Settings.AimLock.Smoothness = value
        SmoothnessLabel.Text = "Smoothness: " .. string.format("%.2f", value)
    end, Settings.AimLock.Smoothness, 0.1, 1)
    yOffset = yOffset + 50
    
    -- Настройка FOV
    local FOVLabel = CreateLabel(tab, "FOV: " .. Settings.AimLock.FOV, 10, yOffset)
    yOffset = yOffset + 30
    
    local FOVSlider = CreateSlider(tab, 10, yOffset, 200, function(value)
        Settings.AimLock.FOV = value
        FOVLabel.Text = "FOV: " .. math.floor(value)
    end, Settings.AimLock.FOV, 10, 200)
end

-- Вкладка Visual
function CreateVisualTab(tab)
    local padding = 10
    local yOffset = 10
    
    -- Dark Atmosphere
    local DarkToggle = CreateToggle(tab, "Dark Atmosphere", 10, yOffset, Settings.Visual.DarkAtmosphere, function(value)
        Settings.Visual.DarkAtmosphere = value
        UpdateDarkAtmosphere()
    end)
    yOffset = yOffset + 40
    
    -- ESP
    local ESPToggle = CreateToggle(tab, "Enable ESP", 10, yOffset, Settings.Visual.ESP.Enabled, function(value)
        Settings.Visual.ESP.Enabled = value
        if value then
            CreateESP()
        else
            ClearESP()
        end
    end)
    yOffset = yOffset + 40
    
    -- Skeleton ESP
    local SkeletonToggle = CreateToggle(tab, "Skeleton ESP", 10, yOffset, Settings.Visual.ESP.Skeleton, function(value)
        Settings.Visual.ESP.Skeleton = value
    end)
    yOffset = yOffset + 40
    
    -- Box ESP
    local BoxToggle = CreateToggle(tab, "Box ESP", 10, yOffset, Settings.Visual.ESP.Box, function(value)
        Settings.Visual.ESP.Box = value
    end)
    yOffset = yOffset + 40
    
    -- Tracers
    local TracersToggle = CreateToggle(tab, "Tracers", 10, yOffset, Settings.Visual.ESP.Tracers, function(value)
        Settings.Visual.ESP.Tracers = value
    end)
end

-- Вкладка Settings
function CreateSettingsTab(tab)
    local padding = 10
    local yOffset = 10
    
    -- Potato Graphics
    local PotatoToggle = CreateToggle(tab, "Potato Graphics (FPS Boost)", 10, yOffset, Settings.Settings.PotatoGraphics, function(value)
        Settings.Settings.PotatoGraphics = value
        UpdatePotatoGraphics()
    end)
    yOffset = yOffset + 40
    
    -- Кнопка сохранения
    local SaveButton = CreateButton(tab, "Save Settings", 10, yOffset, 150, 40, function()
        SaveSettings()
    end)
    yOffset = yOffset + 50
    
    -- Кнопка загрузки
    local LoadButton = CreateButton(tab, "Load Settings", 170, yOffset - 50, 150, 40, function()
        LoadSettings()
    end)
end

-- Вспомогательные функции UI
function CreateLabel(parent, text, x, y)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Size = UDim2.new(0, 200, 0, 20)
    label.Position = UDim2.new(0, x, 0, y)
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    return label
end

function CreateToggle(parent, text, x, y, defaultValue, callback)
    local toggle = Instance.new("TextButton")
    toggle.Parent = parent
    toggle.Size = UDim2.new(0, 200, 0, 30)
    toggle.Position = UDim2.new(0, x, 0, y)
    toggle.Text = text .. ": " .. (defaultValue and "ON" or "OFF")
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.BackgroundColor3 = defaultValue and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(100, 0, 0)
    toggle.Font = Enum.Font.Gotham
    toggle.TextSize = 14
    
    toggle.MouseButton1Click:Connect(function()
        local newValue = not defaultValue
        toggle.Text = text .. ": " .. (newValue and "ON" or "OFF")
        toggle.BackgroundColor3 = newValue and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(100, 0, 0)
        callback(newValue)
    end)
    
    return toggle
end

function CreateButton(parent, text, x, y, width, height, callback)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Size = UDim2.new(0, width, 0, height)
    button.Position = UDim2.new(0, x, 0, y)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    
    button.MouseButton1Click:Connect(callback)
    
    return button
end

function CreateSlider(parent, x, y, width, callback, defaultValue, min, max)
    local slider = Instance.new("Frame")
    slider.Parent = parent
    slider.Size = UDim2.new(0, width, 0, 20)
    slider.Position = UDim2.new(0, x, 0, y)
    slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    
    local fill = Instance.new("Frame")
    fill.Parent = slider
    fill.Size = UDim2.new((defaultValue - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    fill.BorderSizePixel = 0
    
    local button = Instance.new("TextButton")
    button.Parent = slider
    button.Size = UDim2.new(0, 10, 1, 0)
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = ""
    button.Position = UDim2.new((defaultValue - min) / (max - min), -5, 0, 0)
    
    local dragging = false
    
    button.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local relativeX = math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
            local value = min + (max - min) * relativeX
            
            button.Position = UDim2.new(relativeX, -5, 0, 0)
            fill.Size = UDim2.new(relativeX, 0, 1, 0)
            
            callback(value)
        end
    end)
    
    return slider
end

-- Функция AimLock
function AimLock()
    if not Settings.AimLock.Enabled then return end
    
    local closestPlayer = nil
    local closestDistance = Settings.AimLock.FOV
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local character = player.Character
            local screenPoint, onScreen = Workspace.CurrentCamera:WorldToViewportPoint(character.HumanoidRootPart.Position)
            
            if onScreen then
                local mouseLocation = Vector2.new(Mouse.X, Mouse.Y)
                local playerLocation = Vector2.new(screenPoint.X, screenPoint.Y)
                local distance = (mouseLocation - playerLocation).Magnitude
                
                if distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end
    
    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
        Settings.AimLock.Target = closestPlayer.Character.HumanoidRootPart
    else
        Settings.AimLock.Target = nil
    end
end

-- ESP функции
local ESPObjects = {}

function CreateESP()
    ClearESP()
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= Player then
            AddESP(player)
        end
    end
    
    Players.PlayerAdded:Connect(function(player)
        AddESP(player)
    end)
    
    Players.PlayerRemoving:Connect(function(player)
        if ESPObjects[player] then
            for _, obj in pairs(ESPObjects[player]) do
                obj:Destroy()
            end
            ESPObjects[player] = nil
        end
    end)
end

function AddESP(player)
    ESPObjects[player] = {}
    
    local function updateESP()
        if not player.Character or not Settings.Visual.ESP.Enabled then return end
        
        -- Box ESP
        if Settings.Visual.ESP.Box then
            if not ESPObjects[player].Box then
                local box = Instance.new("BoxHandleAdornment")
                box.Name = "ESPBox"
                box.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
                box.AlwaysOnTop = true
                box.ZIndex = 10
                box.Size = Vector3.new(4, 6, 4)
                box.Color3 = Color3.fromRGB(255, 0, 0)
                box.Transparency = 0.5
                box.Parent = player.Character.HumanoidRootPart
                ESPObjects[player].Box = box
            end
        end
        
        -- Skeleton ESP
        if Settings.Visual.ESP.Skeleton then
            for _, partName in pairs({"Head", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Torso"}) do
                local part = player.Character:FindFirstChild(partName)
                if part then
                    if not ESPObjects[player][partName] then
                        local line = Instance.new("BoxHandleAdornment")
                        line.Name = "ESPSkeleton"
                        line.Adornee = part
                        line.AlwaysOnTop = true
                        line.ZIndex = 10
                        line.Size = part.Size
                        line.Color3 = Color3.fromRGB(0, 255, 0)
                        line.Transparency = 0.3
                        line.Parent = part
                        ESPObjects[player][partName] = line
                    end
                end
            end
        end
    end
    
    player.CharacterAdded:Connect(function(character)
        wait(1)
        updateESP()
    end)
    
    if player.Character then
        updateESP()
    end
end

function ClearESP()
    for player, objects in pairs(ESPObjects) do
        for _, obj in pairs(objects) do
            if obj then
                obj:Destroy()
            end
        end
    end
    ESPObjects = {}
end

function UpdateDarkAtmosphere()
    if Settings.Visual.DarkAtmosphere then
        Lighting.Ambient = Color3.fromRGB(50, 50, 50)
        Lighting.OutdoorAmbient = Color3.fromRGB(50, 50, 50)
        Lighting.Brightness = 0.5
        Lighting.GlobalShadows = false
    else
        Lighting.Ambient = Color3.fromRGB(178, 178, 178)
        Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
        Lighting.Brightness = 2
        Lighting.GlobalShadows = true
    end
end

function UpdatePotatoGraphics()
    if Settings.Settings.PotatoGraphics then
        -- Уменьшаем качество графики для повышения FPS
        settings().Rendering.QualityLevel = 1
        Workspace.Terrain.WaterWaveSize = 0
        Workspace.Terrain.WaterWaveSpeed = 0
        Workspace.Terrain.WaterReflectance = 0
        Workspace.Terrain.WaterTransparency = 0
        
        for _, part in pairs(Workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Material = Enum.Material.Plastic
                part.Reflectance = 0
            end
        end
    else
        settings().Rendering.QualityLevel = 21
    end
end

-- Сохранение и загрузка настроек
function SaveSettings()
    local data = {
        AimLock = Settings.AimLock,
        Visual = Settings.Visual,
        Settings = Settings.Settings
    }
    
    writefile("MagicTulevoSettings.txt", game:GetService("HttpService"):JSONEncode(data))
    print("Настройки сохранены!")
end

function LoadSettings()
    if isfile("MagicTulevoSettings.txt") then
        local success, data = pcall(function()
            return game:GetService("HttpService"):JSONDecode(readfile("MagicTulevoSettings.txt"))
        end)
        
        if success then
            Settings.AimLock = data.AimLock or Settings.AimLock
            Settings.Visual = data.Visual or Settings.Visual
            Settings.Settings = data.Settings or Settings.Settings
            print("Настройки загружены!")
        end
    else
        print("Файл настроек не найден!")
    end
end

-- Основной цикл
function MainLoop()
    -- Открытие/закрытие меню
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Settings.MenuKey then
            ScreenGui.Enabled = not ScreenGui.Enabled
        end
        
        -- AimLock активация
        if input.KeyCode == Settings.AimLock.KeyBind then
            if Settings.AimLock.Enabled then
                AimLock()
            end
        end
    end)
    
    -- Постоянное слежение за целью
    RunService.RenderStepped:Connect(function()
        if Settings.AimLock.Enabled and Settings.AimLock.Target then
            local targetPosition = Settings.AimLock.Target.Position
            local camera = Workspace.CurrentCamera
            
            -- Плавное наведение
            local currentCFrame = camera.CFrame
            local targetCFrame = CFrame.lookAt(
                camera.CFrame.Position,
                Vector3.new(
                    targetPosition.X,
                    targetPosition.Y + 1.5, -- Немного выше для прицеливания в голову
                    targetPosition.Z
                )
            )
            
            camera.CFrame = currentCFrame:Lerp(targetCFrame, Settings.AimLock.Smoothness)
        end
    end)
end

-- Инициализация
CreateGUI()
MainLoop()
LoadSettings()

print("Скрипт 'Волшебное Тулево' загружен!")
print("Нажмите " .. tostring(Settings.MenuKey) .. " для открытия меню")
print("Ключ: 555")
