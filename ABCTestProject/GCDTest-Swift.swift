//
//  GCDTest-Swift.swift
//  ABCTestProject
//
//  Created by Vicky on 2018/5/11.
//  Copyright © 2018 Vicky. All rights reserved.
//

import UIKit

class GCDTest_Swift: NSObject {
    func semaphoreSync() {
        print("current thread---\(Thread.current)")
        print("semaphoreSync---begin")
        let sem = DispatchSemaphore.init(value: 0)
        var num = 0
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 2);
            num = 100
            sem.signal()
        }
        sem.wait()
    }
}
