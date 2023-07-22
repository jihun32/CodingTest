let n = Int(readLine()!)!

var arrA = readLine()!.split(separator: " ").map { Int($0)! }
let arrB = readLine()!.split(separator: " ").map { Int($0)! }

var changedArrB = arrB
var changedArrA = arrA
var result = 0

for _ in 0..<arrB.count {
    
    let minA = changedArrA.min()!
    let idxB = changedArrB.firstIndex(of: changedArrB.max()!)!
    let idxA = changedArrA.firstIndex(of: minA)!
    
    arrA[idxB] = minA
    changedArrB[idxB] = -1
    changedArrA[idxA] = 101
}

for (a, b) in zip(arrA, arrB) {
    result += a * b
}

print(result)
