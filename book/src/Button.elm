module Button exposing (..)

import Element exposing (..)
import ElmBook.Actions exposing (logAction)
import ElmBook.Chapter exposing (chapter, render, withComponentList)
import ElmBook.ElmUI exposing (Chapter)
import Oak.Button
import Oak.Theme.Default as OakUi


buttonDocs : Chapter x
buttonDocs =
    chapter "Button"
        |> withComponentList
            [ ( "Default"
              , OakUi.button []
                    { label = text "Button is Outlined by default"
                    , onPress = Just (logAction "Default clicked")
                    }
              )
            , ( "Solid"
              , OakUi.button [ Oak.Button.solid ]
                    { label = text "Solid"
                    , onPress = Just (logAction "Solid clicked")
                    }
              )
            , ( "Outlined"
              , OakUi.button [ Oak.Button.outlined ]
                    { label = text "Outlined"
                    , onPress = Just (logAction "Outlined clicked")
                    }
              )
            , ( "Borderless"
              , OakUi.button [ Oak.Button.borderless ]
                    { label = text "Borderless"
                    , onPress = Just (logAction "Borderless clicked")
                    }
              )
            ]
        |> render """
```
import Element exposing (..)
import Oak.Button
import Oak.Theme.Default as OakUi
```
<component with-label="Default" />
```
OakUi.button []
    { label = text "Button is Outlined by default"
    , onPress = Just (logAction "Default clicked")
    }
```
<component with-label="Solid" />
```
OakUi.button [ Oak.Button.solid ]
    { label = text "Solid"
    , onPress = Just (logAction "Solid clicked")
    }
```
<component with-label="Outlined" />
```
OakUi.Default.button [ Oak.Button.outlined ]
    { label = text "Outlined"
    , onPress = Just (logAction "Outlined clicked")
    }
```
<component with-label="Borderless" />
```
OakUi.button [ Oak.Button.borderless ]
    { label = text "Borderless"
    , onPress = Just (logAction "Borderless clicked")
    }
```
"""
