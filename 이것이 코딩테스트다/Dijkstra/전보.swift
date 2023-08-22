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
let startCity = input[2]
let INF = 100000000

var cityGraph = [[(Int, Int)]](repeating: [(Int, Int)](), count: v + 1)
var table = [Int](repeating: INF, count: v + 1)
var heap = Heap<EdgeData>(EdgeData(cost: 0, node: startCity))

for _ in 0..<e {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    cityGraph[info[0]].append((info[2], info[1]))
}

print(table)

func dijkstra(_ startCity: Int) {
    table[startCity] = 0
    
    while !heap.isEmpty() {
        guard let data = heap.pop() else { return }
        
        if table[data.node] < data.cost { continue }
        
        for node in cityGraph[data.node] {
            let value = node.0 + data.cost
            
            if value < table[node.1] {
                heap.insert(EdgeData(cost: value, node: data.node))
                table[node.1] = value
            }
        }
    }
}
 
dijkstra(startCity)

table = table.filter { $0 < 100000000 && $0 > 0 }
print("\(table.count) \(table.max()!)")
