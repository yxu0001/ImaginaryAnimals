//
//  DownloadImageOp.swift
//  ImaginaryAnimalsLister
//
//  Created by Yijia Xu on 9/16/15.
//  Copyright © 2015 athenahealth. All rights reserved.
//

import UIKit

class DownloadImageOp: NSOperation {
    
    var url: NSURL
    var imageData: NSData?
    
    init(url: NSURL) {
        self.url = url
    }
    
    override func main() {
        imageData = NSData(contentsOfURL: url)
    }
    
    override func cancel() {
    }
}
