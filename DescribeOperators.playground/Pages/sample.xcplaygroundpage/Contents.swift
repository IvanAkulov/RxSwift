//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next scan](@next)

example("sampler") {
    let sampler = Observable<Int>.interval(2, scheduler: MainScheduler.instance).debug("sampler")
    
    let sequence:Observable<Int> = createSequenceWithWait([1,2,3,4,5,6], waitTime: 1).sample(sampler)
    sequence.subscribe { e in
        print(e)
    }
}
