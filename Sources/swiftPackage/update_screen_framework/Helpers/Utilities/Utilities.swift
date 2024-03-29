//
//  Utilities.swift
//  Onboard_template_4_a
//
//  Created by Gopala Krishnan S on 17/01/24.
//

import Foundation
import SwiftUI

extension Error {
    /*
     Function to handle the Exception
     This method uses the [Exception] object and handle the error
     */
    func logException() {
        do {
            // Logs the Exception message in the console
            print(localizedDescription)
        } catch {
            // Logs the Exception message in the console
            print(localizedDescription)
        }
    }
}


public enum Dimension {
    // Define base width and height values for reference
   public static let baseWidth: CGFloat = 430
   public static let baseHeight: CGFloat = 932
    
    // Enumeration cases representing either width, height, or font size with corresponding input values.
    case width(input: CGFloat)
    case height(input: CGFloat)
    case fontSize(input: CGFloat)

    // Computed property to calculate and return the equivalent dimension value based on the input and screen size.
    public var equivalentValue: CGFloat {

        switch self {
        // If the dimension is width, calculate the equivalent width value.
        case .width(input: let inputValue):
            // Define a reference width, perform the calculation, and return the result.
            var referenceWidth: CGFloat = Dimension.baseWidth
            referenceWidth = (inputValue / referenceWidth)
            return (referenceWidth * UIScreen.main.bounds.width)

        // If the dimension is height, calculate the equivalent height value.
        case .height(input: let inputValue):
            // Define a reference height, perform the calculation, and return the result.
            var referenceHeight: CGFloat = Dimension.baseHeight
            referenceHeight = (inputValue / referenceHeight)
            return (referenceHeight * UIScreen.main.bounds.height)

        // If the dimension is font size, calculate the adjusted font size based on screen dimensions.
        case .fontSize(input: let input):
            // Get the screen dimensions
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            
            // Calculate scale factors for width and height
            let widthScaleFactor = screenWidth / Dimension.baseWidth
            let heightScaleFactor = screenHeight / Dimension.baseHeight
            
            // Calculate the average scale factor
            let scaleFactor = (widthScaleFactor + heightScaleFactor) / 2.0
            
            // Return adjusted font size based on the calculated scale factor
            return input * scaleFactor
        }
    }
}
