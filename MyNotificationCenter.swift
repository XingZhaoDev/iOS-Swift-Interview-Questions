import Foundation

class MyNotificationCenter {
   static let shared = MyNotificationCenter()
   private init() {}
   
   private struct Observer {
        weak var observer: AnyObject?
        let closure: (Any?) -> Void
   }

   private var observers: [String: [Observer]] = [:]

   func addObserver(forName name: String, observer: AnyObject, closure: @escaping (Any?) -> Void) {
        guard !name.isEmpty else { return }
        if observers[name] == nil {
            observers[name] = []
        }
        let newObserver = Observer(observer: observer, closure: closure)
        observers[name]?.append(newObserver)
   }

   func postNotification(forName name: String, object: Any? = nil) {
        guard let observersForName = observers[name] else { return } 
        for observer in observersForName {
            observer.closure(object)
        }
   }

   func removeObserver(forName name: String, observer: AnyObject) {
        guard !name.isEmpty else { return }
        if let index = observers[name]?.firstIndex(where: { $0.observer === observer }) {
            observers[name]?.remove(at: index)
        }
   }
}

let notificationCenter = MyNotificationCenter.shared
