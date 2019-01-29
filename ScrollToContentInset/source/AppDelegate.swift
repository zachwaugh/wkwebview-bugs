import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewController1 = ViewController(mode: .autoUnderlay)
        viewController1.title = "Auto / Underlay"
        let navController1 = UINavigationController(rootViewController: viewController1)

        let viewController2 = ViewController(mode: .manualUnderlay)
        viewController2.title = "Manual / Underlay"
        let navController2 = UINavigationController(rootViewController: viewController2)

        let viewController3 = ViewController(mode: .auto)
        viewController3.title = "Auto / No Underlay"
        let navController3 = UINavigationController(rootViewController: viewController3)
        navController3.navigationBar.isTranslucent = false
        
        let viewController4 = ViewController(mode: .manual)
        viewController4.title = "Manual / No Underlay"
        let navController4 = UINavigationController(rootViewController: viewController4)
        navController4.navigationBar.isTranslucent = false

        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navController1, navController2, navController3, navController4]
        
        window?.rootViewController = tabBarController
    
        return true
    }
}

