//
//  ScoreRec.swift
//  Assignment1
//
//  Created by Jamie on 2019/2/8.
//  Copyright © 2019 i4Games. All rights reserved.
//

public struct Score
{
    var Current:Int
    var High:Int
    
    public init()
    {
        self.Current = 0
        self.High = 0
    }
    
    public mutating func addScore(){
        Current += 10
        if(Current>High){
            High = Current
        }
    }
    
}
