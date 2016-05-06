//: Playground - noun: a place where people can play

import Cocoa
import RxSwift
import RxCocoa
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

example("without shareReplay duplicate call problem") {
    let source = NSTextField()
    let status = NSTextField()
    
    let URL = NSURL(string: "https://github.com/")!
    let request = NSURLRequest(URL: URL)
    let observable =  NSURLSession.sharedSession().rx_response(request).debug("http")
    
    let sourceObservable = observable.map { (maybeData, response) in
        return String(data: maybeData, encoding: NSUTF8StringEncoding)!
        }.observeOn(MainScheduler.instance)
    let statusObservable = observable.map { (maybeData, response) in
        return response.statusCode.description
        }.observeOn(MainScheduler.instance)
    
    sourceObservable.subscribe(source.rx_text)
    statusObservable.subscribe(status.rx_text)
}