
That's all very exciting, but we know that we're going to want the text on the page to change, which means we shouldn't have it hard coded inside some html.

Elm is very declarative - you want your html functions to look very much like regular html. You're only using them to describe how you want the data to look.

Let's extract our text into `edocDemoModel`. It, like `main` is a function that doesn't take any inputs... or really just like a variable!
