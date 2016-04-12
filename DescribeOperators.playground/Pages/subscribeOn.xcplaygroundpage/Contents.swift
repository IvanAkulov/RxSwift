//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next switchLast](@next)
example("without subscribeOn") {
    let sequence = Observable<AnyObject>.of(1, 2, 3)
    sequence.subscribe { e in
        print("\(NSThread.currentThread()) \(e)")
    }
}

example("with subscribeOn") {
    let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    let sequence = Observable<AnyObject>.of(1, 2, 3)
        .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: queue))
    
    sequence.subscribe { e in
        print("\(NSThread.currentThread()) \(e)")
    }
}
