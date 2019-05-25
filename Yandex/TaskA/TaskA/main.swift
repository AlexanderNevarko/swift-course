//
//  main.swift
//  TaskA
//
//  Created by Alexander Nevarko on 22/04/2019.
//  Copyright © 2019 Alexander Nevarko. All rights reserved.
//
import Foundation

let jewlery = readLine()!
let stones = readLine()!
var count = 0

for chr in stones{
    if (jewlery.contains(chr)) {count += 1}
}

print(count)

