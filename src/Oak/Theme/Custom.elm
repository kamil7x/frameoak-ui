module Oak.Theme.Custom exposing (..)

import Element exposing (Element)
import Internal.Button
import Internal.Oak exposing (Theme, ThemeConfig)
import Oak exposing (ButtonProperty)



-- BUTTON


button :
    Theme
    -> List (ButtonProperty msg)
    -> { onPress : Maybe msg, label : Element msg }
    -> Element msg
button theme =
    Internal.Button.button theme
