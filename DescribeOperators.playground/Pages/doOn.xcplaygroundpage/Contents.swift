//: [Previous](@previous)

import Foundation
import RxSwift


//: [Next elementAt](@next)
example("simple doOn") {
    let firstSequence = Observable.of(1,2).doOn{e in
        print(e)
    }
    
    firstSequence.subscribeNext{ e in
    }
}
