module Book exposing (main)

import Button exposing (buttonDocs)
import ElmBook exposing (withChapters, withThemeOptions)
import ElmBook.ElmUI exposing (Book, book)
import ElmBook.ThemeOptions exposing (routePrefix)


main : Book ()
main =
    book "FrameOak UI"
        |> withThemeOptions [ routePrefix "/frameoak-ui" ]
        |> withChapters [ buttonDocs ]
