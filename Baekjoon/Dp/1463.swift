let input = Int(readLine()!)!

var dn = [Int](repeating: 0, count: input + 1)

if input != 1 {
    for i in 2...input {
        dn[i] = dn[i - 1] + 1
        
        if i % 3 == 0 {
            dn[i] = min(dn[i], dn[i / 3] + 1)
        }
        if i % 2 == 0 {
            dn[i] = min(dn[i], dn[i / 2] + 1)
        }
    }
}

print(dn[input])
