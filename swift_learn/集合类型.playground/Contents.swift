//: Playground - noun: a place where people can play

import UIKit

var str = "集合类型"


var array1 = [Int]()

    array1.append(3)
    array1 = []

if array1.isEmpty {
    print("是空")
}

//对数组初始化  现在是一个存储字符串的空数组   它被创建 没有数据
var array2 = [String]()
if array2.isEmpty{
    print("是空")
}else{
    print("非空")
}


//创建带有默认值的数组
var array3 = [Int](count: 3, repeatedValue: 10)

//合并两个素组
var array4 = [String](count: 3, repeatedValue: "12")
var array5 = [String](count: 3, repeatedValue: "21")
var heArray = array4 + array5

//遍历素组  使用元组方法
for (index,value) in heArray.enumerate(){
    print(index,value)
}


//创建字典
var dic0 = [:]



var dic1 = [String:String]()

var dic2 : [String:String] = ["1":"xxx","2":"qqq"]
    dic2["1"]
print(dic2["0"])
if dic2["0"] == nil{
    
}else{
    print("不空")
}
var ss : String?

if ss != nil {
    print("不空")

}
var  sss = "ss"



print(dic0)
print(dic1)


//setter 方法
class StepCounter {
    var totalSteps: Int = 0 {
        
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }

    }
}

var peopleCount = StepCounter()
peopleCount.totalSteps = 200


struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        print(x)
        print(self.x)
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    print("This point is to the right of the line where x == 1.0")
}






