let input = readLine()!.split(separator: " ").map { Int($0)! }
let start = input[0]
let destination = input[1]

var graph = [[Int]](repeating: [], count: 100001)
var queue = [Int]()
var visited = [Bool](repeating: false, count: 100001)
var idx = 0

graph[0] = [1]
graph[1] = [0, 2]

for i in 2...100000 {
    graph[i].append(i - 1)
    graph[i].append(i + 1)
    graph[i].append(i * 2)
}

var result = [Int](repeating: 0, count: 100001)


func bfs() {
    if start != destination {
        queue.append(start)
        
        while idx < queue.count {
            let node = queue[idx]
            idx += 1
            if node == destination { break }
            for val in graph[node] {
                if val <= 100000 && !visited[val] {
                    result[val] = result[node] + 1
                    visited[val] = true
                    queue.append(val)
                }
            }
        }
    }
}

bfs()
print(result[destination])
