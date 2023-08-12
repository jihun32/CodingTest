let input = readLine()!.split(separator: " ").map { Int($0)! }

let nodeCount = input[0]
let lineCount = input[1]
let startNode = input[2]

var visitedArray = Array(repeating: false, count: nodeCount + 1)
var graph: [[Int]] = Array(repeating: [], count: nodeCount + 1)
var result = [Int]()
var queue = [Int]()

for _ in 0..<lineCount {
    var start: Int = 0
    var end: Int = 0
    let inputGraph = readLine()!.split(separator: " ").map { Int($0)! }
    
    start = inputGraph[0]
    end = inputGraph[1]
    
    graph[end].append(start)
    graph[start].append(end)
    
}

for i in 0..<graph.count {
    graph[i].sort()
}

dfs(startNode)

func dfs(_ node: Int) {
    visitedArray[node] = true
    result.append(node)
    
    for i in graph[node] {
        if !visitedArray[i] {
            dfs(i)
        }
    }
}

result.forEach { print($0, terminator: " ") }
print("")

bfs(startNode)

func bfs(_ node: Int) {
    result = []
    visitedArray = Array(repeating: false, count: nodeCount + 1)
    
    var currentNode = node
    queue.append(node)
    visitedArray[node] = true
    
    while !queue.isEmpty {
        currentNode = queue[queue.indices].popFirst()!
        result.append(currentNode)
        
        for i in graph[currentNode] {
            if !visitedArray[i] {
                visitedArray[i] = true
                queue.append(i)
            }
        }
    }
}
result.forEach { print($0, terminator: " ") }
