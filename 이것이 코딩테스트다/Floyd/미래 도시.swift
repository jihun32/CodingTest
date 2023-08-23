let input = readLine()!.split(separator: " ").map{ Int($0)! }

let company = input[0]
let line = input[1]
let INF = 100000
var graphs = [[Int]](repeating: [Int](repeating: INF, count: company + 1), count: company + 1)
var i = 1
for _ in 0..<line {
    let graph = readLine()!.split(separator: " ").map { Int($0)! }
    graphs[graph[0]][graph[1]] = 1
    graphs[graph[1]][graph[0]] = 1
    if i <= company {
        graphs[i][i] = 0
        i += 1
    }
}

let viaInput = readLine()!.split(separator: " ").map { Int($0)! }
let via = viaInput[1]
let destination = viaInput[0]

func fluid() {
    for k in 1...company {
        for a in 1...company {
            for b in 1...company {
                graphs[a][b] = min(graphs[a][b], graphs[a][k] + graphs[k][b])
            }
        }
    }
}

fluid()
let value = graphs[1][via] + graphs[via][destination]

if value >= 100000 {
    print("-1")
} else { print(value) }

