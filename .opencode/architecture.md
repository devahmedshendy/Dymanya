# Architectural Reference: Polymorphic Data Patterns

This document provides **reference implementations** for handling polymorphic data in the Network and Repository layers. 
These patterns are designed to solve specific challenges regarding dynamic content types (e.g., heterogeneous lists of items). Use these patterns as a guide when the task requires scalable, type-safe handling of mixed data types without relying on brittle `switch` statements. 
---

## Pattern A: Network Layer (Polymorphic JSON Decoding)

**Context:** Useful when the API returns a list of objects where a field (e.g., `_type`) determines the schema of the rest of the object.

### 1. The Core Protocol Strategy

Defining a protocol that allows types to identify themselves via an ID.

```swift
protocol Polymorphic: Codable {
 static var id: String { get }
} 
extension Polymorphic {
 static var id: String { String(describing: Self.self) }
}
```

### 2. Decoder Extension Strategy

Instead of manual decoding in every struct, this pattern extends `Decoder` to look up the type dynamically from a registered list in `userInfo`.

```swift
// Example implementation logic
extension Decoder {
    func decode<ExpectedType>(_ expectedType: ExpectedType.Type) throws -> ExpectedType {
        // logic to read the discriminatary key (e.g. "_type")
        // logic to look up the matching Decodable.Type from userInfo
        // logic to init(from: decoder)
    }
}
```

---

## Pattern B: Repository Layer (Domain Mapping)

**Context:** Useful when you need to map generic API DTOs into specific Domain Entities (e.g., `APIPodcast` -> `PodcastEntity`) based on a string key, while keeping the Repository decoupled from concrete types.

### 1. The Mapper Protocol

Separating the mapping logic into small, testable components.

```swift
protocol DomainMapper {
    associatedtype InputModel 
    associatedtype OutputModel

    func map(_ input: InputModel) throws -> OutputModel
}
```

### 2. The Registry Pattern

Using a dictionary to store mappers at runtime allows the app to support new content types by simply registering a new mapper, rather than modifying the Repository code.

```swift
// Concept:
// registry.register("audio_book", mapper: AudioBookMapper())
// registry.resolve("audio_book") -> Returns the specific mapper
```

### 3. Repository Usage

The repository acts as a coordinator, fetching data and asking the registry for the correct tool to map it.

```swift
// Concept:
// 1. Fetch JSON
// 2. Identify content type
// 3. Resolve Mapper from Registry
// 4. Map to Domain
```

```

### The Effect on Agents

- **Before (Mandatory):** The Coder would see a list of items and immediately force this pattern, potentially conflicting with a simple API that doesn't need it.
- **Now (Context):** The Lead Agent will read the Task (`task.md`), see that it involves "Dynamic Sections" and "Polymorphic Data", and then look at this document (`architecture.md`) and say: *"Aha! This reference document solves exactly the problem described in the task. I will instruct the Coder to apply Pattern B."*

The file setup in `.opencode.json` remains the same, as `context` is the correct place for reference material.
