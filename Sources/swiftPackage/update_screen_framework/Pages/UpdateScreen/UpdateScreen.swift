//
//  UpdateScreen.swift
//  update_screen_template_1
//
//  Created by Gopala Krishnan S on 18/01/24.
//

import SwiftUI


public struct UpdateScreen: View {
//    @Binding var isActive: Bool
    @StateObject private var updateScreenVM: UpdateScreenVM = UpdateScreenVM()
    @Environment(\.presentationMode) var presentationMode
    
    public init() {
        
    }
    
    public var body: some View {
        NavigationStack{
            ZStack {
                VStack(alignment: .leading,spacing: 5) {
                    // MARK: Add title
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.backward.2")
                            .onTapGesture {
                                Task{
                                    await UpdateScreenConfig.dismissUpdateScreen()
                                    
                                }
                            }
                        Text("What’s")
                            .foregroundStyle(.secondaryDark)
                        Text("New")
                            .foregroundStyle(.accent2)
                            .font(.custom(Styles.fontStyles.manropeBold,size: Styles.fontStyles.h1))
                        
                    }
                    .font(.custom("Manrope-Bold",size: Styles.fontStyles.h1))
                    
                    
                    HStack {
                        Text("App Version :")
                        Text("\(updateScreenVM.appVersionBO.appVersion)")
                        Circle()
                            .frame(height: 5)
                        Text("\(updateScreenVM.appVersionBO.date)")
                    }
                    .foregroundStyle(.textSecondary)
                    .font(.custom("Manrope-Regular",size: Styles.fontStyles.linkText))
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading){
                            // MARK: Add Image
                            Image(updateScreenVM.appVersionBO.image)
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: Dimension.height(input: 146).equivalentValue)
                                .padding(.top, 30)
                            
                            // MARK: Add description
                            Text("\(updateScreenVM.appVersionBO.description)")
                                .font(.custom("Manrope-Regular",size: Styles.fontStyles.body1))
                                .foregroundStyle(.textSecondary)
                                .lineSpacing(5)
                                .padding(.top)
                            
                            
                            HStack(spacing: 5) {
                                Text("New")
                                    .font(.custom("Manrope-SemiBold",size: Styles.fontStyles.subtitle1))
                                    .foregroundStyle(.secondaryLight)
                                
                                Text("Features")
                                    .font(.custom("Manrope-SemiBold",size: Styles.fontStyles.subtitle1))
                                    .foregroundStyle(.accent2)
                                Spacer()
                            }
                            .padding(.top,30)
                            Spacer()
                            
                            // MARK: Add features
                            VStack(spacing: 15){
                                ForEach(updateScreenVM.appVersionBO.features, id: \.self){ feature in
                                    HStack(alignment: .top) {
                                        Circle()
                                            .frame(height: 5)
                                            .padding(.top, 8)
                                        
                                        Text(feature)
                                            .font(.custom("Manrope-Regular",size: Styles.fontStyles.body))
                                            .lineSpacing(5)
                                        Spacer()
                                    }  .foregroundStyle(.textSecondary)
                                    
                                }
                            }.padding(.vertical)
                        }
                    }
                    
                    Spacer()
                    
                    // MARK: Add Button
                    Button {
                        updateScreenVM.isUpdateClicked()
                        //                    updateScreenVM.NavigateToAppStore()
                    } label: {
                        Text("Update")
                            .frame(maxWidth: .infinity)
                            .frame(height: Styles.buttonStyles.buttonHeight)
                            .font(.custom("Manrope-SemiBold",size: Styles.fontStyles.body1))
                            .background(.secondaryLight)
                            .foregroundColor(.textLight)
                            .cornerRadius(Styles.buttonStyles.buttonCornerRadius)
                    }
                    
                    Spacer()
                    
                }.padding(.top)
                    .padding(.horizontal, 20)
            }
            .background(.white)
            .navigationDestination(isPresented: $updateScreenVM.navUpdate) {
                PopupScreen()
            }
        }
    }
}

#Preview {
    UpdateScreen()
}


//struct MyView: View {
//    var prop: Bool = false
//    var body: some View {
//        if prop {
//            UpdateScreen(isActive: prop)
//        } else {
//            HomeScreen()
//        }
//        
//    }
//}
