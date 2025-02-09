//
//  SearchState.swift
//  Feature
//
//  Created by Moon kyu Jung on 2/9/25.
//  Copyright © 2025 mooq. All rights reserved.
//

import Foundation
import CoreBluetooth

enum SearchState {
    case idle
    case scanning(items: [BlueToothItem])
    case stopped(items: [BlueToothItem])
    case error(Error)
    
    func isScanning() -> Bool {
        switch self {
        case .scanning:
            return true
        default:
            return false
        }
    }
}

enum SearchStateError: Error {
    case searchFailed
}
