import UIKit



var massiv = [24,44,56,1,33,6]
var dict = [Int:Int]()


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int:Int]()
    for (i, n) in nums.enumerated() {
        print("___________")
        if let last = dict[target - n] {
            print(dict)
            print(dict[target - n])
            return [last, i]
        }
        dict[n] = i // 0, 1, 2, 3,
        print(dict)
        print(dict[n])
    }
    return []
}

twoSum(massiv, 30)
