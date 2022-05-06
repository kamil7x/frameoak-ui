module Oak.Button exposing (..)

import Element exposing (Attribute)
import Internal.Button exposing (ButtonType(..), Property(..))


solid : Property msg
solid =
    Type Solid


outlined : Property msg
outlined =
    Type Outlined


borderless : Property msg
borderless =
    Type Borderless


attr : Attribute msg -> Property msg
attr attribute =
    UiAttribute attribute
