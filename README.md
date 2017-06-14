
Let's start a server with live reload:

```bash
elm live Main.elm --output=elm.js
```

We could also use this to generate an html page, if we still wanted to do that. Take a look at `index.html` -- these are the magic lines that embed our elm app in our page:

```html
<div id="app"></div>

<script src="elm.js"></script>
<script>Elm.Main.embed(document.getElementById("app"));</script>
```

Try editing the text and watching it update in real time!
