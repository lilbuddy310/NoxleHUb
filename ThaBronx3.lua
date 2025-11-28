-- Noxle Hub | Tha Bronx 3 - Key: NoxleOnTop
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Noxle Hub Tha Bronx 3",
    LoadingTitle = "Noxle Hub Loading...",
    LoadingSubtitle = "Noxle Hub On Top",
    Theme = "Amethyst",
    KeySystem = true,
    KeySettings = {
        Title = "Noxle Hub | Tha Bronx 3",
        Subtitle = "Enter Key",
        Note = "Join Discord to get key: https://discord.com/invite/9C93DhjK",
        SaveKey = false,
        Key = "NoxleOnTop"
    }
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local ProximityPromptService = game:GetService("ProximityPromptService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local function TP(x, y, z)
    local char = Player.Character or Player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    local hum = char:WaitForChild("Humanoid")
    hum:ChangeState(0)
    repeat task.wait() until not Player:GetAttribute("LastACPos")
    hrp.CFrame = CFrame.new(x, y, z)
    hum.PlatformStand = false
    hrp.Velocity = Vector3.new(0,0,0)
end

local Main = Window:CreateTab("Main")

Main:CreateButton({Name="Infinite Illegal Money",Callback=function()
    local old = Player.Character.HumanoidRootPart.Position
    TP(-48,287,-338) task.wait(1.2)
    local p = Workspace["IceFruit Sell"]:FindFirstChildWhichIsA("ProximityPrompt")
    if p then for i=1,1200 do fireproximityprompt(p,0) end end
    task.wait(1) TP(old.X,old.Y,old.Z)
    Rayfield:Notify({Title="Noxle Hub",Content="1.2M+ Illegal Money Farmed!",Duration=5})
end})

Main:CreateButton({Name="Buy All Ice-Fruit Items",Callback=function()
    for _,v in {"Ice-Fruit Bag","Ice-Fruit Cupz","FijiWater","FreshWater"} do
        ReplicatedStorage.ExoticShopRemote:InvokeServer(v) task.wait(1.3)
    end
    Rayfield:Notify({Title="Noxle Hub",Content="All items bought!",Duration=5})
end})

local cd = false
Main:CreateButton({Name="Duplicate Equipped Item",Callback=function()
    if cd then return end cd = true
    local tool = Player.Character:FindFirstChildOfClass("Tool")
    if not tool then cd=false return Rayfield:Notify({Title="Error",Content="Equip a tool!"}) end
    Player.Character.Humanoid:UnequipTools()
    local n, id = tool.Name
    local c = ReplicatedStorage.MarketItems.ChildAdded:Connect(function(i)
        if i.Name==n and i.owner.Value==Player.Name then id=i:GetAttribute("SpecialId") end
    end)
    ReplicatedStorage.ListWeaponRemote:FireServer(n,99999) task.wait(.3)
    ReplicatedStorage.BackpackRemote:InvokeServer("Store",n) task.wait(3)
    ReplicatedStorage.BuyItemRemote:FireServer(n,"Remove",id)
    ReplicatedStorage.BackpackRemote:InvokeServer("Grab",n)
    c:Disconnect()
    Rayfield:Notify({Title="Noxle Hub",Content=n.." Duplicated!",Duration=6})
    task.wait(5) cd=false
end})

local locs = {
    ["Bank"]=Vector3.new(-204,284,-1223),["Ice Box"]=Vector3.new(-193,284,-1169),
    ["Gunstore 1"]=Vector3.new(-1003,254,-817),["Gunstore 2"]=Vector3.new(-202,284,-798),
    ["Gunstore 3 (Hood)"]=Vector3.new(72425,128856,1082),["Gunstore 4 (Hood)"]=Vector3.new(60822,87609,352),
    ["Laundromat"]=Vector3.new(-990,254,-686),["Backpack Shop"]=Vector3.new(-670,254,-681),
    ["Jamaican Food"]=Vector3.new(-670,254,-810),["Deli & Grill"]=Vector3.new(-746,254,-906),
    ["Chicken & Wings"]=Vector3.new(964,254,-813),["McDonald's"]=Vector3.new(-999,254,-1134),
    ["Dealership"]=Vector3.new(-389,253,-1232),["Old Penthouse"]=Vector3.new(-124,417,575),
    ["New Penthouse"]=Vector3.new(-597,356,-714),["Penthouse Cook Pot"]=Vector3.new(-614,356,-683)
}
local sel = "Bank"
Main:CreateDropdown({Name="Teleport (16)",Options=table.create(locs),CurrentOption={"Bank"},Callback=function(v)sel=v[1]end})
Main:CreateButton({Name="Teleport",Callback=function() TP(locs[sel].X, locs[sel].Y, locs[sel].Z) end})

local Local = Window:CreateTab("Local")
local pc
Local:CreateToggle({Name="Instant Interact",CurrentValue=false,Callback=function(v)
    if v then
        for _,p in Workspace:GetDescendants() do if p:IsA("ProximityPrompt") then p.HoldDuration=0 end end
        pc = ProximityPromptService.PromptButtonHoldBegan:Connect(function(p) p.HoldDuration=0 end)
    else if pc then pc:Disconnect() end end
end})

Local:CreateToggle({Name="Infinite Sleep",CurrentValue=false,Callback=function(v)
    task.spawn(function() while v do task.wait(1)
        local s = PlayerGui:FindFirstChild("SleepGui") and PlayerGui.SleepGui.Frame.sleep.SleepBar:FindFirstChild("sleepScript")
        if s then s.Disabled=true end
    end end)
end})

Local:CreateToggle({Name="Infinite Hunger",CurrentValue=false,Callback=function(v)
    task.spawn(function() while v do task.wait(1)
        local h = PlayerGui:FindFirstChild("Hunger") and PlayerGui.Hunger.Frame.Frame.Frame:FindFirstChild("HungerBarScript")
        if h then h.Disabled=true end
    end end)
end})

Rayfield:Notify({Title="Noxle Hub",Content="Tha Bronx 3 Loaded • Key Accepted",Duration=8})
