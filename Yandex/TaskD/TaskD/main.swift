//
//  main.swift
//  TaskD
//
//  Created by Alexander Nevarko on 22/04/2019.
//  Copyright © 2019 Alexander Nevarko. All rights reserved.
//

import Foundation

func FindLecem(_ str: String, _ n: Int)->Void{
    if(str.count == 2 * n - 1) {
        print("\(str))")
        return
    }
    var open = 0
    var close = 0
    for chr in str{
        if(chr == "("){
            open += 1
        } else{
            close += 1
        }
    }
    
    if(open < n) {FindLecem(str + "(", n)}
    if((close < n) && (open > close)){FindLecem(str + ")", n)}
}

if let n = Int(readLine()!){
    FindLecem("", n)
}

