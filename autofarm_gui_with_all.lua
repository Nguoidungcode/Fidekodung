
-- Auto Farm + Fast Attack Menu (Mẫu)
local FastAttackSpeed = 0.1  -- Thời gian delay giữa các đòn đánh, có thể chỉnh

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/edJT9EGX"))()
local Window = Library:CreateWindow("BloxFruits Auto Farm")
local Tab = Window:CreateTab("Main")
local Section = Tab:CreateSection("Auto")

local autoFarm = false
local fastAttack = false

Section:CreateToggle("Auto Farm", false, function(value)
    autoFarm = value
end)

Section:CreateToggle("Fast Attack", false, function(value)
    fastAttack = value
end)

Section:CreateSlider("Fast Attack Speed", 0.001, 1, 0.1, function(value)
    FastAttackSpeed = value
end)

-- Auto Farm loop
spawn(function()
    while true do wait(1)
        if autoFarm then
            -- Chèn logic farm ở đây
            print("Đang auto farm...")
        end
    end
end)

-- Fast Attack loop
spawn(function()
    while true do wait(FastAttackSpeed)
        if fastAttack then
            -- Chèn logic tấn công nhanh ở đây
            print("Tấn công nhanh với tốc độ:", FastAttackSpeed)
        end
    end
end)
