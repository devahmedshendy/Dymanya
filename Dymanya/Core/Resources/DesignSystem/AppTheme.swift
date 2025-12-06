//
//  AppTheme.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import SwiftUI

struct AppTheme {
    // Shapes
    static let cardRadius: CGFloat = 12
    static let imageRadius: CGFloat = 8
    
    // Shadows (Subtle, High-end)
    static let shadowColor = Color.black.opacity(0.15)
    static let shadowRadius: CGFloat = 8
    static let shadowY: CGFloat = 4
    
    // Materials
    static let cardBackground = Color(uiColor: .secondarySystemGroupedBackground)
    static let canvasBackground = Color(uiColor: .systemGroupedBackground) // Or .black for dark mode
}
