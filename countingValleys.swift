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
    var count = 0 
    var level = 0
    
    path.forEach { step in
        
        if step == "U" {
            level += 1 
        } else {
            level -= 1
            if level == -1 {
                count += 1
            }
        }
    }
    
    return count
}

let result = countingValleys(steps: 8, path: "UDDDUDUU")
print(result, result == 1)

let result2 = countingValleys(steps: 12, path: "DDUUDDUDUUUD")
print(result2, result2 == 2)