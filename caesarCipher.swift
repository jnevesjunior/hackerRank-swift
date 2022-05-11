import Foundation

/*
 * Complete the 'caesarCipher' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts following parameters:
 *  1. STRING s
 *  2. INTEGER k
 */

func caesarCipher(s: String, k: Int) -> String {
    let originalArray = ["a", "b", "c", "d", "e", 
                        "f", "g", "h", "i", "j", 
                        "k", "l", "m", "n", "o",
                        "p", "q", "r", "s", "t", 
                        "u", "v", "w", "x", "y", "z"]
                        
    let originalUppercasedArray = ["A", "B", "C", "D", "E", 
                                    "F", "G", "H", "I", "J", 
                                    "K", "L", "M", "N", "O", 
                                    "P", "Q", "R", "S", "T", 
                                    "U", "V", "W", "X", "Y", "Z"]
                        
                        
    let originalArrayCount = originalArray.count
        
    var rotatedArray = [String](repeating: "", count: originalArrayCount)
    var rotatedUppercasedArray = [String](repeating: "", count: originalArrayCount)
    
    originalArray.enumerated().forEach { (index, item) in
        let factor = k > originalArrayCount ? 
        (k.quotientAndRemainder(dividingBy: originalArrayCount).remainder) : k
        var newIndex = index - factor  
        
        if newIndex < 0 {
            newIndex += originalArrayCount 
        }
        
        rotatedArray[newIndex] = item
        rotatedUppercasedArray[newIndex] = item.uppercased()
    }
    
    var finalString = ""
    
    s.enumerated().forEach { (_, character) in
        let stringCharacter = String(character)
        
        
        if originalArray.contains(stringCharacter) {
            let indexOnrRotatedArray = originalArray.firstIndex(of: stringCharacter) ?? -1
            
            finalString += rotatedArray[indexOnrRotatedArray]
        } else if originalUppercasedArray.contains(stringCharacter) {
            let indexOnrRotatedArray = originalUppercasedArray.firstIndex(of: stringCharacter) ?? -1
            
            finalString += rotatedUppercasedArray[indexOnrRotatedArray]
        } else {
            finalString += stringCharacter
        }
    }
    
    return finalString
}


let testResult1 = caesarCipher(s: "middle-Outz", k: 2)
print(testResult1, testResult1 == "okffng-Qwvb")
let testResult2 = caesarCipher(s: "Always-Look-on-the-Bright-Side-of-Life", k: 5)
print(testResult2, testResult2 == "Fqbfdx-Qttp-ts-ymj-Gwnlmy-Xnij-tk-Qnkj")
let testResult3 = caesarCipher(s: "www.abc.xy", k: 87)
print(testResult3, testResult3 == "fff.jkl.gh")
