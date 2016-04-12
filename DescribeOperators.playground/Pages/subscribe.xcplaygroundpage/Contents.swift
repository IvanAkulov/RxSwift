//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next subscribeOn](@next)
example("subscribe") {
    let firstSequence = Observable.of(1)
    
    firstSequence.subscribe { e in
        print(e)
    }
    
    firstSequence.subscribeCompleted {
        print("!completed")
    }
    
    firstSequence.subscribeNext{next in
        print("next: \(next)")
    }
}

example("subscribeNext") {
    let firstSequence = Observable.of(1)
    
    firstSequence.subscribeNext{next in
        print("next: \(next)")
    }
}

example("subscribeCompleted") {
    let firstSequence = Observable.of(1)
    
    firstSequence.subscribeCompleted {
        print("!completed")
    }
}

example("subscribeError") {
    let firstSequence = Observable<Int>.error(RxError.ArgumentOutOfRange)
    
    firstSequence.subscribeError {e in
        print("!error \(e)")
    }
}




