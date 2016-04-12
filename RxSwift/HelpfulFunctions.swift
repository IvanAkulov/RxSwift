//
//  HelpfulFunctions.swift
//  Rx
//
//  Created by Alexandr Glushchenko on 03.04.16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation

public enum ResultType {
    case Infinite
    case Completed
    case Error
}

public func createSequenceWithWait<T, U>(array: [T], waitTime: Int64 = 1, resultType: ResultType = .Completed, describer: ((value: T) -> U)? = nil) -> Observable<U> {
    return Observable<U>.create{ observer  in
        for (idx, letter) in array.enumerate() {
            let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), waitTime * Int64(idx) * Int64(NSEC_PER_SEC))
            dispatch_after(time, dispatch_get_main_queue()) {
                if let describer = describer {
                    let value = describer(value: letter)
                    observer.on(.Next(value))
                } else {
                    observer.on(.Next(letter as! U))
                }
                
            }
        }
        
        if resultType != .Infinite {
            let allTime = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), waitTime * Int64(array.count) * Int64(NSEC_PER_SEC))
            dispatch_after(allTime, dispatch_get_main_queue()) {
                switch resultType {
                case .Completed:
                    observer.onCompleted()
                case .Error:
                    observer.onError(RxError.Unknown)
                default:
                    break
                }
                
            }
        }
        
        return NopDisposable.instance
    }
}

