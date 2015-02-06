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





