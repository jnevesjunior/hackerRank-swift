import Foundation

/*
 * Complete the 'sockMerchant' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER n
 *  2. INTEGER_ARRAY ar
 */

func sockMerchant(n: Int, ar: [Int]) -> Int {
    var socksMap = [Int: Int]()
    
    ar.forEach { colorNumber in 
        if let count = socksMap[colorNumber] {
            socksMap[colorNumber] = count + 1 
        } else {
            socksMap[colorNumber] = 1
        }
    }
    
    var countColorsWithoutPair = 0 
    
    socksMap.forEach { (_, colorCount) in
        let remainder = colorCount
                                .quotientAndRemainder(dividingBy: 2)
                                .remainder
                                
        var currentCountColorsWithoutPair = colorCount
        if remainder != 0 {
            currentCountColorsWithoutPair -= 1
        }
        
        countColorsWithoutPair += currentCountColorsWithoutPair / 2
    }

    return countColorsWithoutPair
}

let result = sockMerchant(n: 9, ar: [10, 20, 20, 10, 10, 30, 50, 10, 20])
print(result, result == 3)

let result1 = sockMerchant(n: 10, ar: [1, 1, 3, 1, 2, 1, 3, 3, 3, 3])
print(result1, result1 == 4)