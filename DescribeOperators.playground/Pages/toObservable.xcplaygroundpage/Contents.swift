//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next using](@next)
example("toObservable") {
    let firstSequence = [1, 2, 3].toObservable()
    
    firstSequence.subscribe { e in
        print(e)
    }
}

