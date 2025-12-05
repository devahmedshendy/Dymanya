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
