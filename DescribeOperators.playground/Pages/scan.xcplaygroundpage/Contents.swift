//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next shareReplay](@next)
example("scan") {
    let sequence = Observable.of(1, 2, 3).scan(10) { result, element in
        return result + element
    }
    sequence.subscribe { e in
        print(e)
    }
}

example("scan multiply") {
    let sequence = Observable.of(2, 3, 5).scan(10) { result, element in
        return result * element
    }
    sequence.subscribe { e in
        print(e)
    }
}
