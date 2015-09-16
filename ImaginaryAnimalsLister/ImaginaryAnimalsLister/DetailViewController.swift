//
//  DetailViewController.swift
//  ImaginaryAnimalsLister
//
//  Created by Yijia Xu on 9/14/15.
//  Copyright © 2015 athenahealth. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var dateLastSeenLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    var animal: ImaginaryAnimal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func loadImage() {
        let queue: NSOperationQueue = {
            let queue = NSOperationQueue()
            queue.name = "Download queue"
            queue.maxConcurrentOperationCount = 1
            return queue
        }()

        
        var downloadImageOp: DownloadImageOp?
        
        if let url = self.animal?.imageURL {
            downloadImageOp = DownloadImageOp(url: url)
        }
        
        if let downloadImageOp = downloadImageOp {
            downloadImageOp.completionBlock = { [weak self] in
                if let imageData = downloadImageOp.imageData {
                    NSOperationQueue.mainQueue().addOperation(
                        NSBlockOperation(block: {
                            self?.imageView.image = UIImage(data:imageData)
                            }
                        ))
                }
            }
            
            queue.addOperation(downloadImageOp)
        }
        

        // NSBlockOperation
        /*
        var imageData: NSData?
        let op = NSBlockOperation(block: {[weak self] in
            if let url = self?.animal?.imageURL {
                imageData = NSData(contentsOfURL: url)
            }
        })
        
        op.completionBlock = { [weak self] in
            if let imageData = imageData {
                NSOperationQueue.mainQueue().addOperation(
                    NSBlockOperation(block: {
                        self?.imageView.image = UIImage(data:imageData)
                        }
                ))
            }
        }
        queue?.addOperation(op) */
        
        
        // GCD
        /*
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            [weak self] in
            if let url = self?.animal?.imageURL,
                imageData = NSData(contentsOfURL: url) {
                    dispatch_async(dispatch_get_main_queue()) {
                        self?.imageView.image = UIImage(data:imageData)
                    }
            }
        }*/
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let animal = animal {
            nameLabel.text = animal.name
            heightLabel.text = "\(animal.height)"
            locationLabel.text = animal.location
            dateLastSeenLabel.text = animal.dateLastSeen
        }
        
        loadImage()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadImage () {
        /*let queue = dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        spinnerView.startAnimating()
        dispatch_async(queue, { [weak self] in
        
        if let url = self?.animal?.imageURL,
        imageData = NSData(contentsOfURL: url) {
            dispatch_async(dispatch_get_main_queue(), {
                self?.spinnerView.stopAnimating()
                self?.imageView.image = UIImage(data:imageData)})
            
            }
        })*/
        let queue = NSOperationQueue()
        
        let loadimageOperation = NSBlockOperation.init(block: { [weak self] in
            
            if let url = self?.animal?.imageURL,
            imageData = NSData(contentsOfURL: url) {
                let mainqueue = NSOperationQueue.mainQueue()
                let showImageOp = NSBlockOperation.init(block:{
                    self?.spinnerView.stopAnimating()
                    self?.imageView.image = UIImage(data:imageData)})
                
                mainqueue.addOperation(showImageOp)
        
            }})

        queue.addOperation(loadimageOperation)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
