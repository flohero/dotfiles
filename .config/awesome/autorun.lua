local awful = require("awful")
local autorun = {}

local commands = {
  "xrandr --output eDP-1-1 --mode 1920x1080",
  "insync start",
}

local apps = {
  "nm-applet",
  "compton",
}

awful.util.spawn("nm-applet")
awful.spawn.with_shell("~/.config/awesome/autorun.sh compton")

function autorun.run() 
  for cmd = 1, #commands do
    awful.util.spawn(commands[cmd])
  end
  for app = 1, #apps do
    awful.spawn.with_shell("~/.config/awesome/autorun.sh " .. apps[app])
  end
end

return autorun
