repeat task.wait() until getgenv().JHK and getgenv().JHK.Addons
-- // ignore TODO: add button keybinds

--// find icons at https://jewhack.org/icons
--// i strongly advise you use flags and JHK:GetFlag(), they're very useful

--// addons are forced into one tab, you can only create sections inside it
local Section = JHK:AddSection("addon sigma", "left") -- name, side (left, right)

Section:AddLabel("toggle"):AddToggle({ -- toggles need labels behind them, other things don't
    Default = false,
    Flag = "toggle",
    Callback = function(Value)
        JHK:Notify("addon", "toggle: " .. tostring(Value), 5, "small", "bell")
    end
}):AddKeybind({ -- keybinds do NOT show up on mobile
    Default = "None",
    Text = "keybind",
    SyncToggle = true, -- every keybind in jewhack uses this
    Mode = "Toggle",
    Flag = "keybind"
})

Section:AddSlider({
    Text = "slider",
    Default = 10,
    Min = 1,
    Max = 50,
    Rounding = 0,
    Flag = "slider",
    Callback = function(Value)
        JHK:Notify("addon", "slider: " .. tostring(Value), 2, "small", "bell")
    end
})

Section:AddDropdown({
    Text = "single dropdown",
    Default = "1",
    Values = {"1", "2", "3"},
    Flag = "dropdown",
    Callback = function(Value)
        JHK:Notify("addon", "selected: " .. Value, 5, "small", "bell")
    end
})

Section:AddMultiDropdown({
    Text = "multi dropdown",
    Default = {"1"},
    Values = {"1", "2", "3"},
    Flag = "dropdown2",
    Callback = function(Value)
    end
})

Section:AddColorPicker({
    Text = "color",
    Default = Color3.fromRGB(255, 0, 0),
    Flag = "colorpicker",
    Callback = function(Value)
        print(Value)
    end
})

Section:AddInput({
    Text = "type something",
    Default = "",
    Placeholder = "type here...",
    Flag = "textbox",
    Callback = function(Value)
        JHK:Notify("addon", "textbox: " .. tostring(Value), 2, "small", "bell")
    end
})

Section:AddButton({
    Name = "button",
    Callback = function()
        -- title, content, duration, size (big, small), icon 
        -- icon is only used for small notifs
        JHK:Notify("notification", "this is a large notification.", 5, "big")
        JHK:Notify("notification", "this is a small notification", 5, "small", "bell")
    end
})

Section:AddButton({
    Name = "getflag",
    Callback = function()
        -- getflag returns the value of a flag
        JHK:Notify("notification", "toggle: " .. tostring(JHK:GetFlag("toggle")), 5, "small", "bell")
        JHK:Notify("notification", "dropdown: " .. tostring(JHK:GetFlag("dropdown")), 5, "small", "bell")
        JHK:Notify("notification", "colorpickjer: " .. tostring(JHK:GetFlag("colorpicker")), 5, "small", "bell")
    end
})

Section:AddButton({
    Name = "setflag",
    Callback = function()
        -- SetValues() for dropdowns
        if JHK:GetFlag("toggle") then
            JHK.Flags.toggle:SetValue(false)
        else
            JHK.Flags.toggle:SetValue(true)
        end
    end
})

Section:AddButton({
    Name = "get target",
    Callback = function()
        local Target = JHK:GetTarget()
        if Target then
            JHK:Notify("notification", "target: " .. Target.Name, 5, "small", "bell")
        else
            JHK:Notify("notification", "no target selected", 5, "small", "bell")
        end
    end
})

Section:AddButton({
    Name = "suicide",
    Callback = function()
        -- JHK:Suicide(Respawn, Location)

        JHK:Suicide(true)
        -- JHK:Suicide(Respawn, "Springfield")
        -- JHK:Suicide(Respawn, "River City")
    end
})

Section:AddButton({
    Name = "sit in your car",
    Callback = function()
        local Car = JHK:OwnedCar()

        if Car and Car:FindFirstChild("DriverSeat") then
            JHK:VehicleSit(Car.DriverSeat)
        else
            JHK:Notify("notification", "no car found", 5, "small", "bell")
        end
    end
})

Section:AddButton({
    Name = "tp to spawn",
    Icon = "location-pin", -- add ur own icons to buttons
    Confirm = true, -- "Are you sure?"
    Callback = function()
        if not JHK:IsDriving() then 
            JHK:Notify("notification", "must be driving!", 5, "small", "bell") 
            return
        end

        JHK:VehicleTP(CFrame.new(-546, 23, 705))
    end
})

--// 
Section:AddButton({
    Name = "everything else",
    Callback = function()
        -- these can be called on other players too
        

        -- isdriving only returns true if you're driving, isinvehicle will if you're just in a car
        JHK:Notify("notification", "driving: " .. tostring(JHK:IsDriving()), 5, "small", "bell") 
        JHK:Notify("notification", "in vehicle: " .. tostring(JHK:IsInVehicle()), 5, "small", "bell")


        local Vehicle = JHK:CurrentVehicle()
        JHK:Notify("notification", "vehicle: " .. tostring(Vehicle and Vehicle.Name or "none"), 5, "small", "bell")

        local Car = JHK:OwnedCar() -- JHK:OwnedATV() is the same but just with atvs instead of vehicles
        JHK:Notify("notification", "owned car: " .. tostring(Car and Car.Name or "none"), 5, "small", "bell")

        local ATV = JHK:OwnedATV()
        JHK:Notify("notification", "owned atv: " .. tostring(ATV and ATV.Name or "none"), 5, "small", "bell")

        JHK:Notify("notification", "alive: " .. tostring(JHK:IsAlive()), 5, "small", "bell")

        JHK:Notify("notification", "combat: " .. tostring(JHK:IsCombat()), 5, "small", "bell")

        JHK:Notify("notification", "wanted: " .. tostring(JHK:CanArrest()), 5, "small", "bell")



        local Peacetime, Time = JHK:IsPeacetime()
        if Peacetime then
            JHK:Notify("notification", "peacetime: " .. tostring(Peacetime) .. " (" .. Time .. ")", 5, "small", "bell")
        else
            JHK:Notify("notification", "peacetime: " .. tostring(Peacetime), 5, "small", "bell")
        end
    end
})

-- self explanatory
Section:AddLabel("you're on " .. (JHK:IsMobile() and "mobile" or "pc"))

JHK:Notify("notification", "welcome to phonk. brother ☠️", 5, "small", "bell")
