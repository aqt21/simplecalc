//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if args[args.count - 1] == "count" {
            return args.count - 1
        }
        if args[args.count - 1] == "fact" {
            if args.count == 1 {
                return 0
            }
            else if args[0] == "1" {
                return 1
            }
            else {
                var first : Int? = Int(args[args.count - 2])
                for i in (1 ... first! - 1).reversed() {
                    first = first! * i
                }
                
                return first!
            }
        }
        if args[args.count - 1] == "avg" {
            if args.count == 1 {
                return 0
            }
            else if args.count == 2 {
                let curr : Int? = Int(args[0])
                return curr!
            }
            else {
                var total = 0
            
                for i in 0 ... args.count - 2 {
                    let curr : Int? = Int(args[i])
                    total += curr!
                }
                return total / (args.count - 1)
            }
        }
        if args[1] == "+" {
            let first : Int? = Int(args[0])
            let second : Int? = Int(args[2])
            return first! + second!
        }
        if args[1] == "-" {
            let first : Int? = Int(args[0])
            let second : Int? = Int(args[2])
            return first! - second!
        }
        if args[1] == "/" {
            let first : Int? = Int(args[0])
            let second : Int? = Int(args[2])
            return first! / second!
        }
        if args[1] == "*" {
            let first : Int? = Int(args[0])
            let second : Int? = Int(args[2])
            return first! * second!
        }
        if args[1] == "%" {
            var first : Int? = Int(args[0])
            let second : Int? = Int(args[2])
            while first! >= second! {
                first! -= second!
            }
            
            return first!
        }
        
        return 0
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

