import Foundation

class CoronaClass {
 
    var seats = [Int]()
    var number:Int
    

     init(n: Int) {
        number = n
     }
     
     func seat() -> Int {
        

        var student = 0
        
        if seats.isEmpty {
            seats.append(0)
            
        } else {
            
            if seats.first != 0 {
                student = 0
                seats.insert(student, at: 0)
                return student
                
            }
            
            if seats.last != number - 1 && seats.count < 2{
                seats.append(number - 1)
                student = number - 1
                
            } else {
                
                var pastElement = 0
                var numberOfIndex = 0
                
                for i in 1 ..< seats.count {
                    
                    if (seats[i] - seats[i - 1]) / 2 > pastElement {
                        pastElement = (seats[i] - seats[i - 1]) / 2
                        numberOfIndex = i
                        student = seats[i - 1] + pastElement
                    }
                }
                
                if seats.last != number - 1 {
                    
                    if number - 1 - seats.last! > pastElement {
                        student = number - 1
                        seats.append(number - 1)
                        return student
                    }
                }
                seats.insert(student, at: numberOfIndex)
            }
        }
        
        return student
     }
     
     func leave(_ p: Int) {
        seats.remove(at: seats.firstIndex(of: p) ?? 0)
     }
}
