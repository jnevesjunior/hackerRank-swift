import Foundation

/*
 * Complete the 'timeConversion' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func timeConversion(s: String) -> String {
    
    var timeString = s
    timeString.removeLast(2)
    
    let hourString = timeString.prefix(2)
    let intTime = Int(hourString) ?? 0
    
    timeString.removeFirst(2)
    
    var finalHour = intTime
    
    if s.suffix(2) == "PM" {    
        let newHour = intTime + 12 
        if newHour == 24 {
            finalHour = 12
        } else {
            finalHour = newHour
        }
    } else if finalHour == 12 {
        finalHour = 0
    }
    
    if finalHour >= 10 {
            timeString = "\(finalHour)" + timeString   
        } else {
            timeString = "0\(finalHour)" + timeString   
        }

    return timeString
}

let result = timeConversion(s: "12:01:00PM")
print(result, result == "12:01:00")

let result2 = timeConversion(s: "12:01:00AM")
print(result2, result2 == "00:01:00")

let result3 = timeConversion(s: "07:05:45PM")
print(result3, result3 == "19:05:45")
