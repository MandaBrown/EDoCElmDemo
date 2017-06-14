
We have a couple of choices here: we can handle the (Keyboard.KeyCode -> EdocMsg) in the subscription or in the update. 

Since we picked a generic message (`KeyDown`) to pass into our update, it makes sense to have that type that carries along the keycode information with it. 

Adding that to the `KeyDown` message means we now have a constructor available for that message that takes one argument - the keycode. That's what `Keyboard.downs` needs -- something that takes a keycode and returns an EdocMsg, so let's provide the `KeyDown` constructor as the argument to `Keyboard.downs`
