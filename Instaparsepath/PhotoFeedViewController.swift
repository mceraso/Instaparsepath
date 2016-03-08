//
//  PhotoFeedViewController.swift
//  Instaparsepath
//
//  Created by Michael Ceraso on 3/7/16.
//  Copyright © 2016 Michael Ceraso. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PhotoFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var PhotoFeedTableView: UITableView!
    var photos: [PFObject]?
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: "refreshControlAction:", forControlEvents: UIControlEvents.ValueChanged)
    PhotoFeedTableView.insertSubview(refreshControl, atIndex: 0)

    PhotoFeedTableView.dataSource = self
    PhotoFeedTableView.delegate = self
    self.parseAPICall()
    PhotoFeedTableView.reloadData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        self.PhotoFeedTableView.reloadData()
        self.parseAPICall()
        refreshControl.endRefreshing()
    }
    
    func parseAPICall() {
        
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                
                print("photos pulled")
                self.photos = posts
                self.PhotoFeedTableView.reloadData()
            } else {
                print (error?.localizedDescription)
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return photos?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoFeedCell", forIndexPath: indexPath) as! PhotoFeedCell
       
        let photo = photos![indexPath.row]
        
        let caption = photo["caption"] as! String
        cell.captionLabel.text = caption
        
        cell.photoImageView.file = photo["media"] as? PFFile
        cell.photoImageView.loadInBackground()
        
        return cell
        
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOut()
        let LoginViewController = storyboard!.instantiateViewControllerWithIdentifier("LoginViewController");
        self.presentViewController(LoginViewController, animated:true, completion:nil);
        print("You're logged out!")
        
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
