import Foundation

/*
 * Complete the 'superDigit' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. STRING n
 *  2. INTEGER k
 */

func superDigit(n: String, k: Int) -> Int {
    var superNumber = ""
    var newSuperNumber = 0
    
    n.forEach { number in
        newSuperNumber += Int(String(number)) ?? 0
    }
    superNumber = String(newSuperNumber * k)
    
    var superDigit = 0
    var hasDigitToCalculate = true
    while hasDigitToCalculate {
        if superNumber.count == 1 {
            superDigit = Int(superNumber) ?? 0
            hasDigitToCalculate = false
            
            break
        }
        
        newSuperNumber = 0
        superNumber.forEach { number in
            newSuperNumber += Int(String(number)) ?? 0
        }
        
        superNumber = String(newSuperNumber)
    }
    
    return superDigit   
}

let result = superDigit(n: "123", k: 3)
print(result, result == 9)

let result2 = superDigit(n: "9875", k: 4)
print(result2, result2 == 8)