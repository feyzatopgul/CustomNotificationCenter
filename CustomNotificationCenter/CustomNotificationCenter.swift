import Foundation

class CustomNotificationCenter: NSObject, NotificationCenterProtocol {
    
    static let shared = CustomNotificationCenter()
    private override init() {}
    private var notifications = [String : [CustomNotification]]()
    
    func addObserver(name: String, queue: OperationQueue?, usingBlock: @escaping (CustomNotification) -> Void) {
        let notification = CustomNotification(name: name, userInfo: nil, block: usingBlock, queue: queue)
        if notifications.keys.contains(name) {
            notifications[name]?.append(notification)
        } else {
            notifications[name] = [notification]
        }
    }
    
    func addObserver(name: String, selector: Selector, object: AnyObject) {
        let notification = CustomNotification(name: name, object: object, userInfo: nil, method: selector)
        if notifications.keys.contains(name) {
            notifications[name]?.append(notification)
        } else {
            notifications[name] = [notification]
        }
    }
    
    func removeObserver(name: String) {
        notifications[name] = nil
    }
    
    func removeObserver() {
        notifications = [:]
    }
    
    func post(_ notification: CustomNotification) {
        if let method = notification.method {
            if let object = notification.object {
                _ = object.perform(method)
            }
        }
        if let block = notification.block {
            if let queue = notification.queue {
                queue.addOperation {
                    block(notification)
                }
            } else {
                block(notification)
            }
        }
    }
    
    func post(name: String, userInfo: [AnyHashable : Any]?) {
        guard let notification = notifications[name] else {
            return
        }
        for item in notification {
            if let method = item.method {
                if let object = item.object {
                    _ = object.perform(method, with: userInfo)
                }
            }
            if let block = item.block {
                let currNotification = item
                currNotification.userInfo = userInfo
                if let queue = currNotification.queue {
                    queue.addOperation {
                        block(currNotification)
                    }
                } else {
                    block(currNotification)
                }
                
            }
        }
        
    }
    
    func post(name: String) {
        guard let notification = notifications[name] else {
            return
        }
        for item in notification {
            if let method = item.method {
                if let object = item.object {
                    _ = object.perform(method, with: item.userInfo)
                }
            }
            if let block = item.block {
                if let queue = item.queue {
                    queue.addOperation {
                        block(item)
                    }
                } else {
                    block(item)
                }
            }
        }
    }
    
    
}
