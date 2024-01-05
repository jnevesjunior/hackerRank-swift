import Foundation

// A teacher asks the class to open their books to a page number. 
// A student can either start turning pages from the front of the book or from the back of the book. 
// They always turn pages one at a time. 
// When they open the book, page 1 is always on the right side:

// When they flip page 1, they see pages 2 and 3. 
// Each page except the last page will always be printed on both sides. 
// The last page may only be printed on the front, given the length of the book. 
// If the book is n pages long, and a student wants to turn to page p, 
// what is the minimum number of pages to turn? 
// They can start at the beginning or the end of the book.

// Given n and p, find and print the minimum number of pages that must be turned in order to arrive at page p.

/*
 * Complete the 'pageCount' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER n count of pages
 *  2. INTEGER p page
 */

func pageCount(n: Int, p: Int) -> Int {
    
    let isEven = n % 2 == 0
    if p == 1 || p == n || (!isEven && p == n - 1) {
        return 0
    }
    
    var pagesCount: Int
    if isEven {
        pagesCount = n / 2
    } else {
        pagesCount = Int((Float(n) / 2).rounded(.up))
    }
    
    var pageNumber = 0
    var pageNumberToCheck = 1
    while pageNumberToCheck <= pagesCount {
        
        let numberToCheck = pageNumberToCheck * 2
        let numberToCheckReversed = n - numberToCheck
        
        if numberToCheck == p || 
            numberToCheck + 1 == p  {
            pageNumber = pageNumberToCheck
            break
        } else {
            if numberToCheckReversed == p {
                pageNumber = pageNumberToCheck
                break
            } else {
                if isEven && numberToCheckReversed + 1 == p {
                    pageNumber = pageNumberToCheck
                    break
                } else if numberToCheckReversed - 1 == p {
                    pageNumber = pageNumberToCheck
                    break
                }
            }
        }
        pageNumberToCheck += 1
    }
    
    return pageNumber
}

let result = pageCount(n: 5, p: 3)
print(result, result == 1)

let result2 = pageCount(n: 7, p: 3)
print(result2, result2 == 1)

let result3 = pageCount(n: 6, p: 2)
print(result3, result3 == 1)

let result4 = pageCount(n: 5, p: 4)
print(result4, result4 == 0)