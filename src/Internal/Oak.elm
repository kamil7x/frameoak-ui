module Internal.Oak exposing (..)

import Element exposing (Color, rgb255)



-- THEME


type alias ThemeConfig =
    { height : Int
    , paddingHorizontal : Int
    , paddingVertical : Int
    , primaryColor : Color
    , primaryDarkerColor : Color
    }


type alias Theme =
    { primaryColor : Color
    , button :
        { height : Int
        , paddingHorizontal : Int
        , paddingVertical : Int
        , solid :
            { background : Color
            , mouseOverBackground : Color
            , text : Color
            , mouseOverText : Color
            , border : Color
            , mouseOverBorder : Color
            }
        , outlined :
            { background : Color
            , mouseOverBackground : Color
            , text : Color
            , mouseOverText : Color
            , border : Color
            , mouseOverBorder : Color
            }
        , borderless :
            { background : Color
            , mouseOverBackground : Color
            , text : Color
            , mouseOverText : Color
            }
        }
    }


generateTheme : ThemeConfig -> Theme
generateTheme config =
    { primaryColor = config.primaryColor
    , button =
        { height = config.height
        , paddingHorizontal = config.paddingHorizontal
        , paddingVertical = config.paddingVertical
        , solid =
            { background = config.primaryColor
            , mouseOverBackground = config.primaryDarkerColor
            , text = rgb255 255 255 255
            , mouseOverText = rgb255 255 255 255
            , border = config.primaryColor
            , mouseOverBorder = config.primaryDarkerColor
            }
        , outlined =
            { background = rgb255 255 255 255
            , mouseOverBackground = rgb255 255 255 255
            , text = config.primaryColor
            , mouseOverText = config.primaryDarkerColor
            , border = config.primaryColor
            , mouseOverBorder = config.primaryDarkerColor
            }
        , borderless =
            { background = rgb255 255 255 255
            , mouseOverBackground = rgb255 245 245 245
            , text = rgb255 0 0 0
            , mouseOverText = config.primaryColor
            }
        }
    }
