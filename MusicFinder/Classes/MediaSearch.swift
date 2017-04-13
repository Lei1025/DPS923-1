//
//  MediaSearch.swift
//  MusicFinder
//
//  Created by Bakytzhan Apetov on 2017-03-13.
//  Copyright © 2017 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class MediaSearch: UIViewController, UITextFieldDelegate {

    var model: WebServiceModel!
    @IBOutlet weak var artist: UITextField!
    @IBOutlet weak var album: UITextField!
    @IBOutlet weak var song: UITextField!
    @IBOutlet weak var search: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Music"
        
        artist.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        album.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        song.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        search.isEnabled = userHasEnteredText()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userHasEnteredText() -> Bool {
        var result = false
        let count = artist.text!.characters.count + album.text!.characters.count + song.text!.characters.count
        
        if count > 0 {
            result = true
        }
        
        return result
    }
    
    func textFieldDidChange() { search.isEnabled = userHasEnteredText() }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        /*var searchWords = [String]()
        
        searchWords.append((artist.text?.isEmpty)! ? "(no artist)" : artist.text!)
        searchWords.append((album.text?.isEmpty)! ? "(no album)" : album.text!)
        searchWords.append((song.text?.isEmpty)! ? "(no song)" : song.text!)
        
        let vc = segue.destination as! MediaList
        vc.model = model
        vc.searchWords = searchWords*/
        
        model.mediaGet(artist: artist.text!, album: album.text!, song: song.text!)
        
        let vc = segue.destination as! MediaList
        vc.model = model
    }
 

}
