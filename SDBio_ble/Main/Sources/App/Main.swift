import SwiftUI
import Feature
import CoreData

@main
struct MainApp: App {
//    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    let shared = PersistenceStorage.shared

    var body: some Scene {
        WindowGroup {
            SearchView.build()
                .environment(\.managedObjectContext, shared.container.viewContext)
        }
    }
}
