//
//  MVIContainer.swift
//  
//
//  Created by Moon kyu Jung on 1/15/25.
//  Copyright © 2025 mooq. All rights reserved.
//

import SwiftUI
import Combine

final public class MVIContainer<Intent, Model>: ObservableObject {
        
    public let intent: Intent
    public let model: Model

    private var cancellable: Set<AnyCancellable> = []

    public init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model

        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
    }
}
