#  WKWebView modal file dismissal bug

- WebKit Bug - https://bugs.webkit.org/show_bug.cgi?id=185257

When a `WKWebView` is presented in a modal and a file picker is displayed, taking any actions from within the file browser will result in the file browser modal being dismissed as well as the application modal. The expected result is only the file browser modal is dismissed.

The test app demonstrates this bug by providing a view controller that presents another view controller modally that contains the web view. Attempting to choose a file from that modal will result in the modal being automatically dismissed and unable to use the result of the file picking operation.

## To Reproduce
1. Present a UIViewController containing a WKWebView modally
2. The WKWebView should have an <input type="file"> element.
3. Click the "Choose File" button
4. Choose "Browse" from the action sheet that is displayed
5. iOS will present the file browser modally
6. When the file browser modal is displayed, either choose "Cancel" in the top-right or select a file
7. Upon either of those actions, the file browser modal will be dismissed as well as this application modal that contains the web view
8. The expected behavior is only the file browser modal is dismissed and the application modal remains

In this gif, you can see that when I choose "Cancel" or select a file from the file browser, the file browser modal is dismissed as well as my modal
![screenshot](https://github.com/zachwaugh/wkwebview-bugs/raw/master/Screenshots/modal-file-dismissal.gif)
