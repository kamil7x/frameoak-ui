module Button exposing (..)

import Element exposing (text)
import ElmBook.Actions exposing (logAction)
import ElmBook.Chapter exposing (chapter, renderComponentList)
import ElmBook.ElmUI exposing (Chapter)
import Oak.Button
import Oak.Theme.Default as OakUi


buttonDocs : Chapter x
buttonDocs =
    chapter "Button"
        |> renderComponentList
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
