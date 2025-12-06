import Foundation

public protocol SectionLayoutItem: Identifiable, Hashable, Sendable {
    var id: String { get }
    var title: String { get }
    var imageURL: URL { get }
}

extension SectionLayoutItem {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
