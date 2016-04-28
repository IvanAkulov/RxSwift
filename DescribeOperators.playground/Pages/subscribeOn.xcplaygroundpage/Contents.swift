//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [Next switchLast](@next)
example("without observeOn and subscribeOn") {
    print("init thread: \(NSThread.currentThread())")
    let sequence = Observable<Int>.create { observer in
        print("observable thread: \(NSThread.currentThread())")
        observer.on(.Next(1))
        observer.on(.Next(2))
        observer.on(.Next(3))
        observer.on(.Completed)
        return NopDisposable.instance
    }
    sequence.subscribe { e in
        print("observer thread: \(NSThread.currentThread()) \(e)")
    }
}
example("with subscribeOn only") {
    let queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    print("init thread: \(NSThread.currentThread())")
    let sequence = Observable<Int>.create { observer in
        print("observable thread: \(NSThread.currentThread())")
        observer.on(.Next(1))
        observer.on(.Next(2))
        observer.on(.Next(3))
        observer.on(.Completed)
        return NopDisposable.instance
        }
        .subscribeOn(SerialDispatchQueueScheduler(internalSerialQueueName: "queue1"))
    
    sequence.subscribe { e in
        print("observer thread: \(NSThread.currentThread()) \(e)")
    }
}
sleep(1)
example("with subscribeOn and observeOn") {
    let queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    let queue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    print("init thread: \(NSThread.currentThread())")
    let sequence = Observable<Int>.create { observer in
        print("observable thread: \(NSThread.currentThread())")
        observer.on(.Next(1))
        observer.on(.Next(2))
        observer.on(.Next(3))
        observer.on(.Completed)
        return NopDisposable.instance
        }
        .subscribeOn(SerialDispatchQueueScheduler(internalSerialQueueName: "queue1"))
        .observeOn(SerialDispatchQueueScheduler(internalSerialQueueName: "queue2"))
    
    
    sequence.subscribe { e in
        print("observer thread: \(NSThread.currentThread()) \(e)")
    }
}
