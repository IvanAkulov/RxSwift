//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next withLatestFrom](@next)
example("window") {
    let varA = Variable<Int>(0)
    
    let bufferSequence:Observable<Observable<Int>> = varA.asObservable()
        .window(timeSpan: 3, count: 3, scheduler: MainScheduler.instance)
        .debug("bufferSequence")
    bufferSequence.subscribe { e in
        if case .Next(let observable) = e {
            print("\(NSDate()) - генерируем новый Observable")
            observable.subscribe { val in
                print(val)
                
            }
        }
    }
    varA.value = 1
    varA.value = 2
    varA.value = 3
    delay(4) {
        varA.value = 4
        
        varA.value = 5
        delay(4) {
            varA.value = 6
        }
    }
}
