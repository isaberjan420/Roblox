local Delay = 1
local Names = {"RemoteEvent", "SetPace", "\75,:+>*pa<HN?ri", "3[A?E!r2qW:U_v%G", "8!)$7bL.kdmEDay>", "$qjy8G!A*iZ@t8wU"}
local Args = {"K_b4?!*':oHb9Pc:", "dmF<?57N<$us>2", "koX6D)DA5,Z_^/t", "1000000", "Bypass", "Disable", "Enable", true, false, 1, 0}
local Parents = {workspace, game:GetService("ReplicatedStorage"), game:GetService("ReplicatedFirst")}
local function Bomb()
    local Amount = math.random(5000, 20000)
    local Parent = Parents[math.random(1, #Parents)]
    local Name = Names[math.random(1, #Names)]
    local Arg = Args[math.random(1, #Args)]
    local RemoteE = Instance.new("RemoteEvent", Parent)
    local RemoteF = Instance.new("RemoteFunction", Parent)
    RemoteE.Name = Name
    RemoteF.Name = Name
    task.spawn(function()
        for i = 1, Amount do
            RemoteE:FireServer(Arg)
        end
    end)
    task.spawn(function()
        for i = 1, Amount do
            RemoteF:InvokeServer(Arg)
        end
    end)
    game:GetService("Debris"):AddItem(RemoteE, 1)
    game:GetService("Debris"):AddItem(RemoteF, 1)
end
for i, v in ipairs(game:GetDescendants()) do
    if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
        table.insert(Names, v.Name)
    end
end
local function Loop()
    while task.wait(Delay) do
        pcall(Bomb)
    end
end
coroutine.resume(coroutine.create(Loop))
