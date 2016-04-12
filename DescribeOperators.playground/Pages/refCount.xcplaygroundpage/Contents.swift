//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


//: [Next repeatElement](@next)

func withoutRefCount() {
    
    example("without refCount") {
        let sequence = Observable<Int>.interval(1, scheduler: MainScheduler.instance).publish()
        sequence.connect()
        let subscription1 = sequence.subscribe{ e in
            print("first: \(e)")
        }
        let subscription2 = sequence.subscribe{ e in
            print("second: \(e)")
        }
        
        delay(2) {
            subscription1.dispose()
            
        }
        delay(3) {
            subscription2.dispose()
            
        }
        delay(5) {
            _ = sequence.subscribe { e in
                print("after: \(e)")
            }
        }
    }
}

//withoutRefCount()


func withRefCount() {
    example("with refCount") {
        let sequence = Observable<Int>.interval(1, scheduler: MainScheduler.instance).debug("sequence")
        let publishSequence = sequence.publish()
        let refCountSequence = publishSequence.refCount().debug("refCountSequence")
        let subscription1 = refCountSequence.subscribe{ e in
            print("first: \(e)")
        }
        let subscription2 = refCountSequence.subscribe{ e in
            print("second: \(e)")
        }
        
        delay(2) {
            subscription1.dispose()
            
        }
        delay(3) {
            subscription2.dispose()
            
        }
        delay(5) {
            _ = refCountSequence.subscribe { e in
                print("after: \(e)")
            }
        }
    }
}


withRefCount()