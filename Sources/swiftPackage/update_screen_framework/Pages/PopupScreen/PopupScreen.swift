//
//  PopupScreen.swift
//  update_screen_framework
//
//  Created by Akshaya sri A on 15/03/24.
//

import SwiftUI

public struct PopupScreen: View {
    @StateObject var popupScreenVM: PopupScreenVM = PopupScreenVM()
   public var body: some View {
       VStack{
           Text("Hello popup screen")
               .onTapGesture {
//                   UpdateScreenConfig.dismissUpdateScreen()
               }
       }
    }
}
