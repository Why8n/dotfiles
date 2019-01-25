[StrokesPlus]
----------------------
* [StrokesPlus完美鼠标手势+简单使用教程][tutorial]

* [key-mapping lookup][acSendKeysUsage]

* my configurations for [Chrome]

|     **Move**    |  **Hot-Key**          | StrokesPlus configure |
|:--:         |:--:          |:--:|
|forward         |ALT+RIGHT          |acSendKeys("%{RIGHT}") |
|backward         |ALT+LEFT          |acSendKeys("%{LEFT}")  |
|closeTab       |Ctrl+w              |acSendKeys("^w")  |
|refresh       |F5              |acSendKeys("{F_5}")   |
|reopen       |Ctrl+Shift+T              | acSendKeys("^+t")  |
|top       |Home              |  acSendKeys("{HOME}")   |
|bottom       |End              |   acSendKeys("{END}")  |
|close_all_tab(will close chrome)       |Ctrl+Shift+w  |acSendKeys("^+w")|
|window maximize    | ALT+Space+X     |acMaximizeOrRestoreWindow(nil, gsx, gsy)|
|window minimize  | ALT+Space+X     |acMinimizeWindow(nil, gsx, gsy) 
|switch to right tab   | Ctrl+Tab    |   acSendKeys("^{TAB}")  |
|switch to left tab   | Ctrl+Shift+Tab    |   acSendKeys("^+{TAB}")  |







[StrokesPlus]:https://www.strokesplus.com/

[tutorial]:https://bbs.kafan.cn/thread-1387653-1-1.html

[acSendKeysUsage]:https://www.strokesplus.com/help/#acSendKeysUsage

[Chrome]:https://www.google.com/chrome/

