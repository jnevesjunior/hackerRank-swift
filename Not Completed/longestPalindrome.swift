import Foundation

/*
Given a string s, return the longest palindromic substring in s.

Example 1:
Input: s = "babad"
Output: "bab"
Explanation: "aba" is also a valid answer.

Example 2:
Input: s = "cbbd"
Output: "bb"
 
Constraints:

1 <= s.length <= 1000
s consist of only digits and English letters.
*/
func longestPalindrome(_ s: String) -> String {

    let stringArray = Array(s)
    guard stringArray.count > 1 else { return s }

    if stringArray.count == 2 {
        let first = String(s.dropLast())
        return first == String(s.dropFirst()) ? s : first
    }

    var longest = ""

    let mid = stringArray.count / 2
    let firstHalf = Array(stringArray[0...mid - 1])
    let lastHalf = Array(stringArray[mid...stringArray.count - 1])
    if firstHalf == lastHalf || firstHalf == lastHalf.reversed() {
        return s
    }

    for (index, item) in stringArray.enumerated() {

        let stringItem = String(item)
        
        var previousIndex = index - 1
        var nextIndex = index + 1

        var currentPlaindromic = stringItem

        var canUseSecondCompare = true
        while previousIndex >= 0 && nextIndex <= (stringArray.count - 1) {
            let previousItem = String(stringArray[previousIndex])
            let nextItem = String(stringArray[nextIndex])

            if previousItem == nextItem {
                canUseSecondCompare = false
                currentPlaindromic = previousItem + currentPlaindromic + nextItem

                previousIndex -= 1
                nextIndex += 1
            } else if canUseSecondCompare && (stringItem == nextItem) {
                canUseSecondCompare = false
                currentPlaindromic = stringItem + stringItem
                
                nextIndex += 1
            } else if canUseSecondCompare && (previousItem == stringItem || stringItem == nextItem) {
                canUseSecondCompare = false
                currentPlaindromic = stringItem + stringItem
                break
            } else {
                break
            }
        }

        if currentPlaindromic.count > longest.count {
            longest = currentPlaindromic
        }
    }

    return longest
}

let result = longestPalindrome("aaaa")
print(result, result == "aaaa")

let result1 = longestPalindrome("222020221")
print(result1, result1 == "2202022")

let result2 = longestPalindrome("babaddtattarrattatddetartrateedredividerb")
print(result2, result2 == "ddtattarrattatdd")

let result3 = longestPalindrome("anugnxshgonmqydttcvmtsoaprxnhpmpovdolbidqiyqubirkvhwppcdyeouvgedccipsvnobrccbndzjdbgxkzdbcjsjjovnhpnbkurxqfupiprpbiwqdnwaqvjbqoaqzkqgdxkfczdkznqxvupdmnyiidqpnbvgjraszbvvztpapxmomnghfaywkzlrupvjpcvascgvstqmvuveiiixjmdofdwyvhgkydrnfuojhzulhobyhtsxmcovwmamjwljioevhafdlpjpmqstguqhrhvsdvinphejfbdvrvabthpyyphyqharjvzriosrdnwmaxtgriivdqlmugtagvsoylqfwhjpmjxcysfujdvcqovxabjdbvyvembfpahvyoybdhweikcgnzrdqlzusgoobysfmlzifwjzlazuepimhbgkrfimmemhayxeqxynewcnynmgyjcwrpqnayvxoebgyjusppfpsfeonfwnbsdonucaipoafavmlrrlplnnbsaghbawooabsjndqnvruuwvllpvvhuepmqtprgktnwxmflmmbifbbsfthbeafseqrgwnwjxkkcqgbucwusjdipxuekanzwimuizqynaxrvicyzjhulqjshtsqswehnozehmbsdmacciflcgsrlyhjukpvosptmsjfteoimtewkrivdllqiotvtrubgkfcacvgqzxjmhmmqlikrtfrurltgtcreafcgisjpvasiwmhcofqkcteudgjoqqmtucnwcocsoiqtfuoazxdayricnmwcg")
print(result3, result3 == "hpyyph")

let result4 = longestPalindrome("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaal")
print(result4, result4 == "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")