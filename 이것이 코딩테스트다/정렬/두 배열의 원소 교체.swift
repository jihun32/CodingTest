let input = readLine()!.split(separator: " ").map{ Int($0)! }

let n = input[0]
let k = input[1]

var arr1 = readLine()!.split(separator: " ").map { Int($0)! }
var arr2 = readLine()!.split(separator: " ").map { Int($0)! }


for _ in 0..<k {
    let min = arr1.min()!
    let max = arr2.max()!
    
    let arr1Index = arr1.firstIndex(of: min)!
    let arr2Index = arr2.firstIndex(of: max)!
    
    arr1[arr1Index] = max
    arr2[arr2Index] = min
}

print(arr1.reduce(0, +))

