//
//  UpdateScreenConfig.swift
//  update_screen_framework
//
//  Created by Gopala Krishnan S on 20/03/24.


import Foundation
import SwiftUI
import Combine



public class UpdateScreenConfig: UIViewController {
    
    internal static var passData: ((_ data : String) -> Void)?
    
    internal static var presentedHostingController: UIHostingController<UpdateScreen>?
    
    internal static var appViewController : UIViewController?
    internal static var method : (() -> Void)?
//    public init() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public static func checkUpdate(url : URL,method: @escaping () -> (), completion: @escaping (_ data : String) -> Void) {
        self.method = method
        print("-------------")
        print(url)
        print("---------------")
        
        let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "N/A"
        
        print(currentVersion)
        
        let jsonString = """
        {
          "versionNumber" : "2.8.10"
        }
        """
        
        guard let test = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        
        guard let window = test.windows.first else {
            print("Window is nil")
            return
        }
        
        // Retrieve the current view controller
        guard let currentViewController = window.rootViewController else {
            print("Current view controller is nil")
            return
        }
        
        appViewController = currentViewController
        
        // Create an instance of UpdateScreen
        let updateScreen = UpdateScreen()
        
        // Wrap the UpdateScreen view in a UIHostingController
        let hostingController = UIHostingController(rootView: updateScreen)
        hostingController.modalPresentationStyle = .fullScreen
        appViewController?.present(hostingController, animated: false, completion: {
            passData?("current version of application")
        })
        
        passData = completion
    }
    
    
    public static func dismissUpdateScreen() async {
        
        print("dismissed")
        
        if let optionalMethod = method {
            optionalMethod() // Call the optional method if it exists
            
        } else {
            print("Optional method is not set")
        }
//        DispatchQueue.global().async {
//            // Simulate some background task (replace with your actual logic)
//            sleep(0)
//        }
        await appViewController?.dismiss(animated: false, completion: {
            // Completion code after dismissal
            
            passData?("current version of application")
        })
  
        
    }
    

       
}





class SplashScreenViewController: UIViewController {

  @IBOutlet weak var updateButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Check for updates (implementation omitted)
    // If update available, updateButton.isHidden = false
  }

  @IBAction func updateButtonClicked(_ sender: UIButton) {
    presentUpdateScreen()
  }

  private func presentUpdateScreen() {
    let updateScreen = UpdateScreen() // Assuming UpdateScreen is a SwiftUI view
    let hostingController = UIHostingController(rootView: updateScreen)
    present(hostingController, animated: true)
  }
}



//public class UpdateScreenConfig {
//    internal static var presentedHostingController: UIHostingController<UpdateScreen>?
//    internal static var currentViewController = UIViewController()
//    public init() {
//       
//    }
//
//    public static func checkUpdate(completion: @escaping (String) -> Void) {
//        var version = 1
//        
//        pushToUpdateScreen()
//    }
//    
//    private static func pushToUpdateScreen(){
//        guard let window = UIApplication.shared.windows.first else {
//            print("Window is nil")
//            return
//        }
//
//        // Retrieve the current view controller
//        var currentViewController = window.rootViewController
//        if currentViewController == nil {
//            print("Current view controller is nil")
//            return
//        }
//        
//        self.currentViewController = currentViewController!
//
//        // Create an instance of UpdateScreen
//        let updateScreen = UpdateScreen()
//
//        // Wrap the UpdateScreen view in a UIHostingController
//        let hostingController = UIHostingController(rootView: updateScreen)
//
//        // Save the reference to the hosting controller
//        presentedHostingController = hostingController
//
//        // Check if the current view controller is a UINavigationController
//        if let navigationController = currentViewController as? UINavigationController {
//            // Push the hosting controller onto the navigation stack
//            navigationController.navigationBar.isHidden = true
//            navigationController.pushViewController(hostingController, animated: true)
//        } else {
//            // Current view controller is not a UINavigationController, so embed it in one
//            let navigationController = UINavigationController()
//            navigationController.navigationBar.isHidden = true
//            window.rootViewController = navigationController
//            navigationController.pushViewController(hostingController, animated: true)
//            
//        }
//    }
//
//    public static func dismissUpdateScreen() {
//        print("Dismissed")
//        guard let window = UIApplication.shared.windows.first else {
//            print("Window is nil")
//            return
//        }
//        window.rootViewController = currentViewController
//    }
//}






