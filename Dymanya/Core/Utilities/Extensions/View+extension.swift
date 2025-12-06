//
//  View+extension.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 12/10/2025.
//  Copyright © 2025 Petrojet. All rights reserved.
//

import SwiftUI

extension View {
    static var identifier: String { .init(describing: Self.self) }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension View {
    func hiddenEverything() -> some View {
        self.transform {
            if #available(iOS 18.0, *) {
                $0.toolbarVisibility(.hidden, for: .automatic)
            } else {
                $0.toolbar(.hidden, for: .automatic)
            }
        }
    }
    func hiddenTabbar() -> some View {
        self.transform {
            if #available(iOS 18.0, *) {
                $0.toolbarVisibility(.hidden, for: .tabBar)
            } else {
                $0.toolbar(.hidden, for: .tabBar)
            }
        }
    }

    func hiddenNavigationBar() -> some View {
        self.transform {
            if #available(iOS 18.0, *) {
                $0.toolbarVisibility(.hidden, for: .navigationBar)
            } else {
                $0.toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.hideKeyboard()
    }
}
