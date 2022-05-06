module Internal.Button exposing
    ( ButtonType(..)
    , Property(..)
    , button
    , getAttributes
    )

import Element exposing (Attribute, Color, Element, height, mouseOver, paddingXY, px, rgba)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Internal.Oak exposing (Theme)



-- EXPOSED TYPES


type ButtonType
    = Solid
    | Outlined
    | Borderless


type Property msg
    = UiAttribute (Attribute msg)
    | Type ButtonType



-- EXPOSED FUNCTIONS


getAttributes : Theme -> List (Property msg) -> List (Attribute msg)
getAttributes theme properties =
    let
        config =
            makeConfigRecursive defaultConfig properties
    in
    mapConfigToAttributes theme config


button :
    Theme
    -> List (Property msg)
    ->
        { onPress : Maybe msg
        , label : Element msg
        }
    -> Element msg
button theme properties attrs =
    let
        attributes =
            getAttributes theme properties
    in
    Input.button attributes attrs



-- HELPERS


type alias Config msg =
    { buttonType : ButtonType
    , attributes : List (Attribute msg)
    }


defaultConfig : Config msg
defaultConfig =
    { buttonType = Outlined
    , attributes = []
    }


makeConfigRecursive : Config msg -> List (Property msg) -> Config msg
makeConfigRecursive initialConfig properties =
    case properties of
        [] ->
            initialConfig

        property :: remaining ->
            let
                config =
                    mapPropertyToConfig initialConfig property
            in
            makeConfigRecursive config remaining


mapPropertyToConfig : Config msg -> Property msg -> Config msg
mapPropertyToConfig config property =
    case property of
        UiAttribute attribute ->
            { config | attributes = config.attributes ++ [ attribute ] }

        Type buttonType ->
            { config | buttonType = buttonType }


mapConfigToAttributes : Theme -> Config msg -> List (Attribute msg)
mapConfigToAttributes theme config =
    let
        styles =
            { fontColor = getFontColor theme config
            , mouseOverFontColor = getMouseOverFontColor theme config
            , backgroundColor = getBackgroundColor theme config
            , mouseOverBackgroundColor = getMouseOverBackgroundColor theme config
            , borderColor = getBorderColor theme config
            , mouseOverBorderColor = getMouseOverBorderColor theme config
            }

        attributes =
            [ paddingXY theme.button.paddingHorizontal theme.button.paddingVertical
            , height (px theme.button.height)
            , Border.width 1
            , Border.color styles.borderColor
            , Background.color styles.backgroundColor
            , Font.color styles.fontColor
            , mouseOver
                [ Border.color styles.mouseOverBorderColor
                , Background.color styles.mouseOverBackgroundColor
                , Font.color styles.mouseOverFontColor
                ]
            ]
    in
    attributes ++ config.attributes



-- STYLE HELPERS


getFontColor : Theme -> Config msg -> Color
getFontColor theme config =
    case config.buttonType of
        Solid ->
            theme.button.solid.text

        Outlined ->
            theme.button.outlined.text

        Borderless ->
            theme.button.borderless.text


getMouseOverFontColor : Theme -> Config msg -> Color
getMouseOverFontColor theme config =
    case config.buttonType of
        Solid ->
            theme.button.solid.mouseOverText

        Outlined ->
            theme.button.outlined.mouseOverText

        Borderless ->
            theme.button.borderless.mouseOverText


getBackgroundColor : Theme -> Config msg -> Color
getBackgroundColor theme config =
    case config.buttonType of
        Solid ->
            theme.button.solid.background

        Outlined ->
            theme.button.outlined.background

        Borderless ->
            theme.button.borderless.background


getMouseOverBackgroundColor : Theme -> Config msg -> Color
getMouseOverBackgroundColor theme config =
    case config.buttonType of
        Solid ->
            theme.button.solid.mouseOverBackground

        Outlined ->
            theme.button.outlined.mouseOverBackground

        Borderless ->
            theme.button.borderless.mouseOverBackground


getBorderColor : Theme -> Config msg -> Color
getBorderColor theme config =
    case config.buttonType of
        Solid ->
            theme.button.solid.border

        Outlined ->
            theme.button.outlined.border

        Borderless ->
            rgba 0 0 0 0


getMouseOverBorderColor : Theme -> Config msg -> Color
getMouseOverBorderColor theme config =
    case config.buttonType of
        Solid ->
            theme.button.solid.mouseOverBorder

        Outlined ->
            theme.button.outlined.mouseOverBorder

        Borderless ->
            rgba 0 0 0 0
