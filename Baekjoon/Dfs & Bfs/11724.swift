let input = readLine()!.split(separator: " ").map { Int($0)! }

let nodeCount = input[0]
let lineCount = input[1]

var graph = [[Int]](repeating: [], count: nodeCount + 1)
var visited = [Bool](repeating: false, count: nodeCount + 1)
var result = [Int]()
var count = 0
for _ in 0..<lineCount {
    let info = readLine()!.split(separator: " ").map { Int($0)!}
    
    graph[info[0]].append(info[1])
    graph[info[1]].append(info[0])
}

func dfs(_ node: Int ) {
    visited[node] = true
    result.append(node)
    
    for val in graph[node] {
        if !visited[val] {
            dfs(val)
        }
    }
}

for i in 1...nodeCount {
    if !visited[i] {
        dfs(i)
        count += 1
    }
}

print(count)
