
If we want this to actually *do* anything, we have to have Elm manage all of the side effects for us.

For a web component, we can use `Html.program` to handle all the behind-the-scenes stuff that we need to update our model and view as things happen.

Of course, this doesn't compile, but maybe the compiler can help us figure out what we actually need to give it to hook everything up...

```
The definition of `main` does not match its type annotation.
The type annotation for `main` says it is a:
    Html.Html msg
But the definition (shown above) is a:
    { init : ( model, Cmd msg )
    , subscriptions : model -> Sub msg
    , update : msg -> model -> ( model, Cmd msg )
    , view : model -> Html.Html msg
    }
    -> Program Never model msg
Hint: It looks like a function needs 1 more argument.
```
