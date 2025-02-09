//
//  SearchModelStateProtocol.swift
//  Feature
//
//  Created by Moon kyu Jung on 2/9/25.
//  Copyright © 2025 mooq. All rights reserved.
//

import Foundation
import CoreBluetooth

protocol SearchModelStateProtocol {
    var state: SearchState { get }
    var errorText: String { get }
    var devices: [BlueToothItem] { get }
}
