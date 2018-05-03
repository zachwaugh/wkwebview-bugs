import UIKit
import WebKit

class WebViewController: UIViewController {
    init() {
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
        
        title = "Modal Web View"
        setupViews()
        loadPage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    lazy var webView: WKWebView = {
        let wv = WKWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        return wv
    }()
}


