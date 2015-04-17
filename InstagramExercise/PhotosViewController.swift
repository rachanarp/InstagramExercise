//
//  PhotosViewController.swift
//  InstagramExercise
//
//  Created by Rachana Bedekar on 4/16/15.
//  Copyright (c) 2015 Rachana Bedekar. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var photos : NSArray = []
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 320;
        
        // Do any additional setup after loading the view.
        var clientId = ""
        
        var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            self.photos = responseDictionary["data"] as NSArray
            self.tableView.reloadData()
            
            println("response: \(self.photos)")
        }
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier("com.codepath.photoViewPrototypeCell", forIndexPath: indexPath) as PhotosTableViewCell
        
        let path : NSString = photos[indexPath.row].valueForKeyPath("images")?.valueForKeyPath("low_resolution")?.valueForKeyPath("url") as NSString
        
        let imageURL = NSURL(string: path)
        cell.photoView.setImageWithURL(imageURL )
        
            return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as PhotoDetailsViewController
        var indexPath : Int = tableView.indexPathForCell(sender as UITableViewCell)!.row
        vc.selectedPhoto = indexPath
    }

}
