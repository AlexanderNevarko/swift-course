//
//  main.swift
//  TaskB
//
//  Created by Alexander Nevarko on 22/04/2019.
//  Copyright © 2019 Alexander Nevarko. All rights reserved.
//

import Foundation

let count = Int(readLine()!)!
var len = 0
var tmp = 0
var min = 0

for _ in 0..<count{
    tmp = Int(readLine()!)!
    if (tmp > 0) {
        len += 1
        if(len > min) {min = len}
    } else{
        len = 0
    }
}

print(min)

