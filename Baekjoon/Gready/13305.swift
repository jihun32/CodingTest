let n = Int(readLine()!)!

let roadLens = readLine()!.split(separator: " ").map { Int($0)! }
var costs = readLine()!.split(separator: " ").map { Int($0)! }

var min = costs[0]
var result = 0

for i in 0..<roadLens.count {
    min = costs[i] < min ? costs[i] : min
    
    result += min * roadLens[i]
}

print(result)
