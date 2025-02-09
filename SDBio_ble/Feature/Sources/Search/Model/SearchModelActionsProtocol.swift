//
//  SearchModelActionsProtocol.swift
//  Feature
//
//  Created by Moon kyu Jung on 2/9/25.
//  Copyright © 2025 mooq. All rights reserved.
//

import Foundation
import CoreBluetooth

protocol SearchModelActionsProtocol: AnyObject {
    func setScanState(_ scanning: Bool)
    func deviceFounded(_ device: BlueToothItem)
    func onFailedToSearchItem(error: Error)
}
