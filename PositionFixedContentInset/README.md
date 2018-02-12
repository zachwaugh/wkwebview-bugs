#  Position: fixed content inset bugs

- WebKit Bug - https://bugs.webkit.org/show_bug.cgi?id=182709

When a `WKWebView` is configured with `webView.scrollView.contentInsetAdjustmentBehavior = .never`, DOM elements using `position: fixed` are misplaced. This occurs even when the correct `contentInset` has been manually applied. When `webView.scrollView.contentInsetAdjustmentBehavior = .automatic` (or not changed), it works correctly. This applies when the web view sits beneath the nav/tab bars. It works correctly if the web view does not underlay nav/tab bars in either configuration. 

The test app demonstrates this bug by providing a test HTML page that will position a new overlay element on top on an existing element when tapped, using the existing elements `element.getBoundingClientRect()`. This new element is not positioned correctly, and can be confirmed visually since the rectangles aren't aligned and the numbers are wrong.

On the left, you can see the working version, and on the right the bug:

![screenshot](https://github.com/zachwaugh/wkwebview-bugs/raw/master/Screenshots/position-fixed-content-inset.png)
