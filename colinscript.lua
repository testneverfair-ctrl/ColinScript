-- Улучшенный скрипт для Blox Fruits by Colin
-- Убраны квесты, увеличена скорость атаки, исправлен выбор оружия

-- Создание графического интерфейса
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabButtonsFrame = Instance.new("Frame")
local AutoFarmTabBtn = Instance.new("TextButton")
local ESPTabBtn = Instance.new("TextButton")
local CloseBtn = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

-- Плавающая кнопка для скрытия/показа меню
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "≡"
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 160)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextScaled = true
ToggleButton.ZIndex = 10
ToggleButton.Active = true
ToggleButton.Draggable = true

-- Фреймы для вкладок
local AutoFarmFrame = Instance.new("Frame")
local ESPFrame = Instance.new("Frame")

ScreenGui.Name = "ColinFarmPro"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 320, 0, 320)
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(80, 80, 80)
MainFrame.Visible = true

Title.Name = "Title"
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "Меню Colin Pro"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true

TabButtonsFrame.Name = "TabButtonsFrame"
TabButtonsFrame.Parent = MainFrame
TabButtonsFrame.Size = UDim2.new(1, 0, 0, 35)
TabButtonsFrame.Position = UDim2.new(0, 0, 0, 35)
TabButtonsFrame.BackgroundTransparency = 1

AutoFarmTabBtn.Name = "AutoFarmTabBtn"
AutoFarmTabBtn.Parent = TabButtonsFrame
AutoFarmTabBtn.Size = UDim2.new(0.4, 0, 0.8, 0)
AutoFarmTabBtn.Position = UDim2.new(0.05, 0, 0.1, 0)
AutoFarmTabBtn.Text = "AutoFarm"
AutoFarmTabBtn.BackgroundColor3 = Color3.fromRGB(60, 160, 60)
AutoFarmTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmTabBtn.TextScaled = true

ESPTabBtn.Name = "ESPTabBtn"
ESPTabBtn.Parent = TabButtonsFrame
ESPTabBtn.Size = UDim2.new(0.4, 0, 0.8, 0)
ESPTabBtn.Position = UDim2.new(0.55, 0, 0.1, 0)
ESPTabBtn.Text = "ESP"
ESPTabBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ESPTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPTabBtn.TextScaled = true

CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = MainFrame
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(160, 60, 60)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Фрейм AutoFarm
AutoFarmFrame.Name = "AutoFarmFrame"
AutoFarmFrame.Parent = MainFrame
AutoFarmFrame.Size = UDim2.new(1, 0, 0, 250)
AutoFarmFrame.Position = UDim2.new(0, 0, 0, 70)
AutoFarmFrame.BackgroundTransparency = 1
AutoFarmFrame.Visible = true

-- Фрейм ESP
ESPFrame.Name = "ESPFrame"
ESPFrame.Parent = MainFrame
ESPFrame.Size = UDim2.new(1, 0, 0, 250)
ESPFrame.Position = UDim2.new(0, 0, 0, 70)
ESPFrame.BackgroundTransparency = 1
ESPFrame.Visible = false

-- Элементы AutoFarm вкладки
local AutoFarmBtn = Instance.new("TextButton")
local WeaponBtn = Instance.new("TextButton")
local FastAttackBtn = Instance.new("TextButton")
local RadiusLabel = Instance.new("TextLabel")
local RadiusSlider = Instance.new("TextButton")
local SpeedLabel = Instance.new("TextLabel")
local SpeedSlider = Instance.new("TextButton")

AutoFarmBtn.Name = "AutoFarmBtn"
AutoFarmBtn.Parent = AutoFarmFrame
AutoFarmBtn.Size = UDim2.new(0.8, 0, 0, 35)
AutoFarmBtn.Position = UDim2.new(0.1, 0, 0, 10)
AutoFarmBtn.Text = "Авто Фарм: ВЫКЛ"
AutoFarmBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
AutoFarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmBtn.TextScaled = true

WeaponBtn.Name = "WeaponBtn"
WeaponBtn.Parent = AutoFarmFrame
WeaponBtn.Size = UDim2.new(0.8, 0, 0, 35)
WeaponBtn.Position = UDim2.new(0.1, 0, 0, 55)
WeaponBtn.Text = "Оружие: Melee"
WeaponBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 160)
WeaponBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
WeaponBtn.TextScaled = true

FastAttackBtn.Name = "FastAttackBtn"
FastAttackBtn.Parent = AutoFarmFrame
FastAttackBtn.Size = UDim2.new(0.8, 0, 0, 35)
FastAttackBtn.Position = UDim2.new(0.1, 0, 0, 100)
FastAttackBtn.Text = "Скорость атаки: Выкл"
FastAttackBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
FastAttackBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FastAttackBtn.TextScaled = true

RadiusLabel.Name = "RadiusLabel"
RadiusLabel.Parent = AutoFarmFrame
RadiusLabel.Size = UDim2.new(0.8, 0, 0, 25)
RadiusLabel.Position = UDim2.new(0.1, 0, 0, 145)
RadiusLabel.BackgroundTransparency = 1
RadiusLabel.Text = "Радиус: 500"
RadiusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

RadiusSlider.Name = "RadiusSlider"
RadiusSlider.Parent = AutoFarmFrame
RadiusSlider.Size = UDim2.new(0.8, 0, 0, 25)
RadiusSlider.Position = UDim2.new(0.1, 0, 0, 170)
RadiusSlider.Text = "Изменить радиус (100-2000)"
RadiusSlider.BackgroundColor3 = Color3.fromRGB(60, 100, 160)
RadiusSlider.TextColor3 = Color3.fromRGB(255, 255, 255)

SpeedLabel.Name = "SpeedLabel"
SpeedLabel.Parent = AutoFarmFrame
SpeedLabel.Size = UDim2.new(0.8, 0, 0, 25)
SpeedLabel.Position = UDim2.new(0.1, 0, 0, 195)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Скорость: 5"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

SpeedSlider.Name = "SpeedSlider"
SpeedSlider.Parent = AutoFarmFrame
SpeedSlider.Size = UDim2.new(0.8, 0, 0, 25)
SpeedSlider.Position = UDim2.new(0.1, 0, 0, 220)
SpeedSlider.Text = "Изменить скорость (1-10)"
SpeedSlider.BackgroundColor3 = Color3.fromRGB(100, 60, 160)
SpeedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Элементы ESP вкладки
local PlayersESPBtn = Instance.new("TextButton")
local ChestsESPBtn = Instance.new("TextButton")
local ESPDistanceLabel = Instance.new("TextLabel")
local ESPDistanceSlider = Instance.new("TextButton")

PlayersESPBtn.Name = "PlayersESPBtn"
PlayersESPBtn.Parent = ESPFrame
PlayersESPBtn.Size = UDim2.new(0.8, 0, 0, 35)
PlayersESPBtn.Position = UDim2.new(0.1, 0, 0, 10)
PlayersESPBtn.Text = "ESP Игроки: ВЫКЛ"
PlayersESPBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
PlayersESPBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayersESPBtn.TextScaled = true

ChestsESPBtn.Name = "ChestsESPBtn"
ChestsESPBtn.Parent = ESPFrame
ChestsESPBtn.Size = UDim2.new(0.8, 0, 0, 35)
ChestsESPBtn.Position = UDim2.new(0.1, 0, 0, 55)
ChestsESPBtn.Text = "ESP Сундуки: ВЫКЛ"
ChestsESPBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ChestsESPBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ChestsESPBtn.TextScaled = true

ESPDistanceLabel.Name = "ESPDistanceLabel"
ESPDistanceLabel.Parent = ESPFrame
ESPDistanceLabel.Size = UDim2.new(0.8, 0, 0, 25)
ESPDistanceLabel.Position = UDim2.new(0.1, 0, 0, 100)
ESPDistanceLabel.BackgroundTransparency = 1
ESPDistanceLabel.Text = "Дистанция ESP: 5000"
ESPDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

ESPDistanceSlider.Name = "ESPDistanceSlider"
ESPDistanceSlider.Parent = ESPFrame
ESPDistanceSlider.Size = UDim2.new(0.8, 0, 0, 25)
ESPDistanceSlider.Position = UDim2.new(0.1, 0, 0, 125)
ESPDistanceSlider.Text = "Изменить дистанцию (1000-10000)"
ESPDistanceSlider.BackgroundColor3 = Color3.fromRGB(60, 100, 160)
ESPDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Основные переменные
local AutoFarm = false
local FarmRadius = 500
local MoveSpeed = 5
local SelectedWeapon = "Melee"
local CurrentEquippedWeapon = nil
local PlayersESPEnabled = false
local ChestsESPEnabled = false
local AttackSpeedLevel = 0
local ESPDistance = 5000
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Platform = nil
local CurrentPlatformTween = nil
local CurrentPlayerTween = nil
local OriginalHRPSize = nil
local PinnedEnemies = {}

-- Функции для вкладок
local function ShowAutoFarmTab()
    AutoFarmFrame.Visible = true
    ESPFrame.Visible = false
    AutoFarmTabBtn.BackgroundColor3 = Color3.fromRGB(60, 160, 60)
    ESPTabBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
end

local function ShowESPTab()
    AutoFarmFrame.Visible = false
    ESPFrame.Visible = true
    AutoFarmTabBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    ESPTabBtn.BackgroundColor3 = Color3.fromRGB(160, 60, 160)
end

-- Функция для скрытия/показа меню
local function ToggleMenu()
    MainFrame.Visible = not MainFrame.Visible
    if MainFrame.Visible then
        ToggleButton.Text = "≡"
    else
        ToggleButton.Text = "☰"
    end
end

-- Создание платформы ПОД игроком
local function CreatePlatform()
    if Platform then
        Platform:Destroy()
    end
    
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return nil
    end
    
    Platform = Instance.new("Part")
    Platform.Name = "FarmPlatform"
    Platform.Size = Vector3.new(15, 2, 15)
    Platform.Transparency = 0.7
    Platform.Anchored = true
    Platform.CanCollide = true
    Platform.Material = Enum.Material.Neon
    Platform.Color = Color3.fromRGB(0, 200, 0)
    
    local playerPosition = character.HumanoidRootPart.Position
    Platform.Position = Vector3.new(playerPosition.X, playerPosition.Y - 10, playerPosition.Z)
    Platform.Parent = workspace
    
    return Platform
end

-- Функция увеличения HumanoidRootPart и включения NoClip
local function EnhanceHRP()
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    if not OriginalHRPSize then
        OriginalHRPSize = humanoidRootPart.Size
    end
    
    humanoidRootPart.Size = Vector3.new(9, 9, 9)
    humanoidRootPart.CanCollide = false
    
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
    
    print("HumanoidRootPart увеличен, NoClip включен")
end

-- Функция восстановления оригинального размера HumanoidRootPart
local function RestoreHRP()
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart or not OriginalHRPSize then return end
    
    humanoidRootPart.Size = OriginalHRPSize
    humanoidRootPart.CanCollide = true
    
    print("HumanoidRootPart восстановлен")
end

-- Исправленная функция выбора оружия (выбирает сразу при включении автофарма)
local function EquipWeapon()
    local character = LocalPlayer.Character
    if not character then return false end
    
    local backpack = LocalPlayer.Backpack
    if not backpack then return false end
    
    -- Собираем все инструменты
    local tools = {}
    for _, tool in pairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            table.insert(tools, tool)
        end
    end
    
    -- Сортируем по порядку в инвентаре
    table.sort(tools, function(a, b)
        return (a:GetAttribute("Slot") or 0) < (b:GetAttribute("Slot") or 0)
    end)
    
    local weaponEquipped = false
    
    if SelectedWeapon == "Melee" then
        -- Берем первый слот (ближний бой)
        if #tools >= 1 then
            tools[1].Parent = character
            CurrentEquippedWeapon = tools[1].Name
            weaponEquipped = true
            print("Оружие выбрано: " .. tools[1].Name .. " (слот 1)")
        end
    elseif SelectedWeapon == "Sword" then
        -- Берем третий слот (меч)
        if #tools >= 3 then
            tools[3].Parent = character
            CurrentEquippedWeapon = tools[3].Name
            weaponEquipped = true
            print("Оружие выбрано: " .. tools[3].Name .. " (слот 3)")
        elseif #tools >= 1 then
            -- Если нет третьего слота, берем последний доступный
            tools[#tools].Parent = character
            CurrentEquippedWeapon = tools[#tools].Name
            weaponEquipped = true
            print("Оружие выбрано: " .. tools[#tools].Name .. " (последний слот)")
        end
    end
    
    return weaponEquipped
end

-- Функция притягивания врага
local function PinEnemy(enemy)
    if not enemy or not enemy:FindFirstChild("HumanoidRootPart") then
        return false
    end
    
    if PinnedEnemies[enemy] then
        return true
    end
    
    PinnedEnemies[enemy] = {
        Anchored = enemy.HumanoidRootPart.Anchored,
        CanCollide = enemy.HumanoidRootPart.CanCollide
    }
    
    enemy.HumanoidRootPart.Anchored = true
    enemy.HumanoidRootPart.CanCollide = false
    
    local humanoid = enemy:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 0
    end
    
    return true
end

-- Функция освобождения врага
local function UnpinEnemy(enemy)
    if not enemy or not PinnedEnemies[enemy] then
        return false
    end
    
    local originalState = PinnedEnemies[enemy]
    if enemy:FindFirstChild("HumanoidRootPart") then
        enemy.HumanoidRootPart.Anchored = originalState.Anchored
        enemy.HumanoidRootPart.CanCollide = originalState.CanCollide
    end
    
    local humanoid = enemy:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 16
    end
    
    PinnedEnemies[enemy] = nil
    return true
end

-- Функция освобождения всех врагов
local function UnpinAllEnemies()
    for enemy, _ in pairs(PinnedEnemies) do
        UnpinEnemy(enemy)
    end
    PinnedEnemies = {}
end

-- Синхронное Tween перемещение платформы и игрока
local function MoveToEnemy(enemy)
    if not Platform or not enemy or not enemy:FindFirstChild("HumanoidRootPart") then
        return false
    end
    
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return false
    end
    
    local targetPosition = enemy.HumanoidRootPart.Position + Vector3.new(0, 10, 0)
    local playerTargetPosition = targetPosition + Vector3.new(0, 3, 0)
    
    if CurrentPlatformTween then
        CurrentPlatformTween:Cancel()
    end
    if CurrentPlayerTween then
        CurrentPlayerTween:Cancel()
    end
    
    local moveTime = 1 / (MoveSpeed * 0.5)
    
    local tweenInfo = TweenInfo.new(
        moveTime,
        Enum.EasingStyle.Linear,
        Enum.EasingDirection.Out,
        0,
        false,
        0
    )
    
    CurrentPlatformTween = TweenService:Create(Platform, tweenInfo, {Position = targetPosition})
    CurrentPlayerTween = TweenService:Create(character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(playerTargetPosition)})
    
    CurrentPlatformTween:Play()
    CurrentPlayerTween:Play()
    
    return true
end

-- Улучшенные функции атаки с увеличенной скоростью и без анимаций
local function NormalAttack()
    local virtualInput = game:GetService("VirtualInputManager")
    
    virtualInput:SendMouseButtonEvent(0, 0, 0, true, game, 0)
    task.wait(0.02)
    virtualInput:SendMouseButtonEvent(0, 0, 0, false, game, 0)
end

local function FastAttack()
    local virtualInput = game:GetService("VirtualInputManager")
    
    for i = 1, 4 do
        virtualInput:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        task.wait(0.008)
        virtualInput:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end
end

local function VeryFastAttack()
    local virtualInput = game:GetService("VirtualInputManager")
    
    for i = 1, 8 do
        virtualInput:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        task.wait(0.004)
        virtualInput:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end
end

local function SuperFastAttack()
    local virtualInput = game:GetService("VirtualInputManager")
    
    for i = 1, 12 do
        virtualInput:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        task.wait(0.002)
        virtualInput:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end
end

-- Функция атаки (выбирает уровень скорости)
local function AttackWithWeapon()
    if AttackSpeedLevel == 1 then
        FastAttack()
    elseif AttackSpeedLevel == 2 then
        VeryFastAttack()
    elseif AttackSpeedLevel == 3 then
        SuperFastAttack()
    else
        NormalAttack()
    end
end

-- Функция ESP для игроков
local function TogglePlayersESP()
    PlayersESPEnabled = not PlayersESPEnabled
    
    if PlayersESPEnabled then
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character then
                local character = player.Character
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                
                if humanoidRootPart then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = character
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.Name = "PlayerESP"
                    
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "PlayerNameESP"
                    billboard.Adornee = humanoidRootPart
                    billboard.Size = UDim2.new(0, 100, 0, 25)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true
                    billboard.MaxDistance = ESPDistance
                    billboard.Parent = humanoidRootPart
                    
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Parent = billboard
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = player.Name
                    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    nameLabel.TextScaled = true
                    nameLabel.Font = Enum.Font.GothamBold
                    nameLabel.TextStrokeTransparency = 0
                    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                end
            end
        end
        
        PlayersESPBtn.Text = "ESP Игроки: ВКЛ"
        PlayersESPBtn.BackgroundColor3 = Color3.fromRGB(160, 60, 60)
    else
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                local character = player.Character
                
                if character:FindFirstChild("PlayerESP") then
                    character.PlayerESP:Destroy()
                end
                
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart and humanoidRootPart:FindFirstChild("PlayerNameESP") then
                    humanoidRootPart.PlayerNameESP:Destroy()
                end
            end
        end
        
        PlayersESPBtn.Text = "ESP Игроки: ВЫКЛ"
        PlayersESPBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end
end

-- Функция ESP для сундуков
local function ToggleChestsESP()
    ChestsESPEnabled = not ChestsESPEnabled
    
    if ChestsESPEnabled then
        for _, obj in pairs(workspace:GetDescendants()) do
            if string.find(string.lower(obj.Name), "chest") then
                local highlight = Instance.new("Highlight")
                highlight.Parent = obj
                highlight.FillColor = Color3.fromRGB(255, 215, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.Name = "ChestESP"
                
                if obj:IsA("BasePart") then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "ChestNameESP"
                    billboard.Adornee = obj
                    billboard.Size = UDim2.new(0, 75, 0, 20)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true
                    billboard.MaxDistance = ESPDistance
                    billboard.Parent = obj
                    
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Parent = billboard
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = "Сундук"
                    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    nameLabel.TextScaled = true
                    nameLabel.Font = Enum.Font.GothamBold
                    nameLabel.TextStrokeTransparency = 0
                    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                end
            end
        end
        
        ChestsESPBtn.Text = "ESP Сундуки: ВКЛ"
        ChestsESPBtn.BackgroundColor3 = Color3.fromRGB(160, 160, 60)
    else
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name == "ChestESP" then
                obj:Destroy()
            end
            if obj:FindFirstChild("ChestNameESP") then
                obj.ChestNameESP:Destroy()
            end
        end
        
        ChestsESPBtn.Text = "ESP Сундуки: ВЫКЛ"
        ChestsESPBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end
end

-- Основная функция автофарма
local function AutoFarmFunction()
    local platform = CreatePlatform()
    if not platform then
        print("Не удалось создать платформу")
        return
    end
    
    -- Выбираем оружие сразу при включении автофарма
    local weaponEquipped = EquipWeapon()
    if not weaponEquipped then
        print("Не удалось выбрать оружие. Проверьте инвентарь.")
    end
    
    EnhanceHRP()
    
    local lastEnemy = nil
    
    while AutoFarm do
        local character = LocalPlayer.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            task.wait(1)
            continue
        end
        
        -- Если оружия нет в руках, пытаемся выбрать снова
        local currentTool = character:FindFirstChildOfClass("Tool")
        if not currentTool then
            EquipWeapon()
        end
        
        local closestNPC = nil
        local closestDistance = FarmRadius
        
        local enemies = workspace:FindFirstChild("Enemies")
        if not enemies then
            task.wait(1)
            continue
        end
        
        for _, npc in pairs(enemies:GetChildren()) do
            if npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 and npc:FindFirstChild("HumanoidRootPart") then
                local distance = (character.HumanoidRootPart.Position - npc.HumanoidRootPart.Position).Magnitude
                if distance < closestDistance then
                    closestNPC = npc
                    closestDistance = distance
                end
            end
        end
        
        if closestNPC and closestNPC:FindFirstChild("Humanoid") and closestNPC.Humanoid.Health > 0 then
            if closestNPC ~= lastEnemy then
                if lastEnemy then
                    UnpinEnemy(lastEnemy)
                end
                PinEnemy(closestNPC)
                lastEnemy = closestNPC
            end
            
            MoveToEnemy(closestNPC)
            AttackWithWeapon()
        else
            if lastEnemy then
                UnpinEnemy(lastEnemy)
                lastEnemy = nil
            end
            task.wait(0.5)
        end
        
        task.wait(0.1)
    end
    
    if Platform then
        Platform:Destroy()
        Platform = nil
    end
    if CurrentPlatformTween then
        CurrentPlatformTween:Cancel()
        CurrentPlatformTween = nil
    end
    if CurrentPlayerTween then
        CurrentPlayerTween:Cancel()
        CurrentPlayerTween = nil
    end
    
    UnpinAllEnemies()
    RestoreHRP()
end

-- Обработчики событий для кнопок
ToggleButton.MouseButton1Click:Connect(function()
    ToggleMenu()
end)

AutoFarmTabBtn.MouseButton1Click:Connect(function()
    ShowAutoFarmTab()
end)

ESPTabBtn.MouseButton1Click:Connect(function()
    ShowESPTab()
end)

AutoFarmBtn.MouseButton1Click:Connect(function()
    AutoFarm = not AutoFarm
    if AutoFarm then
        AutoFarmBtn.Text = "Авто Фарм: ВКЛ"
        AutoFarmBtn.BackgroundColor3 = Color3.fromRGB(60, 160, 60)
        spawn(AutoFarmFunction)
    else
        AutoFarmBtn.Text = "Авто Фарм: ВЫКЛ"
        AutoFarmBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end
end)

WeaponBtn.MouseButton1Click:Connect(function()
    if SelectedWeapon == "Melee" then
        SelectedWeapon = "Sword"
        WeaponBtn.Text = "Оружие: Sword"
        WeaponBtn.BackgroundColor3 = Color3.fromRGB(160, 100, 60)
    else
        SelectedWeapon = "Melee"
        WeaponBtn.Text = "Оружие: Melee"
        WeaponBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 160)
    end
    
    -- Сбрасываем текущее оружие, чтобы при следующем включении выбралось новое
    CurrentEquippedWeapon = nil
end)

FastAttackBtn.MouseButton1Click:Connect(function()
    AttackSpeedLevel = (AttackSpeedLevel + 1) % 4
    
    if AttackSpeedLevel == 0 then
        FastAttackBtn.Text = "Скорость атаки: Выкл"
        FastAttackBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    elseif AttackSpeedLevel == 1 then
        FastAttackBtn.Text = "Скорость атаки: Быстро"
        FastAttackBtn.BackgroundColor3 = Color3.fromRGB(60, 160, 100)
    elseif AttackSpeedLevel == 2 then
        FastAttackBtn.Text = "Скорость атаки: Очень быстро"
        FastAttackBtn.BackgroundColor3 = Color3.fromRGB(160, 160, 60)
    elseif AttackSpeedLevel == 3 then
        FastAttackBtn.Text = "Скорость атаки: Супер быстро"
        FastAttackBtn.BackgroundColor3 = Color3.fromRGB(160, 60, 60)
    end
end)

RadiusSlider.MouseButton1Click:Connect(function()
    if FarmRadius < 1000 then
        FarmRadius = FarmRadius + 100
    else
        FarmRadius = FarmRadius + 250
    end
    
    if FarmRadius > 2000 then
        FarmRadius = 100
    end
    
    RadiusLabel.Text = "Радиус: " .. FarmRadius
end)

SpeedSlider.MouseButton1Click:Connect(function()
    MoveSpeed = MoveSpeed + 1
    if MoveSpeed > 10 then
        MoveSpeed = 1
    end
    
    SpeedLabel.Text = "Скорость: " .. MoveSpeed
end)

PlayersESPBtn.MouseButton1Click:Connect(function()
    TogglePlayersESP()
end)

ChestsESPBtn.MouseButton1Click:Connect(function()
    ToggleChestsESP()
end)

ESPDistanceSlider.MouseButton1Click:Connect(function()
    ESPDistance = ESPDistance + 1000
    if ESPDistance > 10000 then
        ESPDistance = 1000
    end
    
    ESPDistanceLabel.Text = "Дистанция ESP: " .. ESPDistance
    
    if PlayersESPEnabled then
        TogglePlayersESP()
        TogglePlayersESP()
    end
    if ChestsESPEnabled then
        ToggleChestsESP()
        ToggleChestsESP()
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    AutoFarm = false
    ScreenGui:Destroy()
end)

-- Инициализация
ShowAutoFarmTab()

print("Улучшенный скрипт Colin Pro запущен!")
print("Исправления: Убраны квесты, увеличена скорость атаки, исправлен выбор оружия")
