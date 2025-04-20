local Module_Utils = {}
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Chat = TextChatService.ChatInputBarConfiguration.TargetTextChannel

function Module_Utils.SendInChat(msg)
    if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
        ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg,"All")
    else
        Chat:SendAsync(msg)
    end
end

function Module_Utils.HighlightPlayer(value, playerModel, name, color)
    getgenv().RTX123 = value

    task.spawn(function()
        while getgenv().RTX123 do
            if playerModel and playerModel:FindFirstChild("HumanoidRootPart") then
                local checkHighlight = playerModel:FindFirstChild(name)
                if not checkHighlight then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = name
                    highlight.FillColor = color or Color3.fromRGB(255, 234, 0)
                    highlight.FillTransparency = 0.6
                    highlight.OutlineTransparency = 1
                    highlight.Parent = playerModel
                    highlight.Adornee = playerModel
                end
            end
            task.wait()
        end
        local existing = playerModel:FindFirstChild(name)
        if existing then
            existing:Destroy()
        end
    end)
end

return Module_Utils