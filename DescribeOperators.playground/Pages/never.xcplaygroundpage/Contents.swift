//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next observeOn ](@next)
example("never") {
    let sequence = Observable<Int>.never()
    sequence.subscribe { e in
        print(e)
    }
}
