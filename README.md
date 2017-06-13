
Well, let's take care of the error, first.

```
The `main` value has an unsupported type.
I need Html, Svg, or a Program so I have something to render on screen, but you
gave me:
    String
```

Remember when we installed elm-lang/html? It's time to use it.

We'll import it and expose the `h1` function, which looks like this:

```
Html.h1 : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg﻿
```

In other words, it takes
  - a list of Html.Attribute 
  - a list of Html.Html 

and returns an Html.Html.

Let's ignore the `msg` for the moment.

We also need `text`, which is how we get any actual text into our html elements.
