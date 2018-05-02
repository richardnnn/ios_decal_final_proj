//
//  processor.swift
//  custom_app
//
//  Created by Yifan Ning on 24/04/2018.
//  Copyright © 2018 Yifan Ning. All rights reserved.
//
// this the processor for generating pitch array for mp3 file
import Foundation
import Foundation
import PDFKit
import Beethoven
import Pitchy

let pdfURL1 = Bundle.main.url(forResource: "Piano Sonata No.1, Op.2 No.1", withExtension: "pdf")
let mp3URL1 = Bundle.main.url(forResource: "Piano Sonata No.1, Op.2 No.1", withExtension: "mp3")
let pdfURL2 = Bundle.main.url(forResource: "Piano Sonata No.1, Op.2 No.2", withExtension: "pdf")
let mp3URL2 = Bundle.main.url(forResource: "Piano Sonata No.1, Op.2 No.2", withExtension: "mp3")
let pdfURL3 = Bundle.main.url(forResource: "Piano Sonata No.1, Op.2 No.3", withExtension: "pdf")
let mp3URL3 = Bundle.main.url(forResource: "Piano Sonata No.1, Op.2 No.3", withExtension: "mp3")
let pdfURL4 = Bundle.main.url(forResource: "Cello Suite No.2 in D minor, BWV 1008", withExtension: "pdf")
let mp3URL4 = Bundle.main.url(forResource: "Cello Suite No.2 in D minor, BWV 1008", withExtension: "mp3")
let pdfURL5 = Bundle.main.url(forResource: "Cello Suite No.3 in C major, BWV 1009", withExtension: "pdf")
let mp3URL5 = Bundle.main.url(forResource: "Cello Suite No.3 in C major, BWV 1009", withExtension: "mp3")
let song1 = SongUnit(name: "Piano Sonata No.1, Op.2 No.1", PDFlocalDirectory: pdfURL1, MP3localDirectory: mp3URL1, authorName: "Beethoven")
let song2 = SongUnit(name: "Piano Sonata No.1, Op.2 No.2", PDFlocalDirectory: pdfURL2, MP3localDirectory: mp3URL2, authorName: "Beethoven")
let song3 = SongUnit(name: "Piano Sonata No.1, Op.2 No.2", PDFlocalDirectory: pdfURL3, MP3localDirectory: mp3URL3, authorName: "Beethoven")
let song4 = SongUnit(name: "Cello Suite No.2 in D minor, BWV 1008", PDFlocalDirectory: pdfURL4, MP3localDirectory: mp3URL4, authorName: "Bach")
let song5 = SongUnit(name: "Cello Suite No.3 in C major, BWV 1009", PDFlocalDirectory: pdfURL5, MP3localDirectory: mp3URL5, authorName: "Bach")
let sampleSongs = [song1, song2, song3, song4, song5]
