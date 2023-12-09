import Foundation

/*
 * Complete the 'birthdayCakeCandles' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER_ARRAY candles as parameter.
 */

func birthdayCakeCandles(candles: [Int]) -> Int {
    var count = 0
    var bigger: Int?
    
    candles
        .sorted(by: { $0 > $1 })
        .forEach { currentCandle in
        if let bigger = bigger {
            if bigger == currentCandle {
                count += 1
            } else {
                return
            } 
        } else {
            bigger = currentCandle
            count = 1
        }
    }
    
    return count
}

let result = birthdayCakeCandles(candles: [3, 2, 1, 3])
print(result, result == 2)

let result2 = birthdayCakeCandles(candles: [4, 3, 2, 1, 3, 4, 4])
print(result2, result2 == 3)