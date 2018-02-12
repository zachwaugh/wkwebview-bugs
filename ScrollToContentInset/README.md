#  WKWebView content inset bugs

As of iOS 11, WKWebView's scrollView's contentInsets can be adjusted automatically by iOS or manually. No matter
which you choose, something breaks with respects to various DOM APIs related to scrolling.

When the content insets are adjusted automatically, scrolling from the DOM using `window.scrollTo()` doesn't work correctly. In the test app in tab 1, you can scroll to the bottom and hit the "Scroll to top" button, which calls `window.scrollTo(0, 0)`. The `h1` should be at the top of the viewport, but it sits beneath the nav bar. This same action works correctly in tab 2, which has manual adjustments.


This issue is present when the web view sits beneath the nav bar, but not otherwise.


On the left, you can see the broken behavior after scrolling all the way to the top. On the right, you can see where it should have scrolled:
![screenshot](https://github.com/zachwaugh/wkwebview-bugs/raw/master/Screenshots/scroll-to-content-inset.png)
