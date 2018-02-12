#  WKWebView content inset bugs

- WebKit Bug Report - https://bugs.webkit.org/show_bug.cgi?id=182710

When a WKWebView's scrollView's contentInsets are adjusted automatically, which is the default behavior on iOS 11, scrolling from the DOM using `window.scrollTo()` doesn't work correctly. A call `window.scrollTo(0, 0)` will not scroll the page all the way to the top, but leaves part of the content sitting beneath the navigation bar. When the `contentInsetAdjustmentBehavior = .never` and the contentInsets are set manually, it scrolls to the correct position.This issue is present when the web view sits beneath the nav bar/tab bar, but not otherwise. The included sample project demonstrates the bug and the correct behavior.

On the left, you can see the broken behavior after scrolling all the way to the top. On the right, you can see where it should have scrolled:
![screenshot](https://github.com/zachwaugh/wkwebview-bugs/raw/master/Screenshots/scroll-to-content-inset.png)
