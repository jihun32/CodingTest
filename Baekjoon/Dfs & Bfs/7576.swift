let input = readLine()!.split(separator: " ").map { Int($0)! }

let row = input[1]
let col = input[0]

var graph = [[Int]]()
var queue = [(Int, Int)]()
var dx = [1, -1, 0, 0]
var dy = [0 , 0, 1, -1]
var result = 0

for _ in 0..<row {
    graph.append(readLine()!.split(separator: " ").map { Int($0)!} )
}

for i in 0..<row {
    for j in 0..<col {
        if graph[i][j] == 1 {
            queue.append((j, i))
        }
    }
}

var idx = 0
func bfs() {

    while idx < queue.count {
        let cordinate = queue[idx]
        idx += 1
        
        let qx = cordinate.0
        let qy = cordinate.1
        for i in 0..<4 {
            var nx = qx
            var ny = qy
            nx += dx[i]
            ny += dy[i]
            if ny < 0 || ny == row || nx < 0 || nx == col {
                continue
            }
            
            if graph[ny][nx] == -1 {
                continue
            }
            
            if graph[ny][nx] == 0 {
                graph[ny][nx] = graph[qy][qx] + 1
                queue.append((nx,ny))
            }
        }
        
        
    }
}

bfs()

if graph.flatMap({ $0 }).contains(0) {
    print("-1")
} else {
    result = graph.flatMap { $0 }.max()!
    print(result - 1)
}
