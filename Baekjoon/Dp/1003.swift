let n = Int(readLine()!)!


for _ in 0..<n {
    let input = Int(readLine()!)!
    var arr = [(Int, Int)](repeating: (0, 0), count: input + 1)
    
    if input == 0 {
        print("1 0")
        continue
    }
    
    else if input == 1 {
        print("0 1")
        continue
    }
    
    else {
        arr[0] = (1, 0)
        arr[1] = (0, 1)
        for i in 2...input {
            arr[i].1 = arr[i-1].0 + arr[i-1].1
            arr[i].0 = arr[i-1].1
        }
    }
    
    print("\(arr[input].0) \(arr[input].1)")
}
