let computerCount = Int(readLine()!)!
let lineCount = Int(readLine()!)!
var map: [[Int]] = Array(repeating: [], count: computerCount + 1)
var stack = [Int]()
var visited: [Bool] = Array(repeating: false, count: computerCount + 1)
var result = [Int]()

for _ in 0..<lineCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let start = input[0]
    let end = input[1]
    
    if start != 1 {
        map[start].append(end)
        map[end].append(start)
    } else {
        map[start].append(end)
    }
}

for i in 0..<map.count {
    map[i].sort()
}

dfs(1)

func dfs(_ node: Int) {
    
    result.append(node)
    visited[node] = true
    for i in map[node] {
        if !visited[i] {
            dfs(i)
        }
    }
}

print(result.count - 1)

