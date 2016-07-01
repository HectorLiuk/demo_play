//: Playground - noun: a place where people can play

import UIKit

var str = "柯里化 (Currying)"

//两个参数不是在一个括号内
func addTwoNumbers(a: Int)(num: Int) -> Int {
    return a + num
}

let addToFour = addTwoNumbers(4)    // addToFour 是一个 Int -> Int
let result = addToFour(num: 6)      // result = 10”
