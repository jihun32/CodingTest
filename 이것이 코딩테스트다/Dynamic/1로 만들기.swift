let n = Int(readLine()!)!
var arr = [Int](repeating: -1, count: n + 1)

func makeToOne(_ n: Int) -> Int {
    if n == 1 {
        return 0
    }
    
    if arr[n] != -1 {
        return arr[n]
    }
    
    var minOperations = makeToOne(n - 1) + 1
    
    if n % 2 == 0 {
        minOperations = min(minOperations, makeToOne(n / 2) + 1)
    }
    
    if n % 3 == 0 {
        minOperations = min(minOperations, makeToOne(n / 3) + 1)
    }
    
    if n % 5 == 0 {
        minOperations = min(minOperations, makeToOne(n / 5) + 1)
    }
    
    arr[n] = minOperations
    return minOperations
}


print(makeToOne(n))
