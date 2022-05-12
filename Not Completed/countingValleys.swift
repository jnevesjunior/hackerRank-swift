import Foundation

/*
 * Complete the 'countingValleys' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER steps
 *  2. STRING path
 */

func countingValleys(steps: Int, path: String) -> Int {
    var valleysCount = 0

    var upStepsCount = 0
    var downStepsCount = 0
    
    path.enumerated().forEach { (index, step) in
        if step == "U" {
            if downStepsCount > 0 {
                downStepsCount -= 1
            } else {
                upStepsCount += 1   
            }
        }
        
        if step == "D" {
            if upStepsCount > 0 {
                upStepsCount -= 1
            } else {
                downStepsCount += 1
                
                var countNextStepUp = 0
                for nextIndex in index...(index + downStepsCount) {
                    if Array(path)[nextIndex] == "U" {
                        countNextStepUp += 1
                    }
                }
                
                if countNextStepUp == downStepsCount {
                    valleysCount += 1
                }
            }
        }
    }
    
    return valleysCount
}

let result = countingValleys(steps: 8, path: "UDDDUDUU")
print(result, result == 1)

let result2 = countingValleys(steps: 12, path: "DDUUDDUDUUUD")
print(result2, result2 == 2)

let result3 = countingValleys(steps: 1000000, path: "") // timeout with big values
print(result3, result3 == 398)