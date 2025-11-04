if getidentity() > 4
then

------
------

if not game:IsLoaded() then game.Loaded:Wait() end

---//
loadstring(game:HttpGet("https://linkherewhenuploaded"))()
---\\

------
------

else
game.StarterGui:SetCore("SendNotification",{Title = "ERLChook",Text = "Executor not supported!",Duration = 10,})
end
