//
//  modelData.swift
//  finalproject
//
//  Created by Fawaz on 11/23/18.
//  Copyright © 2018 Fawaz Ahmed. All rights reserved.
//

import Foundation

final class modelData
{
    fileprivate init () {}
    
    let userName = ["default1"]
    let password = ["pass"]
    
    static var getSome = modelData()
    
    let data : [[String]] =
        [["Judith Ho","ENC2291, COP3337","JudithHo@fiu.edu","Calculus, Unity, Swift", "Freshman", "MonWed 3:00 - 5:00, Available"],
         
         ["Davin Valencia","COP4005, COP3337","DavinValencia@fiu.edu","Calculus, Java, Swift", "Sophomore", "TuThurs 2:00 - 4:15, Unavailable"],
         
         ["Caitlin Bowen","COP2244","kenyon@fiu.edu","Calculus, Unity, Swift", "Junior", "MonWed 2:00 - 4:15, Available"],
         
         ["Carlos Massey","ENC2291","kenyon@fiu.edu","Calculus, Java, Swift", "Senior", "TuThurs 2:00 - 4:15, Unavailable"],
         
         ["Gavin Mccullough","COP4005, ENC2291","kenyon@fiu.edu","Calculus, Java, Swift", "Junior", "MonWed 2:00 - 4:15, Available"],
         
         ["Erick Skinner","COP4005","kenyon@fiu.edu","Calculus, Java, Swift", "Junior", "MonWed 2:00 - 4:15, Available"],
         
         ["Pranav Martinez","COP5614, COP3337","kenyon@fiu.edu","Calculus, Java, Swift", "Senior", "TuThurs 2:00 - 4:15, Unavailable"],
         
         ["Nina Pham","COP5614","kenyon@fiu.edu","Calculus, Java, Swift", "Senior", "MonWed 2:00 - 4:15, Available"],
         
         ["Todd Greer","COP3337","kenyon@fiu.edu","Calculus, Java, Swift", "Sophomore", "TuThurs 2:00 - 4:15, Unavailable"]]
    
    var returnedData = [[String]]() //return the array
    var checkClasses = ["COP3337":true, "COP2244":true, "ENC2291":true, "COP4005":true, "COP5614":true]
    var checkSkills = ["Unity":true, "Swift":true, "Java":true, "Calculus":true]
    var checkAvailability = ["Available?":true]
    
    
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
                    if(!criteria.value)
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
                    if(!criteria.value)
                    {
                        add = true
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
