import { bash, dependencies, sh } from "lib/utils";
import options from "options"

const theme = options.theme

const $ = (name: string, value: string) => `$${name}: ${value};`

const vars = () => [
    $("bg", theme.bg),
    $("fg", theme.fg),
    $("primary-bg", theme.primary.bg),
    $("primary-fg", theme.primary.fg),
    $("error-bg", theme.error.bg),
    $("error-fg", theme.error.fg),

    $("padding", `${theme.padding}pt`),
    $("spacing", `${theme.spacing}pt`),
    $("radius", `${theme.radius}px`),
    $("transition", `${options.transition}ms`),

    $("widget-bg", `transparentize(${theme.widget.color}, ${theme.widget.opacity / 100})`),

    $("hover-bg", `transparentize(${theme.widget.color}, ${(theme.widget.opacity * 0.5) / 100})`),
    $("hover-fg", `lighten(${theme.fg}, 8%)`),

    $("border-width", `${theme.border.width}px`),
    $("border-color", `transparentize(${theme.border.color}, ${theme.border.opacity / 100})`),
    $("border", "$border-width solid $border-color"),

    $("popup-border-color", `transparentize(${theme.border.color}, ${Math.max(((theme.border.opacity - 1) / 100), 0)})`),
    $("popup-padding", `$padding * 1.6`),
    $("popup-radius", theme.radius === 0 ? "0" : "$radius + $popup-padding"),
];

async function resetCss() {
    if (!dependencies("sass", "fd"))
        return

    try {
        const varfile = `${TMP}/variables.scss`
        await Utils.writeFile(vars().join("\n"), varfile)

        const fd = await sh(`fd ".scss" ${App.configDir}`)
        const files = fd.split(/\s+/).map(f => `@import '${f}';`)
        const scss = [`@import '${varfile}';`, ...files].join("\n")
        const css = await bash`echo "${scss}" | sass --stdin`

        App.applyCss(css, true)
    } catch (error) {
        logError(error)
    }
}

Utils.monitorFile(App.configDir, resetCss)
await resetCss()
