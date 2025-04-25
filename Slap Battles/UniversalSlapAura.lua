repeat
    task.wait()
until game:IsLoaded()
wait(.1)

local Players = game:GetService("Players")
local Local_Player = Players.LocalPlayer

getgenv().SAT = false
getgenv().Refresh = 0.01
getgenv().Delay = 0.65

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

local function Not_Shield(Character)
    local Decision = true
    for i, v in ipairs(Character:GetDescendants()) do
        if string.match(v.Name, "Shield") then
            Decision = false
        end
    end
    return Decision
end

local function Slappable(Character)
    local Decision = false
    if Character.isInArena.Value == true then
        Decision = true
    elseif Character.IsInDefaultArena.Value == true then
        Decision = true
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
        local ns = Not_Shield(Character)
        if v == Local_Player or v.Name == Local_Player.Name or ns == false or Character:FindFirstChildWhichIsA("Humanoid").Health < 0.1 or nr == false or nar == false then
            --pass
        else
            local x, y = pcall(Not_Ragdolled, Character)
            local a, b = pcall(Slappable, Character)
            if y == true and b == true then
                local Distance = (Character.Head.Position - Local_Player.Character.Head.Position).Magnitude^2
                if Distance < Minimum_Distance then
                    Minimum_Distance = Distance
                    Closest_Player = v
                end
            end
        end
    end
    return Closest_Player
end

local function Slap_Closest()
    local X = Get_Closest_Player()
    local Y = X.Character.Torso
    for i ,v in ipairs(game:GetService("ReplicatedStorage"):GetChildren()) do if v:IsA("RemoteEvent") then local lr = string.lower(v.Name) if string.match(lr, "hit") or string.match(lr, "ht") then v:FireServer(Y) end end end
end

local function Slap_Aura_Loop()
    while task.wait(Refresh) do
        if SAT == true then
            Slap_Closest()
            task.wait(Delay)
        end
    end
end

coroutine.resume(coroutine.create(Slap_Aura_Loop))
