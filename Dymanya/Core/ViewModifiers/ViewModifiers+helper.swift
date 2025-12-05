//
//  Frame.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 04/02/2025.
//  Copyright © 2025 Semicolon. All rights reserved.
//

import SwiftUI

extension View {
    @ViewBuilder func transform<Content: View>(
        @ViewBuilder _ transform: (Self) -> Content
    ) -> some View {
        transform(self)
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(
        _ condition: Bool,
        @ViewBuilder transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension View {
    @ViewBuilder func ifDebug<Content: View>(
        @ViewBuilder transform: (Self) -> Content
    ) -> some View {
        #if DEBUG
            transform(self)
        #else
            self
        #endif
    }
}
