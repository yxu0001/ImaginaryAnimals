//
//  AnimalsLoader.swift
//  ImaginaryAnimalsLister
//
//  Created by Yijia Xu on 9/14/15.
//  Copyright © 2015 athenahealth. All rights reserved.
//

import Foundation

struct AnimalsLoader {
    static func loadAnimals() -> [ImaginaryAnimal] {
        
        var mermaid = ImaginaryAnimal()
        mermaid.name = "Mermaid"
        mermaid.location = "North America"
        mermaid.height = 1.5
        mermaid.dateLastSeen = "1858"
        mermaid.imageURL = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2a/Waterhouse_a_mermaid.jpg")
        
        let lochness = ImaginaryAnimal(name: "Loch Ness Monster", height: 31, location: "Scotland", dateLastSeen: "1951", imageURL: NSURL(string:"https://upload.wikimedia.org/wikipedia/en/5/5e/Hoaxed_photo_of_the_Loch_Ness_monster.jpg"))
        
        let bigfoot = ImaginaryAnimal(name: "Bigfoot", height: 2.1, location: "North America", dateLastSeen: "1963", imageURL: nil)
        
        let ogpogo = ImaginaryAnimal(name: "Ogopogo", height: 3.2, location: "Okanagan Lake, Canada", dateLastSeen: "1987", imageURL: NSURL(string:"https://upload.wikimedia.org/wikipedia/commons/6/63/Ogo-Pogo%2C_The_Funny_Fox-Trot.jpg"))
        
        
        return [mermaid, lochness, bigfoot, ogpogo]
    }
}