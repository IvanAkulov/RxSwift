//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next of](@next)

example("without observeOn") {
    let sequence = Observable<AnyObject>.of(1, 2, 3)
    
    sequence.subscribe { e in
        print("\(NSThread.currentThread())\(e)")
    }
}

example("with observeOn") {
    let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    let sequence = Observable<AnyObject>.of(1, 2, 3)

    sequence.observeOn(ConcurrentDispatchQueueScheduler.init(queue: queue))
        .subscribe { e in
            print("\(NSThread.currentThread())\(e)")
    }
}
