let input = readLine()!

var numStr = ""
var numArr = [Int]()
var signArr = [Character]()
var preMinous = false
var result = 0

for c in input {
    if c == "+" {
        numArr.append(Int(numStr)!)
        numStr = ""
        if preMinous {
            signArr.append("-")
        } else {
            signArr.append(c)
            preMinous = false
        }
    }
    else if c == "-" {
        numArr.append(Int(numStr)!)
        numStr = ""
        signArr.append(c)
        preMinous = true
    }
    else {
        numStr.append(c)
    }
}

numArr.append(Int(numStr)!)
result = numArr[0]

for i in 0..<signArr.count {
    if signArr[i] == "+" {
        result += numArr[i + 1]
    } else {
        result -= numArr[i + 1]
    }
}
print(result)
