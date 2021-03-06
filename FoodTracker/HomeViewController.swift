//
//  HomeViewController.swift
//  FoodTracker
//
//  Created by kostya on 7/3/18.
//  Copyright © 2018 kostya. All rights reserved.
//

import UIKit
import LGButton

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func therapyButton(_ sender: LGButton) {
        self.tabBarController!.selectedIndex = 1
    }
    
    
    @IBAction func connectFriendsButton(_ sender: LGButton) {
        performSegue(withIdentifier: "toFriends", sender: self)
    }
    
    
    @IBAction func explore(_ sender: LGButton) {
        performSegue(withIdentifier: "toExplore", sender: self)
    }
}
