//
//  type.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 20/10/2025.
//  Copyright © 2025 Petrojet. All rights reserved.
//

import Foundation
import Combine

@propertyWrapper
struct Republished<Value: ObservableObject> {
    private var value: Value
    private var cancellable: AnyCancellable?

    @available(*, unavailable,
        message: "This property wrapper can only be applied to classes"
    )
    var wrappedValue: Value {
        get { fatalError() }
        // swiftlint:disable:next unused_setter_value
        set { fatalError() }
    }

    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    static subscript<EnclosingSelf: ObservableObject>(
        _enclosingInstance observed: EnclosingSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Self>
    ) -> Value where EnclosingSelf.ObjectWillChangePublisher == ObservableObjectPublisher {
        get {
            let wrapper = observed[keyPath: storageKeyPath]

            // Set up forwarding if not already done
            if observed[keyPath: storageKeyPath].cancellable == nil {
                observed[keyPath: storageKeyPath].cancellable = wrapper.value.objectWillChange
                    .sink { [weak observed] _ in
                        (observed?.objectWillChange as? ObservableObjectPublisher)?.send()
                    }
            }

            return wrapper.value
        }
        set {
            observed[keyPath: storageKeyPath].value = newValue
        }
    }
}
