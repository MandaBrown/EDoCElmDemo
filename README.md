
We can subscribe to keyboard downs -- we tell the subscription what sort of message we want back, so we'll add a `KeyDown` type to our `EdocMsg`s.

We get an interesting error when we try to compile...

```
The definition of `edocDemoSubscription` does not match its type annotation.
The type annotation for `edocDemoSubscription` says it always returns:
    Sub EdocMsg
But the returned value (shown above) is a:
    (Keyboard.KeyCode -> EdocMsg) -> Sub EdocMsg
Hint: It looks like a function needs 1 more argument.
```
