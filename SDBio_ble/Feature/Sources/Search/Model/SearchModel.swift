//
//  SearchModel.swift
//  Feature
//
//  Created by Moon kyu Jung on 2/9/25.
//  Copyright © 2025 mooq. All rights reserved.
//

import Foundation
import SwiftUI
import CoreBluetooth

class SearchModel: NSObject, ObservableObject, SearchModelStateProtocol {
    @Published var state: SearchState = .idle
    @Published var devices: [BlueToothItem] = []
    @Published var errorText: String = ""
}

extension SearchModel: SearchModelActionsProtocol {
    func setScanState(_ scanning: Bool) {
        if scanning {
            devices = []
        }
        state = scanning ? .scanning(items: devices) : .stopped(items: devices)
    }
    
    func deviceFounded(_ device: BlueToothItem) {
        if !devices.contains(device) {
            devices.append(device)
            state = .scanning(items: devices)
        }
    }
    
    func onFailedToSearchItem(error: any Error) {
        state = .error(error)
    }
}
