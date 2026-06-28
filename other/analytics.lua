cloneref = cloneref or function(obj) return obj end

local HttpService = cloneref(game:GetService("HttpService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local MarketplaceService = cloneref(game:GetService("MarketplaceService"))

local request = http_request or request
local Analytics = {}

function Analytics:Send(Worker, ID, Name)
    local Success, Name = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId).Name
    end)

    pcall(function()
        request({
            Url = Worker,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode({
                script_id = ID,
                script_name = gethwid and gethwid() or "yes",
                executor = identifyexecutor and identifyexecutor() or "Unknown",
                game_id = tostring(game.PlaceId),
                game_name = Success and Name or "Emergency Response: Liberty County",
                is_mobile = UserInputService:GetPlatform() == Enum.Platform.Android or UserInputService:GetPlatform() == Enum.Platform.IOS or false,
            }),
        })
    end)
end

return Analytics
