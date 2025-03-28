import Foundation

extension NSObject {
    static func exchange(instanceMethod: String, in className: String, for newMethod: String) {
        exchange(instanceMethod: Selector(instanceMethod), in: className, for: Selector(newMethod))
    }
    
    static func exchange(instanceMethod: Selector, in className: String, for newMethod: Selector) {
        guard let classRef = objc_getClass(className) as? AnyClass,
              let original = class_getInstanceMethod(classRef, instanceMethod),
              let replacement = class_getInstanceMethod(self, newMethod)
        else {
            fatalError("Could not exchange instance method \(instanceMethod) on class \(className).");
        }
        
        method_exchangeImplementations(original, replacement);
    }
}
