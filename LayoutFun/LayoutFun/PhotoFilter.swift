//
//  PhotoFilter.swift
//  LayoutFun
//
//  Created by Bakytzhan Apetov on 2017-02-02.
//  Copyright © 2017 Bakytzhan Apetov. All rights reserved.
//

import UIKit

class PhotoFilter: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!

    @IBOutlet weak var imageView: UIImageView!
    
    let filterNameList = ["No Filter" ,"CIPhotoEffectChrome", "CIPhotoEffectFade", "CIPhotoEffectInstant", "CIPhotoEffectMono", "CIPhotoEffectNoir", "CIPhotoEffectProcess", "CIPhotoEffectTonal", "CIPhotoEffectTransfer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        picker.delegate = self
        picker.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filterNameList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filterNameList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let sourceImage = CIImage(image: self.imageView.image!)
        // introducing guard statement as a cleaner form of "if let" for early return from functions
        guard let filter = CIFilter(name: filterNameList[row]) else {
            print("Can't create filter")
            return;
        }
        
        filter.setDefaults()
        filter.setValue(sourceImage, forKey: kCIInputImageKey)
        let context = CIContext(options: nil)
        // introducing: multiple "if let" in one statement, quite handy!
        if let outputImage = filter.outputImage,
            let outputCGImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let filteredImage = UIImage(cgImage: outputCGImage)
            self.imageView.image = filteredImage
        }
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
