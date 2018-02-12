#  Position: fixed content inset bugs

As of iOS 11, WKWebView's scrollView's contentInsets can be adjusted automatically by iOS or manually. No matter
which you choose, something breaks with respects to various DOM APIs related to positioning.

When the content insets are controlled manually, `position: fixed` elements are not positioned correctly. We try to position a new overlay element using the existing elements `element.getBoundingClientRect()`. This new element is not positioned correctly, and can be confirmed visually and by comparing the `overlay.getBoundingClientRect()` to the `overly.style.top`.

This bug is only present when the web view sits beneath the nav bar/tab bar, but not otherwise.
