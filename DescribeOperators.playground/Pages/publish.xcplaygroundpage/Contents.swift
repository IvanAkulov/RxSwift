//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next range](@next)
example("subscribe simple sequence") {
    let sequence = Observable<AnyObject>.of(1, 2, 3)
    
    sequence.subscribe { e in
        print("first: \(e)")
    }
    
    sequence.subscribe { e in
        print("second: \(e)")
    }
}

example("subscribe connectable sequence without connect") {
    let sequence = Observable<AnyObject>.of(1, 2, 3).publish()
    
    sequence.subscribe { e in
        print(e)
    }
}


// publish = multicast + replay subject
example("subscribe connectable sequence with connect") {
    let sequence = Observable<Int>.interval(1, scheduler: MainScheduler.instance).debug("sequence").publish()
    var disposable1: Disposable!
    var disposable2: Disposable!
    disposable1 = sequence.subscribe { e in
        print("first: \(e)")
    }
    delay(2) {
        disposable2 = sequence.subscribe { e in
            print("second: \(e)")
        }
    }
    
    delay(4) {
        sequence.connect()
    }
    
    delay(8) {
        disposable1.dispose()
        disposable2.dispose()
    }
}

