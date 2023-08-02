let n = Int(readLine()!)!

var stacks = [Int]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    switch input[0] {
    case "push":
        stacks.append(Int(input[1])!)
    case "top":
        print(stacks.last ?? -1)
    case "size":
        print(stacks.count)
    case "empty":
        print(stacks.isEmpty == true ? 1 : 0)
    case "pop":
        print(stacks.popLast() ?? -1)
    default:
        break
    }
}
