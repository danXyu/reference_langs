/* Swift Playground: This file will include my journey through discovery the nuances and secrets
 * for programming in swift. It will be invaluable for my future projects because it will act as
 * a reference point. If I need to remember how to do a certain task, this file will help! The 
 * playground is perfect for this task because you can see immediate output on the right.
 *
 * Date: 2/6/2015
 * Name: Dan X. Yu
 */

// UIKit provides crucial infrastructure: window, view architecture, event handling, app model, etc.
import UIKit

// Variables are invoked with var and constants with let. You also rarely need to declare the types.
// This is due to swift's type safety adn type inference at initialization of a variable.
var someNum: Int = 15
var someName: String = "Dan Yu!"
let constantName: String = "Dan Dan"

// Swift's type safety doesn't allow changing the type of a variable past declaration.
someNum = Int(4.33)

// Swift uses string interpolation to include a variable or constant inside a longer string.
println("The value of someNum is \(someNum)")

// You must explicitly convert integers and floating points.
let newNum = Double(someNum) + 0.555

// One great feature about Swift is the use of tuples, or pairs of values.
let httpTuple = (404, "Page not found")
println("First value is \(httpTuple.0) and second value is \(httpTuple.1)")

// Or store those tuple values in a new set of variables.
let (httpErrorCode, httpErrorMessage) = httpTuple
println("First value is \(httpErrorCode) and second value is \(httpErrorMessage)")

// Now I have to learn about and really understand optionals, which are kind of confusing.
let possibleNum = "1234"
let convertedNum = possibleNum.toInt()
var newPossibleNum = "54321"
var convertedNewNum = newPossibleNum.toInt()

// The "Some" keyword in the console is used to designate an optional, I assume.
print("This is an optional \(convertedNum) and this is it's value \(convertedNum!)")

// You should use optionals if it's possible for one of your variables to be nil-valued.
convertedNewNum = nil

// Check to see if an optional has a value by comparing it with nil.
if convertedNewNum == nil {
    println("The number is nil")
} else {
    println("The value of convertedNewNum is \(convertedNewNum)")
}

// This is important because trying to unwrap a non-existent optional value be a runtime error.
//println("The value of convertedNewNum is \(convertedNewNum!)")

// This ties into optional binding, which makes a value available as a temporary variable/constant,
// but only if the optional actually contains a value.
if let someConstant = possibleNum.toInt() {
    println("\(possibleNum) has an integer value of \(someConstant)")
} else {
    println("\(possibleNum) is nil-valued")
}

// ^This above code actually sets someConstant to the value contained in possibleNum.

// Implicitly unwrapped optionals use exclamation marks, meaning the optional
// can always be assumed to have a value.
var assumedString: String! = "This is it's starting value"
let firstString: String = assumedString
assumedString = nil
// let secondString: String = assumedString, produced an error because it has no value.
// You shouldn't use the implicitly unwrapped if it's possible it could become nil.

// Use assertions if you need to ensure a value meets a specification.
let numOne: Int = 3
assert(numOne >= 0, "The number must be positive")

// The nil coalescing operator is interesting, allows unwrapping or default values.
var a: Int? = Optional(3)
var nextNum = (a != nil ? a! : 5)
var nilcoalescing = a ?? 5

// Closed range.
for index in 1...5 {
    println(index)
}

// Half-Open range.
for index in 1..<5 {
    println(index)
}

// There are two ways to declare an array. The shorthand way is preferred.
var someArray: [String] = [String]()
var anotherArray: [String] = Array<String>()

// Swift gives an awesome way to grab a subarray of an array.
someArray = ["Eggs", "Cheese", "Fin", "food", "helly"]
anotherArray += someArray[2...4]

// There are two ways to declare a dictionary. The shorthand way is preferred.
var firstDic: [Int: String] = [Int: String]()
var secondDic: [Int: String] = Dictionary<Int, String>()

// This shows how switch can create temporary variables for calling.
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    println("on the x-axis with an x value of \(x)")
case (0, let y):
    println("on the y-axis with a y value of \(y)")
case let (x, y):
    println("somewhere else at (\(x), \(y))")
}

// Swift can also look for additional conditions using where.
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    println("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    println("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    println("(\(x), \(y)) is just some arbitrary point")
}

// Swift control transfer statements.
// continue: stop current loop iteration and go to next iteration.
// break: exit the current loop.
// fallthrough: allow control flow to move to next case (switch).
// return: returns control to parent call.

























