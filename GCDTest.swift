//
//  GCDTest.swift
//  ABCTestProject
//
//  Created by Vicky on 2018/5/4.
//  Copyright © 2018 Vicky. All rights reserved.
//

import Foundation

func SerialSync() {
    let queue = DispatchQueue(label: "com.tal.test", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: <#T##DispatchQueue?#>)
}
