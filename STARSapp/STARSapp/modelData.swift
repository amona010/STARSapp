//  PROGRAMMERS: Alexander Monaco, Fawaz Ahmed, Dominique Felix
//  PANTHERID: 5673317, 2654199, 4199402
//  CLASS: COP 4655 TR 5:00
//  INSTRUCTOR:  Steve Luis PG6
//  ASSIGNMENT: Final project: STARS Organization Tutor scheduling application
//  DUE: Sunday 12/06/18
//

import Foundation

final class modelData
{
    fileprivate init () {}
    
    let userName = ["default1"]
    let password = ["pass"]
    let profileName = "John Smith"
    let profileNumber = "333-444-5555"
    let profileEmail = "jSmith@fiu.edu"
    
    static var getSome = modelData()
    
    let data : [[String]] =
        [["Judith Ho","ENC2291, COP3337","JudithHo@fiu.edu","Calculus, Unity, Swift", "Freshman", "MonWed 3:00 - 5:00, Available", "1111111111"],
         
         ["Davin Valencia","COP4005, COP3337","DavinValencia@fiu.edu","Calculus, Java, Swift", "Sophomore", "TuThurs 2:00 - 4:15, Unavailable", "1111111111"],
         
         ["Caitlin Bowen","COP2244","kenyon@fiu.edu","Calculus, Unity, Swift", "Junior", "MonWed 2:00 - 4:15, Available", "1111111111"],
         
         ["Carlos Massey","ENC2291","kenyon@fiu.edu","Calculus, Java, Swift", "Senior", "TuThurs 2:00 - 4:15, Unavailable", "1111111111"],
         
         ["Gavin Mccullough","COP4005, ENC2291","kenyon@fiu.edu","Calculus, Java, Swift", "Junior", "MonWed 2:00 - 4:15, Available", "1111111111"],
         
         ["Erick Skinner","COP4005","kenyon@fiu.edu","Calculus, Java, Swift", "Junior", "MonWed 2:00 - 4:15, Available", "1111111111"],
         
         ["Pranav Martinez","COP5614, COP3337","kenyon@fiu.edu","Calculus, Java, Swift", "Senior", "TuThurs 2:00 - 4:15, Unavailable", "1111111111"],
         
         ["Nina Pham","COP5614","kenyon@fiu.edu","Calculus, Java, Swift", "Senior", "MonWed 2:00 - 4:15, Available", "1111111111"],
         
         ["Todd Greer","COP3337","kenyon@fiu.edu","Calculus, Java, Swift", "Sophomore", "TuThurs 2:00 - 4:15, Unavailable", "1111111111"],
         
         ["Stephanie Monterrey","COP3337, COP4005, COP5614","smont@fiu.edu","Calculus, Java, Swift", "Junior", "MonWed 3:00 - 5:30, Available", "7863012150"]]
    
    var returnedData = [[String]]() //return the array
    var checkClasses = ["COP3337":true, "COP2244":true, "ENC2291":true, "COP4005":true, "COP5614":true]
    var checkSkills = ["Unity":true, "Swift":true, "Java":true, "Calculus":true]
    var checkAvailability = ["Available?":false]
    
    
    func setDataToReturn() -> Array<Any>{
        if returnedData.count > 0{
            return returnedData
        }
        return data
    }
    /*
     filter for class
     */
    func returnClass(){
        returnedData.removeAll()
        
        for tutor in data
        {
            var add = false
            for criteria in checkClasses
            {
                if tutor.description.contains(criteria.key)
                {
                    if(criteria.value)
                    {
                        add = true
                    }
                    break
                }
            }
            
            for criteria in checkSkills
            {
                if tutor.description.contains(criteria.key)
                {
                    if(criteria.value)
                    {
                        add = true
                    }
                    break
                }
            }
            
            for criteria in checkAvailability
            {
                if tutor.description.contains(criteria.key)
                {
                    if(criteria.value)
                    {
                        add = true
                    }
                    break
                }
            }
            
            for criteria in checkAvailability
            {
                if(criteria.value)
                {
                    if(tutor[5].components(separatedBy: ", ")[1] == "Available")
                    {
                        add = true
                    }
                    else
                    {
                        add = false
                    }
                    
                    break
                }
            }
            
            if(add)
            {
                returnedData.append(tutor)
            }
        }
    }
    
    /* user login
     */
    func isName(access:String) -> Bool{
        if(access == "default1"){
            return true
        }
        return false
    }
    /* user login
     */
    func isPass(access:String)-> Bool{
        
        
        if(access == "pass"){
            return true
        }
        
        return false
    }
}
