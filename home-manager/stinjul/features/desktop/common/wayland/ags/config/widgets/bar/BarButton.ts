import { ButtonProps } from "types/widgets/button"

type PanelButtonProps = ButtonProps & {
    window?: string,
}

export default ({
    window = "",
    setup,
    ...rest
}: PanelButtonProps) => Widget.Button({
    setup: self => {
        self.toggleClassName("bar-button")
        self.toggleClassName(window)

        self.hook(App, (_, win, visible) => {
            if (win !== window)
                return
            self.toggleClassName("active", visible)
        })
        if (setup)
            setup(self)
    },
    ...rest,
})
