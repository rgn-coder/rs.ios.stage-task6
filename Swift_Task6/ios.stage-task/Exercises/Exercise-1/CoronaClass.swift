import Foundation


class CoronaClass {
    var count = 0
    var seats = [Int]()//answer
    let n: Int
    var allSeats: [Int: Bool] = [:]
    //приходит число н и формирует словарь
    
    
    init(n: Int) {
        self.n = n
        for i in 0..<n {
            allSeats[i] = false
        }
        
    }
    
    func seat() -> Int {
        var countOfAreas = 0
        var distance = 0
        var middle = 0
        //если 0 не занят и все фолз
        if !allSeats.values.contains(true) {
            allSeats[0] = true
            seats.append(0)
            count += 1
            return 0
            
        }
        if count == 1 {
            if allSeats[0] == true {
                for i in 1..<allSeats.count {
                    if allSeats[i] == true {
                        
                    } else {
                        allSeats[allSeats.count - 1] = true
                        
                        seats.append(allSeats.count - 1)
                        count -= 2
                        return allSeats.count - 1
                        
                    }
                }
            }
        }
        countOfAreas = howManyAreas(arrayWithSeats: seats)
        if countOfAreas == 1 {
            distance = getDistance(left: seats[0], right: seats[seats.count - 1])
            middle = getMid(distanceOfArea: distance)
            allSeats[middle] = true
            seats.append(middle)
            seats.sort()
            return middle
            
        } else {
            countOfAreas = howManyAreas(arrayWithSeats: seats)
            //print(countOfAreas)
            var arrayWithAreas:[[Int]] = []
            for i in 1...countOfAreas {
                let arrDistance = [seats[i-1], seats[i]]
                arrayWithAreas.append(arrDistance)
            }
            print(arrayWithAreas)
            var midArray:[Int] = []
            var numbersArray:[Int] = []
            for i in 0..<arrayWithAreas.count {
                let areaArray = arrayWithAreas[i]
                distance = getDistance(left: areaArray[0], right: areaArray[1])
                middle = getMid(distanceOfArea: distance)
                midArray.append(middle)
                let number = areaArray[0] + middle
                numbersArray.append(number)
                
                
            }
            midArray.sort()
            if midArray.last! <= midArray[midArray.count - 2] {
                if numbersArray[0] > numbersArray[1] {
                    seats.append(numbersArray[1])
                    allSeats[numbersArray[1]] = true
                    return numbersArray[1]
                } else if numbersArray[0] < numbersArray[1] {
                    seats.append(numbersArray[0])
                    seats.sort()
                    allSeats[numbersArray[0]] = true
                    return numbersArray[0]
                }
            } else {
                
                seats.append(numbersArray.last!)
                allSeats[numbersArray.last!] = true
                seats.sort()
                print(seats)
                return numbersArray.last!
            }
        }
        print(seats)
        return -1
    }
    
    
    


func howManyAreas(arrayWithSeats: [Int]) -> Int {
    let areas = arrayWithSeats.count - 1
    
    
    return areas
}


func getDistance(left: Int, right: Int) -> Int {
    let result = right - left
    return result
}

func getMid(distanceOfArea: Int) -> Int {
    let mid = distanceOfArea/2
    return mid
}

func leave(_ p: Int) {
    allSeats[p] = false
    for i in 0..<seats.count - 1{
        print(seats)
        if seats[i] == p {
            seats.remove(at: i)
            print(allSeats)
            allSeats[p] = true
        }
    }
}
}



//
//
//

