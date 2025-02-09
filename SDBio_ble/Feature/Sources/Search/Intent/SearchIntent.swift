//
//  SearchIntent.swift
//  Feature
//
//  Created by Moon kyu Jung on 2/9/25.
//  Copyright © 2025 mooq. All rights reserved.
//

import Foundation
import CoreBluetooth

class SearchIntent: NSObject {
    private weak var model: SearchModelActionsProtocol?
    
    init(model: SearchModelActionsProtocol) {
        super.init()
        self.model = model
        self.centralManager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
    }
    
    private var centralManager: CBCentralManager!
}

extension SearchIntent: SearchIntentProtocol {
    func startScan() {
        guard centralManager.state == .poweredOn else { return }
        model?.setScanState(true)
        centralManager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
    }

    func stopScan() {
        model?.setScanState(false)
        centralManager.stopScan()
    }
}

extension SearchIntent: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            startScan()
        } else {
            model?.onFailedToSearchItem(error: SearchStateError.searchFailed)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        let item = BlueToothItem(rssi: RSSI.intValue, peripheral: peripheral)
        model?.deviceFounded(item)
    }
}
