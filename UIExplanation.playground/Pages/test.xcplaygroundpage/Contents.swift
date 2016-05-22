//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [Next](@next)
//let var1: PublishSubject<Int> = PublishSubject()
//let genVar1 = Variable(())
//let genVar2 = Variable(())
//
//var1.subscribeNext { (next) in
//    print(next)
//}
//
//let observable1 = genVar1.asObservable().map{ () -> Int in
//    1
//}.subscribe(var1)
//
//let observable2 = genVar2.asObservable().map{ () -> Int in
//    2
//}.subscribe(var1)
//
//genVar1.value = ()
//genVar1.value = ()
//genVar2.value = ()
//
//

//var stru = TestStruct(i: 10)
//var var5 = Variable(stru)
//var5.asObservable().subscribeNext { (next) in
//    print(next.i)
//}
//stru.i = 19
//var5.value = stru

struct TestStruct {
    var i: Int
    var j: Int
}

var str = TestStruct(i: 0, j: 0)

var variable = Variable(str)
var observable = variable.asObservable().shareReplayLatestWhileConnected()


let iObservable = observable.map { (str) -> Int in
    str.i
    }.distinctUntilChanged()

let jObservable = observable.map { (str) -> Int in
    str.j
    }.distinctUntilChanged()
iObservable.subscribeNext { (i) in
    print("i: \(i)")
}

jObservable.subscribeNext { (j) in
    print("j: \(j)")
}
str.i = 9

variable.value = str

class Service {
    let bytesSubject: PublishSubject<Double> = PublishSubject()
    func funcProgress(bytes: Double) {
        bytesSubject.onNext(bytes)
    }
}

class ViewModel {
    let model: Variable<Model>
    
    var bytesObservable: Observable<Double>!
    init(inputModel: Model, service: Service) {
        model = Variable(inputModel)
        let baseBytesObservable = model.asObservable().map { $0.bytes }
        let changeBytesObservable = service.bytesSubject.asObservable()
            .map { [unowned self] next -> Double in
                self.model.value.bytes = next
                //print("change \(self.model.value.bytes)")
                //self.model.value = self.model.value
                return next
            }
        
        //bytesObservable = changeBytesObservable.debug("tt").withLatestFrom(baseBytesObservable)
        bytesObservable = changeBytesObservable.map{ [unowned self] _ in
            self.model.value.bytes
        }
        //.startWith(model.value.bytes)
    }
}

class Model {
    let name: String
    var bytes: Double
    
    init(name: String, bytes: Double) {
        self.name = name
        self.bytes = bytes
    }
}

let service = Service()
var model = Model(name: "test", bytes: 0)
let vm = ViewModel(inputModel: model, service: service)
vm.bytesObservable.subscribeNext { (next) in
    print("bytes: \(next)")
}
service.funcProgress(1)
service.funcProgress(2)
service.funcProgress(3)
service.funcProgress(4)
model.bytes = 6



