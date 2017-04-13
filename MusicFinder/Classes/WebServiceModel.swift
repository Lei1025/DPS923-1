//
//  Model.swift
//  Classes
//
//  Created by Peter McIntyre on 2015-02-01.
//  Copyright (c) 2017 School of ICT, Seneca College. All rights reserved.
//

import CoreData

struct Program {
    var code = ""
    var id = -1
    var name = ""
}

protocol WebServiceModelDelegate : class {
    func webServiceModelDidChangeContent(model: WebServiceModel)
}

class WebServiceModel {
    // Property to hold/store the fetched collection
    var programs = [Program]()
    var media = [Dictionary<String, AnyObject>]()
    

    // The delegate gets called to report that the data has changed
    weak var delegate: WebServiceModelDelegate? = nil

    init() {
//        programsGet()
    }

    func mediaGet(artist: String, album: String, song: String) {
        var url = "https://itunes.apple.com/search?limit=20&media=music&term="
        
        if artist.characters.count > 0 {
            
            url.append(artist)
            if(album.characters.count + song.characters.count > 0) {
                url.append(" ")
            }
        }
        
        if album.characters.count > 0 {
            
            url.append(album)
            if (song.characters.count > 0) {
                url.append(" ")
            }
        }
        
        if song.characters.count > 0 {
            url.append(song)
        }
        
        var entity = ""
        
        if artist.characters.count > 0 {
            entity = "&entity=musicArtist"
        }
        
        if album.characters.count > 0 {
            entity = "&entity=album"
        }
        
        if song.characters.count > 0 {
            entity = "&entity=song"
        }
 
        url.append(entity)
        url = url.replacingOccurrences(of: " ", with: "+")
        
        let request = WebServiceRequest()
        request.urlBase = url
        media.removeAll()
        
        request.sendRequest(toUrlPath: "", dataKeyName: "results", completion: {
            (result: [AnyObject]) in
            for item in result {
                self.media.append(item as! [String:AnyObject])
            }

            self.delegate?.webServiceModelDidChangeContent(model: self)
        })
    }

    // Method to fetch the collection
    func programsGet() {
        let request = WebServiceRequest()
        request.sendRequest(toUrlPath: "/programs", dataKeyName: nil, completion: {
            (result: [AnyObject]) in
            for item in result {
                guard let programDict = item as? [String:AnyObject] else {
                    continue
                }

                var program = Program()
                if let name = programDict["Name"] as? String {
                    program.name = name
                }
                if let code = programDict["Code"] as? String {
                    program.code = code
                }
                if let id = programDict["Id"] as? Int {
                    program.id = id
                }
                self.programs.append(program)
            }

            // notify the delegate
            self.delegate?.webServiceModelDidChangeContent(model: self)
        })
    }
 
}
