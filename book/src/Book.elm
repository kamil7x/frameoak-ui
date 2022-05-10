module Book exposing (main)

import Button exposing (buttonDocs)
import ElmBook exposing (withChapters)
import ElmBook.ElmUI exposing (Book, book)


main : Book ()
main =
    book "FrameOak UI"
        |> withChapters [ buttonDocs ]
