//
//  pdfs.swift
//  custom_app
//
//  Created by Yifan Ning on 18/04/2018.
//  Copyright © 2018 Yifan Ning. All rights reserved.
//

import Foundation
import PDFKit
import Beethoven
import Pitchy
import SwiftySound
class SongUnit: PitchEngineDelegate{
    var name: String
    var descritption: String?
    var pdfLocation: URL?
    var mp3Location: URL?
    var noteSheet: PDFDocument?
    var pageNumber: Int?
    var pitchDictionary: [Int:[Float]]?
    var pitchForWholePiece:[String] = []
    var engine: PitchEngine?
    var audio: Sound?
    var authorName: String?
    init(name: String, PDFdownloadLink: URL? = nil, MP3downloadlink: URL? = nil, PDFlocalDirectory: URL? = nil, MP3localDirectory: URL? = nil, authorName: String? = nil) {
        self.name = name
        self.pdfLocation = PDFlocalDirectory
        self.mp3Location = MP3localDirectory
        self.authorName = authorName

    }
    
    func startLoadingPitchData() {
        let config = Config(  bufferSize: 4096,
                              estimationStrategy: .yin,
                              audioUrl: self.mp3Location)
        self.engine = PitchEngine(config: config, delegate: self)
        self.engine?.levelThreshold = -30
        self.engine!.start()
        
    }
    
    func stopLoadingPitchData() {
        self.engine!.stop()
    }
    func startPlay() {
        self.audio = Sound(url: self.mp3Location!)
        self.audio?.play()
    }
    
    func stopPlay() {
        self.audio?.pause()
    }
    func pitchEngine(_ pitchEngine: PitchEngine, didReceivePitch pitch: Pitch) {
        print(pitch.note.string)
        pitchForWholePiece.append(pitch.note.string)
    }
    
    func pitchEngine(_ pitchEngine: PitchEngine, didReceiveError error: Error) {
        print(error)
    }
    
    public func pitchEngineWentBelowLevelThreshold(_ pitchEngine: PitchEngine) {
        print("Below level threshold")
    }
    
}

