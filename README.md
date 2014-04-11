# Clippy2 - Copy text to your clipboard

[Clippy2](https://github.com/yurks/clippy2) is a very simple Flash widget that makes it possible to place arbitrary
text onto the client's clipboard. Clippy2 could be looks like:

![Clippy2 in action](http://i62.tinypic.com/so4gt0.jpg)

This is a refactored fork of [Clippy](https://github.com/mojombo/clippy)
with enhanced functionality:

* Passing the text to copy via HTML-attribute (which could be modified anytime you want),
instead of as a flashvar (which passed into Flash only once on loading).
This allows to use Clippy2 with frameworks like [AngularJS](http://angularjs.org/).

* Added possibility to copy text by calling a JavaScript callback `window.clippyTextGetter()`
This allows for increased flexibility in retrieving the data to copy,
e.g. if the text to be clipped is lengthy.


# Usage

[Download](https://github.com/yurks/clippy2/releases/latest) latest stable release, unzip and put it
to your `public` directory or wherever your static assets can be found. Then use it in your project
depending on cases described below.

## Copying text from DOM attribute

Here is a sample HTML snippet that can be used to place Clippy2 button on a page:

```html
<object clippy-text="{text-to-copy}" id="clippy-id" height="14" width="14" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000">
    <param name="movie" value="path/to/clippy2.swf">
    <param name="allowScriptAccess" value="always">
    <param name="quality" value="high">
    <param name="scale" value="exactfit">
    <param name="wmode" value="transparent">
    <embed name="clippy-id" src="path/to/clippy2.swf" height="14" width="14" allowscriptaccess="always" quality="high" scale="exactfit" wmode="transparent" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash">
</object>
```

Use `clippy-text` attribute for placing text to copy. This attribute could be changed anytime you want
with plain javascript `document.getElementById('clippy-id').setAttribute('clippy-text', 'New text to copy')`
or jQuery `$('#clippy-id').attr('clippy-text', 'New text to copy')`

___Make sure___ that you have the same values for id-attribute in <object> tag and name-attribute in <embed> tag.

___Remember___ that id-attribute should be unique across page. So, in case you use several Clippy2 buttons on page, take care for this.


## Copying text with JavaScript callback

In case `window.clippyTextGetter()` function is defined, it will be called with clicked Flash object id as argument.

```javascript
window.clippyTextGetter = function(id) {
    // Determining which button was clicked.
    if (id === 'clippy-id-1') {
        // Returned text will be copied to clipboard
        return 'text-to-copy-for-specified-button'
    }
    // Empty string will be copied to clopboard (clearing buffer)
    return '';

    // DOM object could be accessed.
    var obj = document.getElementById(id);

    // Clippy2 will act by default, as if clippyTextGetter() was not defined
    return null;
    return undefined;
}
```

# Compiling

In order to compile Clippy2 from source, you need to install the [haXe 3](http://haxe.org/).

The haXe code is in `clippy2.hx`, the button images are in `assets`,
javascript code executing on button click is in `clippy2.js`
and the compiler config is in `clippy2.hxml`. Make sure you look at all of these to
see where and what you'll need to modify. To compile everything into a final
SWF, run the following from Clippy2 root directory:

    > haxe clippy2.hxml

If that is successful, use compiled `clippy2.swf`.


# License

[LICENSE (MIT)](LICENSE)