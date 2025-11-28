--// Seliware, Wave, are detected on erlc, add a blacklist

if getidentity() > 4
then

------
------

if not game:IsLoaded() then game.Loaded:Wait() end

---//
loadstring(game:HttpGet("https://erlchook.csphere.vip"))()
---\\

------
------

else
game.StarterGui:SetCore("SendNotification",{Title = "ERLChook",Text = "Executor not supported!",Duration = 10,})
end
