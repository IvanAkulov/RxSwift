import Foundation
import RxSwift
import XCPlayground
//: [Next asObservable](@next)

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
example("amb") {
    let subjectA = PublishSubject<Int>()
    let subjectB = PublishSubject<Int>()
    let subjectC = PublishSubject<Int>()
    let subjectD = PublishSubject<Int>()
    
    let ambSequence = [subjectA, subjectB, subjectC, subjectD].amb()
    ambSequence.subscribe { e in
        print(e)
    }
    
    subjectC.onNext(0)
    subjectA.onNext(3)
    subjectB.onNext(102)
    subjectC.onNext(1)
    subjectD.onNext(45)
}
