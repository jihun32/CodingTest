let n = Int(readLine()!)!

var words = Set<String>()
var result = [String]()
for _ in 0..<n {
    words.insert(readLine()!)
}
result = words.sorted {
    if $0.count == $1.count {
        return $0 < $1
    } else {
        return $0.count < $1.count
    }
}

result.forEach { print($0) }
