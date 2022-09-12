import Foundation

protocol NotificationCenterProtocol {

    func addObserver(name: String, queue: OperationQueue?, usingBlock: @escaping (CustomNotification) -> Void)
    func addObserver(name: String, selector: Selector, object: AnyObject)
    
    func removeObserver(name: String)
    func removeObserver()
    
    func post(_ notification: CustomNotification)
    func post(name: String, userInfo: [AnyHashable : Any]?)
    func post(name: String)
}
