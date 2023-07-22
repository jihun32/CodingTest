let n = Int(readLine()!)!

var times = [[Int]]()
var result = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    times.append([input[0], input[1]])
}


times.sort { (firstArray, secondArray) -> Bool in
    if firstArray[1] == secondArray[1] {
        return firstArray[0] < secondArray[0]
    } else {
        return firstArray[1] < secondArray[1]
    }
}

var end = -1

for i in 0..<times.count {
    if times[i][0] >= end {
        result += 1
        end = times[i][1]
    }
}
print(result)
