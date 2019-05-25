//
//  stones.swift
//
//  Created by Alexander Nevarko on 22/04/2019.
//  Copyright © 2019 Alexander Nevarko. All rights reserved.
//

import Foundation


//let jewelry = readLine()!
//let stones = readLine()!
let jewelry = "ab"
let stones = "aabbccd"
var matches = 0

for char in stones{
    if (jewelry.contains(char)) {
        matches += 1
    }
}

print(matches)
