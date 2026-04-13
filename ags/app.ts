import app from "ags/gtk4/app"
import style from "./style.scss"
import Bar from "./widget/Bar"
import WallClock from "./widget/WallClock.tsx"
import Panel from "./widget/Panel.tsx"

app.start({
  css: style,
  main() {
      Bar(1)
      WallClock(0)
      Panel(1)
  },
})
