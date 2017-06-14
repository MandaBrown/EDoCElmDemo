
Elm is saying that update should be a function that takes a msg (of some type) and a String (hey, like our model!) and returns a tuple of (String, Cmd msg) (where have we seen that before?).

We don't have anything to update yet, so we could fix this with an anonymous function that doesn't do anything:

```elm
\_ _ -> (edocDemoModel, Cmd.none)
```

We could do the same for subscriptions, which take a String and return a Sub:

```elm
\_ -> Sub.none
```
