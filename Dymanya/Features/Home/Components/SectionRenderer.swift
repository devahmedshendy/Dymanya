import Foundation
import SectionLayoutRegistry

@SectionLayoutRegistry([
//    (.square, SquareLayoutView.self),
//    (.big_square, SquareLayoutView.self), // Reusing for now
//    // (.queue, QueueLayoutView.self) // Add this when you build QueueLayoutView
])
struct SectionRenderer: View {
    // The macro expects this variable name because we hardcoded 'section.type' and 'section.items' in the macro string.
    let section: HomeSection
}
