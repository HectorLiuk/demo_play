//: Playground - noun: a place where people can play

import UIKit

var str = "学习字符串和字符"

//循环字符串获取每个字符
for Character in "dog".characters{
    print(Character)
}

let characters: [Character] = ["c","a","t","!"]
print(String(characters))

//拼接字符串
let str1 = "hello"
let str2 = "world"
print(str1+str2)

var str3 = str1 + str2
let char : Character = "!"
    str3.append(char)

//字符串插入
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//字符串索引
str3.startIndex





