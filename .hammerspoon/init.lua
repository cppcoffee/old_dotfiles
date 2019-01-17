mods={"cmd", "alt", "ctrl"}


--caffeine
hs.loadSpoon("Caffeine")

hs.hotkey.bind(mods, "S", function()
	spoon.Caffeine:start()
end)

hs.hotkey.bind(mods, "E", function()
	spoon.Caffeine:stop()
end)

hs.hotkey.bind(mods, "L", function()
	hs.caffeinate:lockScreen()
end)


--CountDown
hs.loadSpoon("CountDown")
hs.hotkey.bind(mods, "O", function()
	spoon.CountDown:startFor(25)
end)


--WifiNotifier
hs.loadSpoon("WifiNotifier")
spoon.WifiNotifier:start()


--HCalendar
hs.loadSpoon("HCalendar")


--Netease Music
hs.hotkey.bind(mods, "N", function()
    local app = hs.application("网易云音乐")
    if app ~= nil then
        app:selectMenuItem({"控制", "下一个"}, true)
    end
end)

hs.hotkey.bind(mods, "P", function()
    local app = hs.application("网易云音乐")
    if app ~= nil then
        app:selectMenuItem({"控制", "上一个"}, true)
    end
end)


--window control
hs.hotkey.bind(mods, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(mods, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)



