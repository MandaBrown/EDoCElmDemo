
Init is a tuple with a model and a command. The model is easy - let's plug in the model that we've been using so far.

What about the command though? 

Commands are a way to tell Elm, "Hey, I want to do this thing!" -- useful for things like sending Http requests. Every command specifies which effect you want and the type of message that will come back into your application when it is complete.

We don't have any commands yet though, so we'll just use the handy Cmd.none from [Platform.Cmd](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Platform-Cmd) in the core library.

2 more pieces to go:
```
    { ...
    , subscriptions : String -> Sub msg
    , update : msg -> String -> ( String, Cmd msg )
    }
```
