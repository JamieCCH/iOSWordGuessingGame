//
//  CreateDic.swift
//  Assignment1
//
//  Created by Jamie on 2019/2/8.
//  Copyright © 2019 i4Games. All rights reserved.
//

import Foundation

public class DictionaryManager
{
    private let dictionaryName = "Dictionary.txt"
    
    public init() {}
    
    public func getWords() -> [String:String]
    {
        var tempDict = [String:String]()
        let myDict = FileManager.default.currentDirectoryPath
        let fileUrl = URL(fileURLWithPath: myDict)
        let filePath = URL(string: dictionaryName, relativeTo: fileUrl)?.path
        if let contents = try? String(contentsOfFile: filePath!) {
            let lines = contents.split(separator:"\n")
            for line in lines {
                let elements = line.split(separator: ":").map(String.init)
                let tempKey = elements[0]
                let tempVal = elements[1]
                tempDict.updateValue(tempVal, forKey: tempKey)
            }
        }
        return tempDict
    }
    
    
    
    
    
}
