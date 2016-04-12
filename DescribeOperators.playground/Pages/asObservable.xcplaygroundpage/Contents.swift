//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground
//: [Next buffer](@next)

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

example("as Observable") {
    let variable = Variable<Int>(0)
    
    variable.asObservable().subscribe { e in
        print(e)
    }
    variable.value = 1
}
