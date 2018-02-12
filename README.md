# WKWebView bugs

A collection of sample projects related to WKWebView bugs discovered:

## #1) Position: fixed elements are incorrect depending on how the content inset is managed
When the content insets are controlled manually, `position: fixed` elements are not positioned correctly. We try to position a new overlay element using the existing elements `element.getBoundingClientRect()`. This new element is not positioned correctly, and can be confirmed visually and by comparing the `overlay.getBoundingClientRect()` to the `overly.style.top` value.

## #2) Scrolling (window.scrollTo()) is inaccurate depending on how the content inset is managed
When the content insets are adjusted automatically, scrolling from the DOM using `window.scrollTo()` doesn't work correctly. Scrolling to the top with `window.scrollTo(0, 0)` will fail to accurately position the page, the top will set below the nav bar.
