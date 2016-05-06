import Cocoa
import RxSwift
import RxCocoa
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

example("from main thread") {
    print("init thread: \(NSThread.currentThread())")
    let source = NSTextField()
    let status = NSTextField()
    
    let URL = NSURL(string: "https://github.com/")!
    let request = NSURLRequest(URL: URL)
    let observable =  NSURLSession.sharedSession().rx_response(request).shareReplayLatestWhileConnected()
    
    let sourceObservable = observable.map { (maybeData, response) in
        return String(data: maybeData, encoding: NSUTF8StringEncoding)!
    }
    
    sourceObservable.subscribe() { e in
        print("observer thread: \(NSThread.currentThread())")
    }
}