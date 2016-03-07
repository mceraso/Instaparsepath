//
//  PhotoFeedViewController.swift
//  Instaparsepath
//
//  Created by Michael Ceraso on 3/7/16.
//  Copyright © 2016 Michael Ceraso. All rights reserved.
//

import UIKit
import Parse

class PhotoFeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
