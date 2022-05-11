import Foundation

/*
 * Complete the 'fizzBuzz' function below.
 *
 * The function accepts INTEGER n as parameter.
 */

func fizzBuzz(n: Int) -> Void {
    for item in 1...n {
        
        let isMultipleBy3 = item % 3 == 0
        let isMultipleBy5 = item % 5 == 0
        let isMultipleBy3and5 = isMultipleBy3 && isMultipleBy5
        
        if isMultipleBy3and5 {
            print("FizzBuzz")
        } else if isMultipleBy3 {
            print("Fizz")
        } else if isMultipleBy5 {
            print("Buzz")
        } else {
            print(item)
        }
        
    }
    
}
