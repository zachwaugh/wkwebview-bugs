#  WKWebView content inset bugs

- WebKit Bug Report - https://bugs.webkit.org/show_bug.cgi?id=182710

Depending on the iOS version and how the scroll view's content insets are managed, calling `window.scrollTo()` from the DOM may not work correctly. The included sample project demonstrates all the various combinations to test which work and which fail.

## On iOS 11.2 and earlier (the original bug report)
When a WKWebView's scrollView's contentInsets are adjusted automatically (`contentInsetAdjustmentBehavior = .automatic`, which is the default behavior on iOS 11, scrolling from the DOM using `window.scrollTo()` doesn't work correctly. A call `window.scrollTo(0, 0)` will not scroll the page all the way to the top, but leaves part of the content sitting beneath the navigation bar. When the `contentInsetAdjustmentBehavior = .never` and the contentInsets are set manually, it scrolls to the correct position. This issue is present when the web view sits beneath the nav bar/tab bar, but not otherwise.


## On iOS 11.3 and 11.4
This bug appears to have been fixed in 11.3. Testing in 11.3 and 11.4, everything works correctly for all configurations.

## On iOS 12
When a WKWebView's scrollView's contentInsets are adjusted automatically, `window.scrollTo()` works correctly. When `contentInsetAdjustmentBehavior = .never`, a call `window.scrollTo(0, 0)` will not scroll the page all the way to the top, but leaves part of the content sitting beneath the navigation bar. This issue is present when the web view sits beneath the nav bar/tab bar, but not otherwise. 

On the left, you can see the broken behavior after scrolling all the way to the top. On the right, you can see where it should have scrolled:
![screenshot](https://github.com/zachwaugh/wkwebview-bugs/raw/master/Screenshots/scroll-to-content-inset.png)
