
So program needs:
  - an initial tuple of a model and command (with some message type)
  - a function that takes the model and gives us a subscription (with some message type)
  - an update function that takes a message and the model, and gives us a new model and a command
  - and a view that takes the model and returns some html

Well, we have the view!

One down...

```
    { ...
    , init : ( String, Cmd msg )
    , subscriptions : String -> Sub msg
    , update : msg -> String -> ( String, Cmd msg )
    }
```
