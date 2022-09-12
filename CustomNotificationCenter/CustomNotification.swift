import Foundation

class CustomNotification: NSObject {
    var name: String
    var object: AnyObject?
    var userInfo: [AnyHashable : Any]?
    var method: Selector?
    var block: ((CustomNotification) -> Void)?
    var queue: OperationQueue?
    
    
    init(name: String, object: AnyObject, userInfo: [AnyHashable : Any]?, method: Selector) {
        self.name = name
        self.object = object
        self.userInfo = nil
        self.method = method
        self.block = nil
        self.queue = nil
    }
  
    init(name: String, userInfo: [AnyHashable : Any]?, block: ((CustomNotification) -> Void)? ) {
        self.name = name
        self.object = nil
        self.userInfo = userInfo
        self.method = nil
        self.block = block
        self.queue = nil
    }
    init(name: String, userInfo: [AnyHashable : Any]?, block: ((CustomNotification) -> Void)?, queue: OperationQueue? ) {
        self.name = name
        self.object = nil
        self.userInfo = userInfo
        self.method = nil
        self.block = block
        self.queue = queue
    }
}
