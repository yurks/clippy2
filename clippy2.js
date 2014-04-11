(function (id) {
    if (!id) {
        return;
    }
    var w = window,
        d = w && w.document,
        c = w && w.clippyTextGetter,
        o, text;

    if (c && c.call && typeof c.call === 'function') {
        text = c.call(w, id);
    }
    if (text == null) {
        o = d && d.getElementById(id);
        text = o && o.getAttribute('clippy-text');
    }
    return text != null ? text + '' : '';
})
