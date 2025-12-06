import Foundation

public protocol SectionItem: Identifiable, Sendable {
    var id: String { get }
    var title: String { get }
    var imageURL: URL { get }
}
