//
//  CarouselBO.swift
//  Onboard_template_4_a
//
//  Created by Gopala Krishnan S on 17/01/24.
//

import Foundation
import UIKit

struct AppVersionBO: Identifiable {
    var id: UUID = UUID()
    var appVersion: String
    var date: String
    var image: ImageResource
    var description: String
    var features: [String]
}
