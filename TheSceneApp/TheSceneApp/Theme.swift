import SwiftUI

enum Theme {
    // Colors
    static let brownInk = Color(hex: "6B5B4E")
    static let brownLight = Color(hex: "8B7355")
    static let cream = Color(hex: "F5F5DC")
    static let lightGold = Color(hex: "FFE0A3")
    
    // Gradients
    static let backgroundGradient = LinearGradient(
        colors: [brownLight, brownInk],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // Shadows
    static let cardShadow = Color.black.opacity(0.1)
    
    // Corner Radius
    static let cornerRadius: CGFloat = 12
    
    // Padding
    static let standardPadding: CGFloat = 16
    static let largePadding: CGFloat = 24
}

// Color extension for hex support
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
} 