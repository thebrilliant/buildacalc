//
//  main.swift
//  Build a Calculator
//
//  Created by Vivyan Woods on 10/13/15.
//  Copyright © 2015 Vivyan Woods. All rights reserved.
//

import Foundation

//prints introduction
print("Hello!")
print("Yes, you there")
print("You've met with a terrible fate, haven't you?")
print("Maybe I can help...")
print("Need me to calculate something?")

//gets input from the user
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding: NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

//calculates addition
let add = { (val1: Int, val2: Int) -> Int in return val1 + val2 }

//calculates subtraction
let sub = { (val1: Int, val2: Int) -> Int in return val1 - val2 }

//calculates division
let div = { (val1: Int, val2: Int) -> Int in return val1 / val2 }

//calculates multiplcation
let mult = { (val1: Int, val2: Int) -> Int in return val1 * val2}

// generic calculator that will perform an operation the two numbers given
func calc (left: Int, right: Int, op: (Int, Int) -> Int) -> Int {
    return op(left, right)
}

//calculates the total of all elements in the set added together
let arrayAdd = { (num: [Int]) -> Int in
    var total = 0
    for number in num {
        total += number
    }
    return total
}

//calculates average of a set of numbers
let arrayAvg = { (num: [Int]) -> Int in return arrayAdd(num) / num.count }

//calculates the total of all elements in the set multiplied together
let arrayMult = { (num: [Int]) -> Int in
    var total = 1
    for number in num {
        total *= number
    }
    return total
}

//counts the number of elements in the given set
let arrayCount = { (num: [Int]) -> Int in return num.count }

//generic calculator that will perform an operation the set of numbers given
func generalCalc (num: [Int], op: ([Int]) -> Int) -> Int {
    return op(num)
}

/*
func genericCalc (num: Int..., op: String) -> Int {
var result = 0
switch op {
case "+":
result = arrayAdd(num)
case "*":
result = arrayMult(num)
case "avg":
result = arrayAvg(num)
case "count":
result = arrayCount(num)
default:
print("Woah guys, I need an operator!")
}
return result
}*/

//adds two points together
func addPoint (p1: (x1: Int!, y1: Int!), p2: (x2: Int!, y2: Int!)) -> (Int, Int) {
    return (add(p1.x1, p2.x2), add(p1.y1, p2.y2))
}

//subtracts second point from first point
func subPoint (p1: (x1: Int!, y1: Int!), p2: (x2: Int!, y2: Int!)) -> (Int, Int) {
    return (sub(p1.x1, p2.x2), sub(p1.y1, p2.y2))
}

var response = input()

while response.lowercaseString.containsString("y") {
    print("Enter an expression separated by returns:")
    print("(Options for larger sets: count, avg, mult, add)")
    print("Enter sets in format: 1 2 3 avg")
    print("I can calculate points for you too, type \"point\"")
    
    var expression = input() // first thing user typed
    var val1: Int! = 0 //storage value for simple calculation
    var val2: Int! = 0 //storage value for simple calculation
    var operation = "" //stored operator
    var result = 0
    
    if expression.containsString("point") {
        /*var p1: (Int!, Int!) = (1,2)
        var p2: (Int!, Int!) = (3,4)
        print("Lets start with two points; \(p1), \(p2)")
        let res: (Int!, Int!) = addPoint(p1, p2: p2)
        print("Lets add the points! \(res)")
        var p3: (Int!, Int!) = (5,6)
        print("Lets make a new point; \(p3)")
        print("Lets subtract our two points! \(subPoint(res, p2: p3))")
        print("Now you try!")*/
        print("use a dictionary?")
        var useDict = input()
        
        print("first point? no parantheses please! (eg: 1,2)")
        var pointStr = input()
        if !pointStr.containsString(",") {
            print("do you want your y-value to be zero?")
            var resp = input()
            if resp.containsString("y") {
                pointStr += ",0"
            } else {
                print("y-value?")
                pointStr += input()
            }
        }
        var firstVal = pointStr.substringToIndex(pointStr.rangeOfString(",")!.startIndex)
        pointStr = pointStr.substringFromIndex(pointStr.rangeOfString(",")!.endIndex)
        var x1: Int! = 0
        var y1: Int! = 0
        while pointStr.containsString(",") {
            print("woah, sorry, but I can only handle 2D points")
            print("what do you want the second value to be?")
            pointStr = input()
        }
        if firstVal.containsString(".") {
            print("I'm sorry but you have to use whole numbers")
            print("I'm going to round your numbers")
            x1 = Int(round(Double(firstVal)!))
        } else {
            x1 = Int(firstVal)
        }
        if pointStr.containsString(".") {
            print("I'm sorry but you have to use whole numbers")
            print("I'm going to round your numbers")
            y1 = Int(round(Double(pointStr)!))
        } else {
            y1 = Int(pointStr)
        }
        
        print("second point? no parantheses please! (eg: 1,2)")
        var pointStr2 = input()
        if !pointStr2.containsString(",") {
            print("do you want your y-value to be zero?")
            var resp = input()
            if resp.containsString("y") {
                pointStr2 += ",0"
            } else {
                pointStr2 += input()
            }
        }
        var firstVal2 = pointStr2.substringToIndex(pointStr2.rangeOfString(",")!.startIndex)
        pointStr2 = pointStr2.substringFromIndex(pointStr2.rangeOfString(",")!.endIndex)
        var x2: Int! = 0
        var y2: Int! = 0
        while pointStr2.containsString(",") {
            print("woah, sorry, but I can only handle 2D points")
            print("what do you want the second value to be?")
            pointStr2 = input()
        }
        if firstVal2.containsString(".") {
            print("I'm sorry but you have to use whole numbers")
            print("I'm going to round your numbers")
            x2 = Int(round(Double(firstVal2)!))
        } else {
            x2 = Int(firstVal2)
        }
        if pointStr2.containsString(".") {
            print("I'm sorry but you have to use whole numbers")
            print("I'm going to round your numbers")
            y2 = Int(round(Double(pointStr2)!))
        } else {
            y2 = Int(pointStr2)
        }
        
        print("+ or - ?")
        var oper = input()
        
        if useDict.containsString("y") {
            let point1 = [
                "x": x1,
                "y": y1
            ]
            let point2 = [
                "x": x2,
                "y": y2
            ]
            switch oper {
            case "+":
                var total = addPoint((point1["x"]!, point1["y"]!), p2: (point2["x"]!, point2["y"]!))
                print("Result: \(total)")
            case "-":
                var total = subPoint((point1["x"]!, point1["y"]!), p2: (point2["x"]!, point2["y"]!))
                print("Result: \(total)")
            default:
                print("Woah, I can only add or subtract points...")
            }
        } else {
            
            let point1: (Int!, Int!) = (x1, y1)
            let point2: (Int!, Int!) = (x2, y2)
            switch oper {
            case "+":
                var output = addPoint(point1, p2: point2)
                print("Result: \(output)")
            case "-":
                var output = subPoint(point1, p2: point2)
                print("Result: \(output)")
            default:
                print("Woah, I can only add or subtract points...")
            }
        }
    } else if expression.containsString(" ") {
        var set = [Int]()
        var index = expression.rangeOfString(" ")!.endIndex
        var value: Int! = Int(expression.substringToIndex(expression.rangeOfString(" ")!.startIndex))
        set.append(value)
        expression = expression.substringFromIndex(index)
        while expression.containsString(" ") {
            index = expression.rangeOfString(" ")!.endIndex
            value = Int(expression.substringToIndex(expression.rangeOfString(" ")!.startIndex))
            set.append(value)
            expression = expression.substringFromIndex(index)
        }
        var result = 0
        switch expression {
        case "add":
            result = generalCalc(set, op: arrayAdd)
            print("Result: \(result)")
        case "avg":
            result = generalCalc(set, op: arrayAvg)
            print("Result: \(result)")
        case "count":
            result = generalCalc(set, op: arrayCount)
            print("Result: \(result)")
        case "mult":
            result = generalCalc(set, op: arrayMult)
            print("Result: \(result)")
        default:
            print("I didn't say I could do that!")
        }
    } else {
        val1 = Int(expression)
        operation = input()
        val2 = Int(input())
        switch operation {
        case "+":
            result = calc(val1, right: val2, op: add)
        case "-":
            result = calc(val1, right: val2, op: sub)
        case "/":
            result = calc(val1, right: val2, op: div)
        case "*":
            result = calc(val1, right: val2, op: mult)
        default:
            print("Woah guys, I need an operator!")
        }
        print("Result: \(result)")
    }
    
    print("")
    print("Need me to calculate something?")
    response = input()
}

print("")
print("May the triforce be with you!")
