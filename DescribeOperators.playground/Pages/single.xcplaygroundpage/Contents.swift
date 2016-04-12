//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next skip](@next)
example("single generate error") {
    let sequence = Observable.of(1, 2, 3, 4).single()
    sequence.subscribe { e in
        print(e)
    }
}

example("single") {
    let sequence = Observable.of(1, 2, 3, 5).single {
        $0 % 2 == 0
    }
    sequence.subscribe { e in
        print(e)
    }
}
