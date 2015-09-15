//
//  AnimalsLoader.swift
//  ImaginaryAnimalsLister
//
//  Created by Yijia Xu on 9/14/15.
//  Copyright © 2015 athenahealth. All rights reserved.
//

import Foundation

struct AnimalsLoader {
    func loadAnimals() -> [ImaginaryAnimal] {
        
        var animals = [ImaginaryAnimal]()
        
        guard let url = NSBundle.mainBundle().URLForResource("Animals", withExtension:"json"),
            data = NSData(contentsOfURL: url),
            jsonArray = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0)) as? [AnyObject]
        else {
                fatalError("Cannot open file or parse Json")
        }
        
        if let jsonArray = jsonArray {
            for obj in jsonArray {
                if let animal = ImaginaryAnimal(fromJSON: obj) {
                    animals.append(animal)
                }
            }
        }
        
        return animals

    }
}