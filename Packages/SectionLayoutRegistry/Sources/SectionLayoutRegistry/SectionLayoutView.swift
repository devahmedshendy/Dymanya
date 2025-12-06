import SwiftUI

public protocol SectionLayoutView: View {
    init(items: [any SectionItem])
}
