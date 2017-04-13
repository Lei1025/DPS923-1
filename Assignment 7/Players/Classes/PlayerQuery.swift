//
//  PlayerQuery.swift
//  Players
//
//  Created by Bakytzhan Apetov on 2017-03-22.
//  Copyright © 2017 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class PlayerQuery: UIViewController {
    
    var model: Model!
    // change
    // set model
    @IBAction func topRated(_ sender: UIButton) {
        performSegue(withIdentifier: "toTopRated", sender: sender)
    }

    @IBAction func stats(_ sender: UIButton) {
        performSegue(withIdentifier: "toStats", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Players"

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

}
