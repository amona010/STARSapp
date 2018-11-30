//
//  modelData.swift
//  finalproject
//
//  Created by Fawaz on 11/23/18.
//  Copyright © 2018 Fawaz Ahmed. All rights reserved.
//

import Foundation

class modelData{
    
    let userName = ["default1"]
    let password = ["pass"]
    
    static var getSome = modelData()
    
    let data : [[String]] =
        [["Kenyon Bartlett","COP3317-CNT4458-CSG2456","kenyon@fiu.edu","Math-iOSprogramming-Java","305-343-333"],
         
         ["Judith Ho","CGS 2518","JudithHo@fiu.edu","Calculus, Unity,Swift"],
         
         ["Davin Valencia","COP 3337","DavinValencia@fiu.edu","Calculus, Java,Swift"],
         
         ["Caitlin Bowen","COP 3337","kenyon@fiu.edu","Calculus, Unity,Swift"],
         
         ["Carlos Massey","COP 3337","kenyon@fiu.edu","Calculus, Java,Swift"],
         
         ["Gavin Mccullough","COP 3337","kenyon@fiu.edu","Calculus, Java,Swift"],
         
         ["Erick Skinner","COP 3337","kenyon@fiu.edu","Calculus, Java,Swift"],
         
         ["Pranav Martinez","COP 3337","kenyon@fiu.edu","Calculus, Java,Swift"],
         
         ["Nina Pham","COP 3337","kenyon@fiu.edu","Calculus, Java,Swift"],
         
         ["Todd Greer","COP 3337","kenyon@fiu.edu","Calculus, Java,Swift"]]
    
    var returnedData = [[String]]() //return the array
    var checkDefault = [0: "COP3342", 1:"COP2244", 2:"ENC2291", 3:"Unity",
                        4: "Swift", 5:"Java", 6:"Available"]
    
    
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
        
        for tutor in data{
            for criteria in checkDefault{
                
                if tutor.description.contains(criteria.value) {
                    returnedData.append(tutor)
                    break
                }
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
