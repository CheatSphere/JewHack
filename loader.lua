---//

if getidentity() > 4
then

------
------

if not game:IsLoaded() then game.Loaded:Wait() end

---//
if game.PlaceId == 2534724415 then
    loadstring(game:HttpGet("https://erlchook.loaders.csphere.vip"))()
else
    game.StarterGui:SetCore("SendNotification",{Title = "ERLChook",Text = "ERLChook doesn't work on other games than ER:LC!",Duration = 10,})
end
---\\

------
------

else
game.StarterGui:SetCore("SendNotification",{Title = "ERLChook",Text = "Executor not supported!",Duration = 10,})
end

---\\
