//
//  BlueToothItem.swift
//  Feature
//
//  Created by Moon kyu Jung on 2/9/25.
//  Copyright © 2025 mooq. All rights reserved.
//

import Foundation
import CoreBluetooth
import SwiftUI

struct BlueToothItem: Hashable, Equatable {
    var rssi: Int
    var peripheral: CBPeripheral
    
    static func == (lhs: BlueToothItem, rhs: BlueToothItem) -> Bool {
        return lhs.peripheral == rhs.peripheral
    }
}
