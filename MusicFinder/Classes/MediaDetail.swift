//
//  MediaDetail.swift
//  MusicFinder
//
//  Created by Bakytzhan Apetov on 2017-03-15.
//  Copyright © 2017 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class MediaDetail: UIViewController {
    
    var detailItem: Dictionary<String, AnyObject> = [:]
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var infoDesc: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let artistName = detailItem["artistName"] as! String
        let genreName = detailItem["primaryGenreName"] as! String

        let someCase = detailItem["wrapperType"] as! String
        switch someCase {
            case "artist":
                let artistId = detailItem["artistId"] as! Int
                labelName.text = artistName
                infoDesc.text = "Artist ID: \(artistId)\nGenre: \(genreName)"
            case "collection":
                let albumName = detailItem["collectionName"] as! String
                let albumId = detailItem["collectionId"] as! Int
                var rd = detailItem["releaseDate"] as! String
                rd = rd.substring(to: rd.index(rd.startIndex, offsetBy: 10))
                labelName.text = albumName
                infoDesc.text = "Album ID: \(albumId)\nArtist: \(artistName)\nRelease Date: \(rd)\nGenre: \(genreName)"
            case "track":
                let trackName = detailItem["trackName"] as! String
                let trackId = detailItem["trackId"] as! Int
                let albumName = detailItem["collectionName"] as! String
                let genreName = detailItem["primaryGenreName"] as! String
                var rd = detailItem["releaseDate"] as! String
                rd = rd.substring(to: rd.index(rd.startIndex, offsetBy: 10))
                labelName.text = trackName
                infoDesc.text = "Track ID: \(trackId)\nArtist: \(artistName)\nAlbum: \(albumName)\nRelease Date: \(rd)\nGenre: \(genreName)"
            default:
                labelName.text = "Title"
                infoDesc.text = "Info"
        }
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
