//
//  AppConstants.swift
//  Onboard_template_4_a
//
//  Created by Gopala Krishnan S on 17/01/24.
//


import Foundation
import SwiftUI
import UIKit
import CoreGraphics
import CoreText

/*
 Create a public enum for FontStyles
 */
public enum FontStyles {
    public static let h1: CGFloat = 24
    public static let subtitle1: CGFloat = 18
    public static let body1: CGFloat = 16
    public static let body: CGFloat = 14
    public static let linkText: CGFloat = 12
    public static let manropeBold: String = "Manrope-Bold"
    public static let manropeSemiBold: String = "Manrope-SemiBold"
    public  static let manropeRegular: String = "Manrope-Regular"
    public static let manropeMedium: String = "Manrope-Medium"
}

/*
 Create a public enum for ButtonStyles
 */

enum ButtonStyles {
    static let buttonCornerRadius: CGFloat = 8
    static let buttonHeight: CGFloat = 50
}

/*
 Create a public enum for ColorStyles
 */
enum ColorStyles {
    static let primaryColor: String = "primaryColor"
    static let primaryDark: String = "primaryDark"
    static let primaryLight: String = "primaryLight"
    static let secondaryColor: String = "secondaryColor"
    static let secondaryDark: String = "secondaryDark"
    static let secondaryLight: String = "secondaryLight"
    static let accent1: String = "accent1"
    static let accent2: String = "accent2"
    static let neturalDark: String = "neturalDark"
    static let neturalLight: String = "neturalLight"
    static let neturalMedium: String = "neturalMedium"
    static let error: String = "error"
    static let success: String = "success"
    static let warning: String = "warning"
    static let textPrimary: String = "textPrimary"
    static let textSecondary: String = "textSecondary"
    static let textLight: String = "textLight"
    static let backgroundPrimary: String = "backgroundPrimary"
    static let backgroundSecondary: String = "backgroundSecondary"
    static let backgroundTertiary: String = "backgroundTertiary"
    static let titleText: String = "titleText"
    static let background: String = "background"
//    static let titleText: String = "titleText"
    

}

/*
 Create a public enum for Styles
 */
enum Styles{
    static let colorStyles = ColorStyles.self
    static let fontStyles = FontStyles.self
    static let buttonStyles = ButtonStyles.self
    
}

public class ImageLoader {
    public static func loadImage() -> UIImage? {
        let frameworkBundle = Bundle(for: ImageLoader.self)
        print(frameworkBundle)
//        let frameworkBundle = Bundle(identifier: "myTeam.CustomFramework")
        guard let imageUrl = frameworkBundle.url(forResource: "icon", withExtension: "png"),
              let imageData = try? Data(contentsOf: imageUrl),
              let image = UIImage(data: imageData) else {
            let img = UIImage(systemName: "chevron.right")
            return img
        }
        
        return image
    }
}

public class CustomFontLoader {
    public static func loadCustomFont(fontName: String) -> String {
        // Replace "YourCustomFontFileName" with the actual filename of your custom font
        if let fontUrl = Bundle(for: CustomFontLoader.self).url(forResource: fontName, withExtension: "ttf"),
           let fontData = try? Data(contentsOf: fontUrl) as CFData,
           let provider = CGDataProvider(data: fontData),
           let font = CGFont(provider) {
            var error: Unmanaged<CFError>?
            if !CTFontManagerRegisterGraphicsFont(font, &error) {
                let errorDescription = CFErrorCopyDescription(error!.takeUnretainedValue())
                print("Failed to load font: \(String(describing: errorDescription))")
            } else {
                print("Custom font loaded successfully")
            }
        } else {
            print("Font file not found or unable to load")
        }
        
        return fontName
    }
}



public extension Image {
    static var yourImage: Image { .init( .icon as ImageResource) }

init(_ image: Image) {
        self = image
    }
}



public extension Color {

    static var accent1: Color { .init(.accent1)}
    static var accent2: Color { .init(.accent2)}
    static var background: Color { .init(.background)}
    static var backgroundPrimary: Color { .init(.backgroundPrimary)}
    static var backgroundSecondary: Color { .init(.backgroundSecondary)}
    static var backgroundTertiary: Color { .init(.backgroundTertiary)}
    static var error: Color { .init(.error)}
    static var GR: Color { .init(.GR)}
    static var neturalDark: Color { .init(.neturalDark)}
    static var neturalLight: Color { .init(.neturalLight)}
    static var neturalMedium: Color { .init(.neturalMedium)}
    static var primaryLight: Color { .init(.primaryLight)}
    static var primaryDark: Color { .init(.primaryDark)}
    static var secondaryLight: Color { .init(.secondaryLight)}
    static var secondaryDark: Color { .init(.secondaryDark) }
    static var success: Color { .init(.success) }
    static var textLight: Color { .init(.textLight) }
    static var textPrimary: Color { .init(.textPrimary) }
    static var textSecondary: Color { .init(.textSecondary) }
    static var warning: Color { .init(.warning) }
}

public extension ShapeStyle where Self == Color {

    static var accent1: SwiftUI.Color { .init(.accent1)}
    static var accent2: SwiftUI.Color { .init(.accent2)}
    static var background: SwiftUI.Color { .init(.background)}
    static var backgroundPrimary: SwiftUI.Color { .init(.backgroundPrimary)}
    static var backgroundSecondary: SwiftUI.Color { .init(.backgroundSecondary)}
    static var backgroundTertiary: SwiftUI.Color { .init(.backgroundTertiary)}
    static var error: SwiftUI.Color { .init(.error)}
    static var GR: SwiftUI.Color { .init(.GR)}
    static var neturalDark: SwiftUI.Color { .init(.neturalDark)}
    static var neturalLight: SwiftUI.Color { .init(.neturalLight)}
    static var neturalMedium: SwiftUI.Color { .init(.neturalMedium)}
    static var primaryLight: SwiftUI.Color { .init(.primaryLight)}
    static var primaryDark: SwiftUI.Color { .init(.primaryDark)}
    static var secondaryLight: SwiftUI.Color { .init(.secondaryLight)}
static var secondaryDark: SwiftUI.Color { .init(.secondaryDark) }
    static var success: SwiftUI.Color { .init(.success) }
    static var textLight: SwiftUI.Color { .init(.textLight) }
    static var textPrimary: SwiftUI.Color { .init(.textPrimary) }
    static var textSecondary: SwiftUI.Color { .init(.textSecondary) }
    static var warning: SwiftUI.Color { .init(.warning) }
}






public enum FontError: Swift.Error {
   case failedToRegisterFont
}

func registerFont(named name: String) throws {
   guard let asset = NSDataAsset(name: "Fonts/\(name)", bundle: Bundle.module),
      let provider = CGDataProvider(data: asset.data as NSData),
      let font = CGFont(provider),
      CTFontManagerRegisterGraphicsFont(font, nil) else {
    throw FontError.failedToRegisterFont
   }
}

