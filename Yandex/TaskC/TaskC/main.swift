//
//  main.swift
//  TaskC
//
//  Created by Alexander Nevarko on 22/04/2019.
//  Copyright © 2019 Alexander Nevarko. All rights reserved.
//

import Foundation

let n = Int(readLine()!)!
var tmp = 0
var prev:Int?

for _ in 0..<n{
    tmp = Int(readLine()!)!
    if(tmp != prev){
        print(String(tmp))
        prev = tmp
    }
}

