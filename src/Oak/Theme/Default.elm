module Oak.Theme.Default exposing (button)

import Element exposing (Element, rgb255)
import Internal.Oak exposing (Theme, ThemeConfig, generateTheme)
import Oak exposing (ButtonProperty)
import Oak.Theme.Custom


themeConfig : ThemeConfig
themeConfig =
    { primaryColor = rgb255 24 144 255
    , primaryDarkerColor = rgb255 0 80 179
    , paddingVertical = 4
    , paddingHorizontal = 15
    , height = 40
    }


theme : Theme
theme =
    generateTheme themeConfig



-- BUTTON


button :
    List (ButtonProperty msg)
    ->
        { onPress : Maybe msg
        , label : Element msg
        }
    -> Element msg
button =
    Oak.Theme.Custom.button theme
