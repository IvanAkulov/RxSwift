//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next single](@next)

func withShareReplay() {
    example("with shareReplay") {
        let sequence = Observable<Int>.interval(1, scheduler: MainScheduler.instance).debug("sequence")
        let shareReplay = sequence.shareReplay(2).debug("shareReplay")
        let subscription1 = shareReplay.subscribe{ e in
            print("first: \(e)")
        }
        var subscription2: Disposable!
        delay(3) {
            subscription2 = shareReplay.subscribe{ e in
                print("second: \(e)")
            }
        }
        
        delay(4) {
            print("dispose 1")
            subscription1.dispose()
            
        }
        delay(6) {
            print("dispose 2")
            subscription2.dispose()
            
        }
        delay(8) {
            print("subscribe after")
            _ = shareReplay.subscribe { e in
                print("after: \(e)")
            }
        }
    }
}

withShareReplay()



