local awful = require("awful")
local wibox = require("wibox")

local volume_widget = wibox.widget {
    widget = wibox.widget.textbox,
}

local function update_volume()
    awful.spawn.easy_async("amixer -D pulse get Master", function(stdout)
        local volume = stdout:match("(%d?%d?%d)%%")
        local mute = stdout:match("%[(o[^%]]*)%]")

        local icon = "" -- You can customize this icon (Font Awesome icon for speaker)
        if mute == "off" then
            icon = "婢" -- You can customize this icon (Font Awesome icon for muted speaker)
        end

        volume_widget:set_markup_silently("<span font='Font Awesome 10'>" .. icon .. "</span> " .. volume .. "%")
    end)
end

-- Increase volume function
local function increase_volume()
    awful.spawn("amixer -D pulse sset Master 5%+", false, update_volume)
end

-- Decrease volume function
local function decrease_volume()
    awful.spawn("amixer -D pulse sset Master 5%-", false, update_volume)
end

-- Toggle mute function
local function toggle_mute()
    awful.spawn("amixer -D pulse sset Master toggle", false, update_volume)
end

-- Mouse bindings
volume_widget:connect_signal("button::press", function(_, _, _, button)
    if button == 4 then
        increase_volume()
    elseif button == 5 then
        decrease_volume()
    elseif button == 1 then
        toggle_mute()
    end
end)

-- Update the volume widget periodically (every 2 seconds)
awful.widget.watch("amixer -D pulse get Master", 2, update_volume)

return volume_widget
