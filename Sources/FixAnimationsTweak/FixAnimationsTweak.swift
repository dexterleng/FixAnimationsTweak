import os
import Foundation

let logger = Logger(subsystem: "com.dexterleng.FixAnimationsTweak", category: "debug")

@_section("__DATA,__mod_init_func")
let initialize: @convention(c) () -> Void = {
    logger.info("Injected!")
    
    NSObject.exchange(instanceMethod: Selector(("animates")),
                      in: "NSPopover",
                      for: #selector(NSObject.swizzled_NSPopover_animates))
    
    NSObject.exchange(instanceMethod: Selector(("behavior")),
                      in: "NSPopover",
                      for: #selector(NSObject.swizzled_NSPopover_behavior))
}

extension NSObject {
    @objc func swizzled_NSPopover_animates() -> Bool {
        let originalAnimates = self.swizzled_NSPopover_animates()
        logger.info("Swizzled -[NSPopover animates]: overriding original value \(originalAnimates) to false")
        return false
    }
    
    @objc func swizzled_NSPopover_behavior() -> Int {
        let originalBehavior = self.swizzled_NSPopover_behavior()
        logger.info("Swizzled -[NSPopover behavior]: original behavior \(originalBehavior)")
        // changes NSPopoverBehaviorTransient to NSPopoverBehaviorSemitransient
        // to fix click-button-to-close popover behavior when animates = false
        if originalBehavior == 1 {
            return 2
        }
        return originalBehavior
    }
}
