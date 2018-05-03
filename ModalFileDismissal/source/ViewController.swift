import UIKit
import WebKit

class ViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Main View Controller"
        
        view.backgroundColor = .white
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Display Web View Modal", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24.0)
        button.addTarget(self, action: #selector(displayModal), for: .touchUpInside)
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func displayModal() {
        let webViewController = WebViewController()
        let navController = UINavigationController(rootViewController: webViewController)
        present(navController, animated: true)
    }
}

