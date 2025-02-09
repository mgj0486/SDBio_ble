import SwiftUI
import Usecase
import Entities
import CoreBluetooth

public extension SearchView {
    static func build() -> some View {
        let model = SearchModel()
        let intent = SearchIntent(model: model)
        let container = MVIContainer(intent: intent as SearchIntentProtocol,
                                     model: model as SearchModelStateProtocol,
                                     modelChangePublisher: model.objectWillChange)
        let view = SearchView(container: container)
        return view
    }
}

public struct SearchView: View {
    @StateObject var container: MVIContainer<SearchIntentProtocol, SearchModelStateProtocol>
    private var model: SearchModelStateProtocol { container.model }
    private var intent: SearchIntentProtocol { container.intent }
    
    @Environment(\.colorScheme) var colorScheme
    
    public var body: some View {
        NavigationStack {
            ZStack {
                switch model.state {
                case .idle:
                    Text("스캔을 시작해주세요.")
                case .scanning(let devices), .stopped(let devices):
                    list(devices)
                case .error(let error):
                    Text(error.localizedDescription)
                }
            }
            .navigationTitle("BLE Scan")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    toolbar()
                }
            }
        }
    }
    
    @ViewBuilder
    func list(_ devices: [BlueToothItem]) -> some View {
        List(devices, id: \.self) { device in
            item(device)
        }
    }
    
    @ViewBuilder
    func item(_ device: BlueToothItem) -> some View {
        HStack {
            Text(device.peripheral.name ?? "Unknown Device")
            Spacer(minLength: 0)
            Text("\(device.rssi)")
        }
    }
    
    @ViewBuilder
    func toolbar() -> some View {
        Button(action: {
            switch model.state {
            case .idle, .error, .stopped:
                intent.startScan()
            case .scanning:
                intent.stopScan()
            }
        }) {
            Image(systemName: model.state.isScanning() ? "stop.fill" : "play.fill")
                .foregroundStyle(colorScheme == .dark ? Color.accentColor_dark : Color.accentColor_light)
        }
    }
}

