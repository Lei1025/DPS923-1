//
//  CourseDetail.swift
//  ICTCurric
//
//  Created by Bakytzhan Apetov on 2017-02-24.
//  Copyright © 2017 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class CourseDetail: UIViewController {
    
    @IBOutlet weak var courseCode: UILabel!
    @IBOutlet weak var courseName: UITextView!
    @IBOutlet weak var courseDescription: UITextView!
    
    var course: Course!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        courseCode.text = course.code
        courseName.text = course.fullName
        courseDescription.text = course.courseDescription
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
