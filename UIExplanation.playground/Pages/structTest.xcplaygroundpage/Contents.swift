//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [Next](@next)
class Service {
    let bytesSubject: PublishSubject<Double> = PublishSubject()
    func funcProgress(bytes: Double) {
        bytesSubject.onNext(bytes)
    }
}

class ViewModel {
    let model: Variable<Model>
    
    var bytesObservable: Observable<Double>!
    var bytesObservable2: Observable<Double>!
    init(inputModel: Model, service: Service) {
        model = Variable(inputModel)
        let baseBytesObservable = model.asObservable().map { $0.bytes }
        bytesObservable2 = model.asObservable().map { $0.bytes }
        
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

struct Model {
    let name: String
    var bytes: Double
}

let service = Service()
var model = Model(name: "test", bytes: 0)
let vm = ViewModel(inputModel: model, service: service)
vm.bytesObservable.subscribeNext { (next) in
    print("1 bytes: \(next)")
}
vm.bytesObservable2.subscribeNext { (next) in
    print("2 bytes: \(next)")
}
service.funcProgress(1)
service.funcProgress(2)
service.funcProgress(3)
service.funcProgress(4)
model.bytes = 6
