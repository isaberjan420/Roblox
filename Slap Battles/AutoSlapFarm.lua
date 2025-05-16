--yes its open source now :)

repeat
    wait()
until game:IsLoaded() == true
wait(.1)

local Players = game:GetService("Players")
local Replicated_Storage = game:GetService("ReplicatedStorage")
local Teleport_Service = game:GetService("TeleportService")
local Tween_Service = game:GetService("TweenService")
local Run_Service = game:GetService("RunService")

local Local_Player = Players.LocalPlayer

local REP = true

local AC = true

local AB = true

local Found = true

local Debug = false

local function Slappable(Character)
    local Decision = false
    if Character.isInArena.Value == true then
        Decision = true
    elseif Character.IsInDefaultArena.Value == true then
        Decision = true
    end
    return Decision
end

if AB == true then
    if game.PlaceId == 6403373529 or game.PlaceId == 9015014224 or game.PlaceId == 124596094333302 then
        --pass
    else
        warn("Script Cannot Be Executed Outside Of Normal Or No One Shot Servers Or Newbie Servers. | Celerity")
        task.wait(634754754)
        Local_Player:Kick("Error, Report This To Celerity.")
    end
end

if AC == true then
    if Slappable(Local_Player.Character) == true then
        warn("Script Cannot Be Executed Within The Arena. | Celerity")
        task.wait(634754754)
        Local_Player:Kick("Error, Report This To Celerity")
    end
end

if REP == true then
    if _G.Celerity == true then
        warn("A Celerity Script Is Already Executed. | Celerity")
        task.wait(634754754)
        Local_Player:Kick("Error, Report This To Celerity.")
    else
        _G.Celerity = true
        warn("Executing Auto Farm. | Celerity")
    end
end

local function Equip(Glove)
    local GE = workspace.Lobby:FindFirstChild(Glove)
    fireclickdetector(GE:FindFirstChildWhichIsA("ClickDetector"))
end

local function Not_Ragdolled(Character)
    local Decision = true
    for i, v in ipairs(Character:GetChildren()) do
        local Name = string.lower(v.Name)
        if string.match(Name, "fake") then
            Decision = false
        end
    end
    return Decision
end

local function Invisible()
    if Local_Player.Character.Head.Transparency > 0.9 then
        return true
    end
end

local function Not_Reversed(Character)
    local Decision = true
    for i, v in ipairs(Character:GetChildren()) do
        if v.Name == "Reversed" then
            Decision = false
        end
    end
    return Decision
end

local function Not_Any_Rock(Character)
    local Decision = true
    for i, v in ipairs(Character:GetChildren()) do
        if v.Name == "rock" or v.Name == "stevebody" or v.Name == "Sphere" then
            Decision = false
        end
    end
    return Decision
end

local function Get_Closest_Player()
    local Closest_Player = Local_Player
    local Minimum_Distance = 1234567890
    for i, v in ipairs(Players:GetPlayers()) do
        local Character = v.Character
        local nr = Not_Reversed(Character)
        local nar = Not_Any_Rock(Character)
        local se = Slappable(Character)
        local nrg = Not_Ragdolled(Character)
        if v == Local_Player or v.Name == Local_Player.Name or Character:FindFirstChildWhichIsA("Humanoid").Health < 0.1 or nr == false or nar == false or se == false then
            --pass
        else
            local Distance = (Character.Head.Position - Local_Player.Character.Head.Position).Magnitude^2
            if Distance < Minimum_Distance then
                Minimum_Distance = Distance
                Closest_Player = v
            end
        end
    end
    return Closest_Player
end

local function Farm(Height)
    local Root = (Get_Closest_Player().Character.HumanoidRootPart)
    local Position = CFrame.new((Root.Position + (Root.AssemblyLinearVelocity*.1)) + Vector3.new(0, Height, 0))
    if Root.Parent.Name == Local_Player.Name then
        if Found == true then
            Found = false
            warn("No Players Found, Everyone Is Likely Hiding. | Celerity")
        end
    else
        if Found == false then
            Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            Players.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            Players.LocalPlayer.Character:SetPrimaryPartCFrame(Position)
            task.wait(0.39)
            Replicated_Storage.GeneralHit:FireServer(Root)
            Found = true
            warn("Players Found. | Celerity")
        else
            Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            Players.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            Players.LocalPlayer.Character:SetPrimaryPartCFrame(Position)
            task.wait(0.39)
            Replicated_Storage.GeneralHit:FireServer(Root)
        end
    end
    workspace.Gravity = 50
end

for i,v in pairs(workspace.Lobby:GetChildren()) do if string.match(string.lower(v.Name), "teleport") then v:Destroy() end end
workspace.Arena:Destroy()

local Tap = Instance.new("Sound", workspace)
Tap.SoundId = "rbxassetid://10066931761"
Tap.Volume = 3
Tap.Name = "Tap"

local Hover = Instance.new("Sound", workspace)
Hover.SoundId = "rbxassetid://109776571563606"
Hover.Volume = 3
Hover.Name = "Hover"

local BG = Instance.new("Sound", workspace)
BG.SoundId = "rbxassetid://1848354536"
BG.Volume = 2
BG.Name = "BG"
BG.Looped = true
BG:Play()

for _, v in pairs(Local_Player.PlayerGui:GetChildren()) do
    if v:IsA("ScreenGui") then
        v.Enabled = false
    end
end

local function Anti_Sit()
    if Local_Player.Character:FindFirstChildWhichIsA("Humanoid").Sit == true then
        Local_Player.Character:FindFirstChildWhichIsA("Humanoid").Sit = false
        warn("Sit Canceled. | Celerity")
    end
end

local function Map()
    pcall(function()
        Local_Player.Character:FindFirstChildWhichIsA("Humanoid"):MoveTo(Vector3.new(1, 1, 1))
    end)
end

local function the()
    local random1 = math.random(-100, 100)
    local random2 = math.random(-100, 100)
    local y = Invisible()
    if tonumber(Local_Player.leaderstats.Slaps.Value) <= 665 then
        local Hide = CFrame.new(Vector3.new(random1, 10000, random2))
        Farm(-5.9)
        Local_Player.Character:SetPrimaryPartCFrame(Hide)
    else
        if y == true then
            local Hide = CFrame.new(Vector3.new(random1, 10000, random2))
            Farm(-1)
        else
            if Debug == true then
                Equip("Ghost")
            elseif Debug == false then
                pcall(Equip, "Ghost")
            end
            Replicated_Storage.Ghostinvisibilityactivated:FireServer()
            warn("Invisibility Turned On. | Celerity")
        end
    end
end

local function Loop()
    while task.wait(0.19) do
        if Debug == false then
            pcall(the)
        elseif Debug == true then
            the()
        end
    end
end

local function Anti_Sit_Loop()
    while task.wait(0.5) do
        if Debug == false then
            pcall(Anti_Sit)
        elseif Debug == true then
            Anti_Sit()
        end
    end
end

local CO = coroutine.create(Loop)
coroutine.resume(CO)

--ui
-- Gui to Lua
-- Version: 3.2

-- Instances:

local CelerityFarm = Instance.new("ScreenGui")
local Background = Instance.new("ImageLabel")
local Finisher = Instance.new("TextButton")
local SlapCounter = Instance.new("TextLabel")
local Credit = Instance.new("TextButton")

--Properties:

CelerityFarm.Name = "Celerity Farm"
CelerityFarm.Parent = Local_Player.PlayerGui
CelerityFarm.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CelerityFarm.ResetOnSpawn = false
CelerityFarm.IgnoreGuiInset = true

Background.Name = "Background"
Background.Parent = CelerityFarm
Background.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Image = "rbxassetid://296812735"

Finisher.Name = "Finisher"
Finisher.Parent = Background
Finisher.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Finisher.BackgroundTransparency = 1.000
Finisher.BorderColor3 = Color3.fromRGB(0, 0, 0)
Finisher.BorderSizePixel = 0
Finisher.Position = UDim2.new(0.5, -100, 0.5, -100)
Finisher.Size = UDim2.new(0, 200, 0, 200)
Finisher.Font = Enum.Font.Garamond
Finisher.Text = "Finish"
Finisher.TextColor3 = Color3.fromRGB(255, 255, 255)
Finisher.TextSize = 50.000
Finisher.TextWrapped = true

SlapCounter.Name = "Slap Counter"
SlapCounter.Parent = Background
SlapCounter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SlapCounter.BackgroundTransparency = 1.000
SlapCounter.BorderColor3 = Color3.fromRGB(0, 0, 0)
SlapCounter.BorderSizePixel = 0
SlapCounter.Position = UDim2.new(0.5, -250, 0.100000001, -50)
SlapCounter.Size = UDim2.new(0, 500, 0, 100)
SlapCounter.Font = Enum.Font.Garamond
SlapCounter.Text = "Slaps: 100"
SlapCounter.TextColor3 = Color3.fromRGB(255, 255, 255)
SlapCounter.TextSize = 100.000

Credit.Name = "Credit"
Credit.Parent = Background
Credit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credit.BackgroundTransparency = 1.000
Credit.BorderColor3 = Color3.fromRGB(0, 0, 0)
Credit.BorderSizePixel = 0
Credit.Position = UDim2.new(0, 0, 1, -100)
Credit.Size = UDim2.new(0, 200, 0, 100)
Credit.Font = Enum.Font.Garamond
Credit.Text = "By Celerity"
Credit.TextColor3 = Color3.fromRGB(255, 255, 255)
Credit.TextSize = 25.000
Credit.TextTransparency = 0.500
Credit.TextXAlignment = Enum.TextXAlignment.Left
Credit.TextYAlignment = Enum.TextYAlignment.Bottom
Credit.Active = true
--ui

local function Update()
    while task.wait(0.1) do
        SlapCounter.Text = "Slaps: "..Players.LocalPlayer.leaderstats.Slaps.Value
        if Debug == true then
            Equip("Dual")
        elseif Debug == false then
            pcall(Equip, "Dual")
        end
    end
end

local function Camera()
    while task.wait(1) do
        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
        workspace.CurrentCamera.CFrame = CFrame.new(Vector3.new(0, 20000, 0))
    end
end

workspace.Backgroundmusic:Destroy()
workspace.Sounds.Select.Volume = 0

local COR = coroutine.create(Update)
coroutine.resume(COR)

local CORO = coroutine.create(Camera)
coroutine.resume(CORO)

local COROU = coroutine.create(Anti_Sit_Loop)
coroutine.resume(COROU)

Finisher.MouseButton1Click:Connect(function()
    Tap:Play()
    task.wait(0.1)
	Teleport_Service:Teleport(game.PlaceId, Local_Player)
end)

Finisher.TouchTap:Connect(function()
    Tap:Play()
    task.wait(0.1)
	Teleport_Service:Teleport(game.PlaceId, Local_Player)
end)

Credit.MouseButton1Click:Connect(function()
    if Debug == true then
        Debug = false
        Credit.TextColor3 = Color3.fromRGB(255, 255, 255)
        warn("Debug Mode Off. | Celerity")
    elseif Debug == false then
        Debug = true
        Credit.TextColor3 = Color3.fromRGB(255, 128, 0)
        warn("Debug Mode On. | Celerity")
    end
end)

Credit.TouchTap:Connect(function()
    if Debug == true then
        Debug = false
        Credit.TextColor3 = Color3.fromRGB(255, 255, 255)
        warn("Debug Mode Off. | Celerity")
    elseif Debug == false then
        Debug = true
        Credit.TextColor3 = Color3.fromRGB(255, 128, 0)
        warn("Debug Mode On. | Celerity")
    end
end)

Finisher.MouseEnter:Connect(function()
	Tween_Service:Create(Finisher, TweenInfo.new(1, Enum.EasingStyle.Quart), {TextSize = 60}):Play()
    Hover:Play()
end)

Finisher.MouseLeave:Connect(function()
	Tween_Service:Create(Finisher, TweenInfo.new(1, Enum.EasingStyle.Quart), {TextSize = 50}):Play()
    Hover:Play()
end)

for i, v in ipairs(workspace:GetDescendants()) do
    local Dangerous = {"AntiDefaultArena", "Antidream", "ArenaBarrier", "DEATHBARRIER", "DEATHBARRIER2", "dedBarrier"}
    if table.find(Dangerous, v.Name) then
        v.CanTouch = false
    end
end

Run_Service.RenderStepped:Connect(Map)

warn("Slap Farm Executed Successfully. | Celerity")
