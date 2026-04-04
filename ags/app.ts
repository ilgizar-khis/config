import app from "ags/gtk4/app"
import style from "./style.scss"
import Bar from "./widget/Bar"
import MyBar from "./widget/MyBar"
import Clock from "./widget/Clock.tsx"
import StatusBar from "./widget/StatusBar.tsx"
import ScreenShot from "./widget/ScreenShot.tsx"


app.start({
  css: style,
  main() {
    // app.get_monitors().map(Bar)
    Bar(1)
    ScreenShot(1)
    // StatusBar(1)
    // app.get_monitors().map(MyBar)
    MyBar(1)
    // app.get_monitors().map(Clock)
    Clock()
  },
})
