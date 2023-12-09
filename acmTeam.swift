import Foundation

/*
 * Complete the 'acmTeam' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts STRING_ARRAY topic as parameter.
 */

func acmTeam(topic: [String]) -> [Int] {
    
    var newTopic = topic
    
    var globalbiggerKnowCount = 0
    var globalbiggerKnowCountRepeats = 0
        
    topic.enumerated().forEach { (index, topicToCompare) in
        
        let topicToCompareStringList = topicToCompare.map { String($0) }
        newTopic.removeFirst()
        
        if newTopic.count == 0 {
            return
        }
        
        var biggerKnowCount = 0
        var biggerKnowCountRepeats = 0
        newTopic.forEach { currentTopic in
            var knowCount = 0
            currentTopic.enumerated().forEach { (currentTopicIndex, topicChar) in
                if topicChar == "1" || topicToCompareStringList[currentTopicIndex] == "1" {
                   knowCount += 1 
                }
            }
            
            if knowCount > biggerKnowCount {
                biggerKnowCount = knowCount
                biggerKnowCountRepeats = 1
            } else if knowCount == biggerKnowCount {
                biggerKnowCountRepeats += 1
            }
        }
        
        if biggerKnowCount > globalbiggerKnowCount {
            globalbiggerKnowCount = biggerKnowCount
            globalbiggerKnowCountRepeats = biggerKnowCountRepeats
        } else if biggerKnowCount == globalbiggerKnowCount {
            globalbiggerKnowCountRepeats += biggerKnowCountRepeats
        }
    }
    
    return [globalbiggerKnowCount, globalbiggerKnowCountRepeats]
}


let result = acmTeam(topic: ["10101", "11100", "11010", "00101"])
print(result, result == [5, 2])

let result2 = acmTeam(topic: ["11101", "10101", "11001", "10111", "10000", "01110"])
print(result2, result2 == [5, 6])