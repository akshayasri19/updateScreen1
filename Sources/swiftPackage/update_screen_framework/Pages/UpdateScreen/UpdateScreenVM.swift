//
//  UpdateScreenVM.swift
//  update_screen_template_1
//
//  Created by Gopala Krishnan S on 18/01/24.
//

import Foundation
import UIKit
import Combine
import SwiftUI


final class UpdateScreenVM: UpdateScreenModel {
    override init() {
        do{
            super.init()
//            Create **AppVersionBO** object with the data and Set to the **appVersionBO**
            self.appVersionBO = AppVersionBO(appVersion: "6.2.4", date: "Jan 1, 2024", image: ImageLoader.loadImage()!, description: "Lorem ipsum dolor sit amet, consectetur adipiscing tra elit, sed do eiusmod tempor. Lorem ipsum dolor  amet tri consectetur adipiscing elit, sed do eiusmod tempor.", features: [
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor."
            ])
            
            CustomFontLoader.loadCustomFont(fontName: "Manrope-Bold")
            CustomFontLoader.loadCustomFont(fontName: "Manrope-Regular")
            CustomFontLoader.loadCustomFont(fontName: "Manrope-SemiBold")
            CustomFontLoader.loadCustomFont(fontName: "Manrope-Medium")
            
        }catch {
            // INVOKE **logException()** of Error class extension method using exception object of **error**
            error.logException()
        }
    }
    
    func NavigateToAppStore() {
        if let url = URL(string: "https://apps.apple.com/in/app/whatsapp-messenger/id310633997") {
                UIApplication.shared.open(url)
            }
    }
    func isUpdateClicked(){
        navUpdate = true
    }
    
//    func dismissUpdateScreen() {
//      UpdateScreenConfig.dismissUpdateScreen {
//        // Optional completion block to execute after dismissal animation
//        print("Update screen dismissed")
//      }
//    }
    

    
    
    
    
}
//
//@IBAction func backButtonPressed(_ sender: UIButton) {
//  navigationController?.popViewController(animated: true)
//}




//public protocol UpdateScreenDelegate: AnyObject {
//  func updateDismissed()
//}
//
//public class UpdateScreen {
//    
//    public static func presentUpdateScreen(updateView: UpdateScreenView, delegate: UpdateScreenDelegate) {
//        let hostingController = UIHostingController(rootView: updateView)
//        hostingController.presentationModeChanged = { [weak delegate] if $0.isDismissed {
//            delegate?.updateDismissed()
//        }
//            
//            UIApplication.shared.keyWindow?.rootViewController?.present(hostingController, animated: true)
//        }
//    }
//}
