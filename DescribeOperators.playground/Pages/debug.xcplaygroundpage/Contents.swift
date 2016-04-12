//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next deferred](@next)
example("debug") {
    let sequence = Observable<AnyObject>.of(1, 2, 3)
        .debug("sequence")
        .subscribe{}
}
