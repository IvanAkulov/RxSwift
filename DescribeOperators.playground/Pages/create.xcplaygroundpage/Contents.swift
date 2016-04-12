//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next debug](@next)
example("create") {
    let firstSequence = Observable<AnyObject>.of(1, 2, 3)
    let secondSequence = Observable<AnyObject>.of("A", "B", "C")
    
    let multipleSequence = Observable<Observable<AnyObject>>.create { observer in
        observer.on(.Next(firstSequence))
        observer.on(.Next(secondSequence))
        return NopDisposable.instance
    }
    let concatSequence = multipleSequence.concat()
    concatSequence.subscribe { e in
        print(e)
    }
}





