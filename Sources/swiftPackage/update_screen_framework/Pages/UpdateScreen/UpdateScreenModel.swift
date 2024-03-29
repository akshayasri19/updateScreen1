//
//  UpdateScreenModel.swift
//  update_screen_template_1
//
//  Created by Gopala Krishnan S on 18/01/24.
//

import Foundation


class UpdateScreenModel: ObservableObject {
    @Published var appVersionBO = AppVersionBO(appVersion: "", date: "", image: ImageLoader.loadImage()!, description: "", features: [])
    @Published var navUpdate: Bool = Bool.init()
}
