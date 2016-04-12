//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next filter](@next)
example("error") {
    let sequence = Observable<Int>
        .error(RxError.Unknown)
    sequence.subscribe { e in
        print(e)
    }
}