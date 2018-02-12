import UIKit
import WebKit

enum Mode {
    case autoUnderlay
    case manualUnderlay
    case auto
    case manual
}

class ViewController: UIViewController {
    let mode: Mode
    
    init(mode: Mode) {
        self.mode = mode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadPage() {
        guard let url = Bundle.main.url(forResource: "test", withExtension: "html") else { return }
        webView.loadFileURL(url, allowingReadAccessTo: url)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadPage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateContentInsetsIfNeeded()
    }
    
    private func updateContentInsetsIfNeeded() {
        guard mode == .manualUnderlay else { return }
        
        webView.scrollView.contentInset = contentInsets()
        webView.scrollView.scrollIndicatorInsets = contentInsets()
    }
    
    private func contentInsets() -> UIEdgeInsets {
        var insets = UIEdgeInsets.zero
        insets.top = view.safeAreaInsets.top
        insets.bottom = view.safeAreaInsets.bottom
        return insets
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(webView)
        
        var constraints: [NSLayoutConstraint] = [
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ]
        
        if mode == .manualUnderlay || mode == .autoUnderlay {
            constraints += [
                webView.topAnchor.constraint(equalTo: view.topAnchor),
                webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        } else {
            constraints += [
                webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ]
        }
        
        NSLayoutConstraint.activate(constraints)
    }

    lazy var webView: WKWebView = {
        let wv = WKWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        
        if mode == .manual || mode == .manualUnderlay {
            // By default, the scrollView will have `contentInsetAdjustmentBehavior = .automatic` on iOS 11
            wv.scrollView.contentInsetAdjustmentBehavior = .never
            
            if mode == .manual {
                wv.scrollView.contentInset = contentInsets()
                wv.scrollView.scrollIndicatorInsets = contentInsets()
            }
        }
        
        return wv
    }()
}

