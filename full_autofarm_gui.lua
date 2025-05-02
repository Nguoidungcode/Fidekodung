
-- Blox Fruits Full GUI Script (Auto Farm, Fast Attack, Auto Kill, Teleport)

local FastAttackSpeed = 0.1
local SelectedBoss = "None"
local TeleportLocation = nil

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/edJT9EGX"))()
local Window = Library:CreateWindow("Blox Fruits Hub")
local Tab = Window:CreateTab("Main")
local Section = Tab:CreateSection("Auto Features")

local autoFarm = false
local fastAttack = false
local autoKill = false

Section:CreateToggle("Auto Farm", false, function(val)
    autoFarm = val
end)

Section:CreateToggle("Fast Attack", false, function(val)
    fastAttack = val
end)

Section:CreateSlider("Fast Attack Speed", 0.001, 1, 0.1, function(val)
    FastAttackSpeed = val
end)

Section:CreateToggle("Auto Kill Nearest Enemy", false, function(val)
    autoKill = val
end)

-- Boss selection
local bossList = {"None", "Gorilla King", "Bobby", "Yeti", "Mob Leader", "Vice Admiral"}
Section:CreateDropdown("Select Boss", bossList, function(boss)
    SelectedBoss = boss
end)

-- Teleport
local teleportLocations = {
    ["Jungle"] = CFrame.new(-1337, 11, 495),
    ["Pirate Village"] = CFrame.new(-1100, 4, 3870),
    ["Marine Fortress"] = CFrame.new(-4500, 195, 4260),
    ["Sky Island"] = CFrame.new(-5000, 800, 1500)
}

Section:CreateDropdown("Teleport To", {"None", "Jungle", "Pirate Village", "Marine Fortress", "Sky Island"}, function(loc)
    TeleportLocation = teleportLocations[loc]
end)

-- Loops
spawn(function()
    while wait(1) do
        if autoFarm then
            print("Đang auto farm...")
            -- Thêm logic farm cụ thể ở đây
        end
        if autoKill then
            local char = game.Players.LocalPlayer.Character
            local enemies = workspace.Enemies:GetChildren()
            for _, enemy in pairs(enemies) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
                    enemy.Humanoid.Health = 0
                    break
                end
            end
        end
        if SelectedBoss ~= "None" then
            print("Đang tìm boss:", SelectedBoss)
            -- Thêm logic đánh boss ở đây nếu cần
        end
    end
end)

spawn(function()
    while wait(FastAttackSpeed) do
        if fastAttack then
            print("Fast Attack tick at speed", FastAttackSpeed)
            -- Thêm logic tấn công nhanh
        end
    end
end)

spawn(function()
    while wait(1) do
        if TeleportLocation then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TeleportLocation
            TeleportLocation = nil
        end
    end
end)
