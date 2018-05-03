#  WKWebView modal file dismissal bug

- WebKit Bug

When a `WKWebView` is presented in a modal and a file picker is displayed, taking any actions from within the file browser will result in the file browser modal being dismissed as well as the application modal. The expected result is only the file browser modal is dismissed.

The test app demonstrates this bug by providing a view controller that presents another view controller modally that contains the web view. Attempting to choose a file from that modal will result in the modal being automatically dismissed and unable to use the result of the file picking operation.

In this gif, you can see that when I choose "Cancel" or select a file from the file browser, the file browser modal is dismissed as well as my modal
![screenshot](https://github.com/zachwaugh/wkwebview-bugs/raw/master/Screenshots/modal-file-dismissal.gif)
