struct Heap<T: Comparable> {
    var heap: Array<T> = []
    
    init() { }
    
    init (_ data: T) {
        //실제 인덱스는 1부터이므로 1부터 하기 위해 두 번 추가
        heap.append(data)
        heap.append(data)
    }
    
    func isEmpty() -> Bool {
        return heap.count == 1
    }
    
    mutating func insert(_ data: T) {
        if heap.count == 0 {
            heap.append(data)
            heap.append(data)
            
            return
        }
        
        heap.append(data)
        
        minSwap(heap.count - 1)
    }
    
    mutating func minSwap(_ index: Int) {
        var insertIndex = index
        var parentIndex = insertIndex / 2
        
        while parentIndex > 0 && heap[insertIndex] < heap[parentIndex] {
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
            parentIndex = insertIndex / 2
        }
    }
    
    mutating func pop() -> T? {
        if heap.count == 1 { return nil }
        
        heap.swapAt(1, heap.count - 1)
        let value = heap.removeLast()
        
        moveDown()
        
        return value
    }
    
    mutating func moveDown() {
        var currentIndex = 1
        
        while true {
            let leftChildIndex = 2 * currentIndex
            let rightChildIndex = 2 * currentIndex + 1
            var smallest = currentIndex
            
            if leftChildIndex < heap.count && heap[leftChildIndex] < heap[smallest] {
                smallest = leftChildIndex
            }
            
            if rightChildIndex < heap.count && heap[rightChildIndex] < heap[smallest] {
                smallest = rightChildIndex
            }
            
            if smallest != currentIndex {
                heap.swapAt(currentIndex, smallest)
                currentIndex = smallest
            } else {
                break
            }
        }
    }
}

struct EdgeData : Comparable{
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
    }
    
    var cost : Int
    var node : Int
}

let input = readLine()!.split(separator: " ").map { Int($0)! }


let v = input[0]
let e = input[1]
let startNode = Int(readLine()!)!
let INF = 2147483647

var queue = Heap<EdgeData>(EdgeData(cost: 0, node: startNode))
var graph = Array(repeating: [(Int,Int)]() , count: v + 1)
var table = [Int](repeating: INF, count: v + 1)

for _ in 0..<e {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    graph[info[0]].append((info[1], info[2]))
}

func dijkstra(_ startNode: Int) {
    table[startNode] = 0
    while !queue.isEmpty() {
        guard let data = queue.pop() else { return }
        if table[data.node] < data.cost { continue }
        
        for node in graph[data.node] {
            let value = node.1 + data.cost
            if table[node.0] > value {
                table[node.0] = value
                queue.insert(EdgeData(cost: value, node: node.0))
            }
        }
    }
}

dijkstra(startNode)
for i in 1..<table.count {
    if table[i] != INF {
        print(table[i])
    } else { print ("INF") }
}



