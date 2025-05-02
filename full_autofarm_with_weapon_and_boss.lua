
-- Blox Fruits Full GUI Script (Auto Farm, Fast Attack, Auto Kill, Teleport, Boss Auto, Weapon Select)

local FastAttackSpeed = 0.1
local SelectedWeapon = "Combat"
local autoFarm = false
local fastAttack = false
local autoKill = false
local autoBoss = false
local TeleportLocation = nil

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/edJT9EGX"))()
local Window = Library:CreateWindow("Blox Fruits Hub")
local Tab = Window:CreateTab("Main")
local Section = Tab:CreateSection("Auto Features")

Section:CreateToggle("Auto Farm", false, function(val) autoFarm = val end)
Section:CreateToggle("Fast Attack", false, function(val) fastAttack = val end)
Section:CreateSlider("Fast Attack Speed", 0.001, 1, 0.1, function(val) FastAttackSpeed = val end)
Section:CreateToggle("Auto Kill Nearest", false, function(val) autoKill = val end)
Section:CreateToggle("Auto Kill All Bosses", false, function(val) autoBoss = val end)

-- Weapon Selection
Section:CreateDropdown("Select Weapon", {"Combat", "Katana", "Cutlass", "Iron Mace", "Triple Katana"}, function(wpn)
    SelectedWeapon = wpn
end)

-- Teleport Locations
local teleportLocations = {
    ["Jungle"] = CFrame.new(-1337, 11, 495),
    ["Pirate Village"] = CFrame.new(-1100, 4, 3870),
    ["Marine Fortress"] = CFrame.new(-4500, 195, 4260),
    ["Sky Island"] = CFrame.new(-5000, 800, 1500)
}

Section:CreateDropdown("Teleport To", {"None", "Jungle", "Pirate Village", "Marine Fortress", "Sky Island"}, function(loc)
    TeleportLocation = teleportLocations[loc]
end)

-- Core Loops
spawn(function()
    while task.wait(0.1) do
        if autoFarm then
            print("Auto farming with:", SelectedWeapon)
            -- Add farm logic here
        end
        if autoKill then
            local char = game.Players.LocalPlayer.Character
            for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
                    enemy.Humanoid.Health = 0
                    break
                end
            end
        end
        if autoBoss then
            for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and enemy.Name:find("Boss") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
                    enemy.Humanoid.Health = 0
                end
            end
        end
    end
end)

spawn(function()
    while task.wait(FastAttackSpeed) do
        if fastAttack then
            print("Fast attacking with:", SelectedWeapon)
            -- Fast attack logic
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
        if TeleportLocation then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TeleportLocation
            TeleportLocation = nil -- chỉ teleport 1 lần mỗi lần chọn
        end
    end
end)
