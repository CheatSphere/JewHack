pcall(function()
    local request = syn and syn.request or http_request or request or fluxus and fluxus.request
    local HttpService = game:GetService("HttpService")
    
    request({
        Url = 'http://127.0.0.1:6463/rpc?v=1',
        Method = 'POST',
        Headers = {
            ['Content-Type'] = 'application/json',
            ['Origin'] = 'https://discord.com'
        },
        Body = HttpService:JSONEncode({
            cmd = 'INVITE_BROWSER',
            nonce = HttpService:GenerateGUID(false),
            args = {code = '99qGMcNywR'}
        })
    })
end)
