//: [Previous](@previous)

import Foundation
import RxSwift

import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next replayAll](@next)
example("replay") {
    let firstSequence = Observable<Int>.interval(1, scheduler: MainScheduler.instance).replay(2)
    
    let firstDisposable = firstSequence.subscribe { e in
        print("first: \(e)")
    }
    
    firstSequence.connect()
    
    var secondDisposable: Disposable!
    delay(3) {
        secondDisposable = firstSequence.subscribe { e in
        print("second: \(e)")
        }
    }
    
    delay(4) {
        firstDisposable.dispose()
    }
    delay(5) {
        secondDisposable.dispose()
    }
    
    delay(7) {
        firstSequence.subscribe { e in
            print("third: \(e)")
        }
    }
}
