-- Noxle Hub | Tha Bronx 3 - FIXED RAYFIELD (No 404 Errors)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()  -- Working mirror 2025

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

-- Safe Teleport
local function TP(x, y, z)
    if not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") then return end
    Player.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
end

local Main = Window:CreateTab("Main")
local Local = Window:CreateTab("Local")

-- Infinite Illegal Money
Main:CreateButton({
    Name = "Infinite Illegal Money",
    Callback = function()
        local oldPos = Player.Character.HumanoidRootPart.Position
        TP(-48, 287, -338)
        task.wait(1.5)
        local prompt = Workspace:FindFirstChild("IceFruit Sell") and Workspace["IceFruit Sell"]:FindFirstChildWhichIsA("ProximityPrompt")
        if prompt then
            for i = 1, 2000 do
                fireproximityprompt(prompt, 0)
            end
        end
        task.wait(0.8)
        TP(oldPos.X, oldPos.Y, oldPos.Z)
    end
})

-- Item Duplication
local duping = false
Main:CreateButton({
    Name = "Duplicate Equipped Item",
    Callback = function()
        if duping then return end
        duping = true
        local char = Player.Character or Player.CharacterAdded:Wait()
        local tool = char:FindFirstChildOfClass("Tool")
        if not tool then
            duping = false
            Rayfield:Notify({Title = "Error", Content = "Equip a tool!"})
            return
        end
        tool.Parent = Player.Backpack
        task.wait(0.5)
        local name = tool.Name
        local id
        local conn = ReplicatedStorage.MarketItems.ChildAdded:Connect(function(i)
            if i.Name == name and i:FindFirstChild("owner") and i.owner.Value == Player.Name then
                id = i:GetAttribute("SpecialId")
            end
        end)
        ReplicatedStorage.ListWeaponRemote:FireServer(name, 99999)
        task.wait(0.4)
        ReplicatedStorage.BackpackRemote:InvokeServer("Store", name)
        task.wait(3)
        if id then ReplicatedStorage.BuyItemRemote:FireServer(name, "Remove", id) end
        ReplicatedStorage.BackpackRemote:InvokeServer("Grab", name)
        conn:Disconnect()
        duping = false
    end
})

-- 16 TPs
local locs = {
    ["Bank"] = Vector3.new(-204, 284, -1223), ["Ice Box"] = Vector3.new(-193, 284, -1169),
    ["Gunstore 1"] = Vector3.new(-1003, 254, -817), ["Gunstore 2"] = Vector3.new(-202, 284, -798),
    ["Gunstore 3 (Hood)"] = Vector3.new(72425, 128856, 1082), ["Gunstore 4 (Hood)"] = Vector3.new(60822, 87609, 352),
    ["Laundromat"] = Vector3.new(-990, 254, -686), ["Backpack Shop"] = Vector3.new(-670, 254, -681),
    ["Jamaican Food"] = Vector3.new(-670, 254, -810), ["Deli & Grill"] = Vector3.new(-746, 254, -906),
    ["Chicken & Wings"] = Vector3.new(964, 254, -813), ["McDonald's"] = Vector3.new(-999, 254, -1134),
    ["Dealership"] = Vector3.new(-389, 253, -1232), ["Old Penthouse"] = Vector3.new(-124, 417, 575),
    ["New Penthouse"] = Vector3.new(-597, 356, -714), ["Penthouse Cook Pot"] = Vector3.new(-614, 356, -683)
}
local sel = "Bank"
Main:CreateDropdown({
    Name = "Teleport (16)",
    Options = {"Bank", "Ice Box", "Gunstore 1", "Gunstore 2", "Gunstore 3 (Hood)", "Gunstore 4 (Hood)", "Laundromat", "Backpack Shop", "Jamaican Food", "Deli & Grill", "Chicken & Wings", "McDonald's", "Dealership", "Old Penthouse", "New Penthouse", "Penthouse Cook Pot"},
    CurrentOption = {"Bank"},
    Callback = function(v) sel = v[1] end
})
Main:CreateButton({
    Name = "Teleport",
    Callback = function() TP(locs[sel].X, locs[sel].Y, locs[sel].Z) end
})

-- Instant Interact
local pc
Local:CreateToggle({
    Name = "Instant Interact",
    CurrentValue = false,
    Callback = function(v)
        if v then
            for _, p in Workspace:GetDescendants() do if p:IsA("ProximityPrompt") then p.HoldDuration = 0 end end
            pc = ProximityPromptService.PromptButtonHoldBegan:Connect(function(p) p.HoldDuration = 0 end)
        else if pc then pc:Disconnect() end end
    end
})

Rayfield:Notify({Title = "Noxle Hub", Content = "Loaded Successfully • Key Accepted", Duration = 8})
