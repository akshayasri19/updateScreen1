// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct swiftPackage {
   public let name: String

   private init(named name: String) {
      self.name = name
      do {
         try registerFont(named: name)
      } catch {
         let reason = error.localizedDescription
         fatalError("Failed to register font: \(reason)")
      }
   }

   public static let manropebold = swiftPackage(named: "Manrope-Bold")
   public static let regular = swiftPackage(named: "Antonio-Regular")
   public static let bold = swiftPackage(named: "Antonio-Bold")
}






