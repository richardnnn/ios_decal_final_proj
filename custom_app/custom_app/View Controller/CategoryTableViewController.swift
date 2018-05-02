//
//  CategoryTableViewController.swift
//  custom_app
//
//  Created by Yifan Ning on 18/04/2018.
//  Copyright © 2018 Yifan Ning. All rights reserved.
//

import UIKit
import THPDFKit
import SwiftySound
class CategoryTableViewController: UITableViewController, UITextFieldDelegate {
    var totalRows: Int?
    var currentSound: Sound?
    @IBOutlet weak var operationIndex: UITextField!
    @IBAction func start(_ sender: Any) {
        if operationIndex.text != "" {
            let ind = Int(operationIndex.text!)
            if 0 < ind! && ind! < totalRows! {
                currentSound = sampleSongs[ind! - 1].audio
                sampleSongs[ind! - 1].startPlay()
            }
        }
    }
    @IBAction func stop(_ sender: Any) {
        Sound.stopAll()
    }
    @IBOutlet var category: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        totalRows = sampleSongs.count
        return sampleSongs.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = category.dequeueReusableCell(withIdentifier: "noteSheet", for: indexPath) as! CategoryTableViewCell
        var tempSongName = sampleSongs[indexPath.row].name
        if tempSongName.count > 30 {
            let startIndex = tempSongName.index(tempSongName.startIndex, offsetBy: 0)
            let endIndex = tempSongName.index(startIndex, offsetBy: 35)
            tempSongName = tempSongName[startIndex..<endIndex] + "..."
        }
        cell.sheetName.text = tempSongName
        cell.indexing.text = "#" + String(indexPath.row + 1)
        cell.authorName.text = "- " + (sampleSongs[indexPath.row].authorName)!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "go", sender: self)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newLength: Int = operationIndex.text!.characters.count + string.characters.count - range.length
        let numberOnly = NSCharacterSet.init(charactersIn: "0123456789").inverted
        let strValid = string.rangeOfCharacter(from: numberOnly) == nil
        return (strValid && (newLength <= 5))
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedRow = indexPath.row
            let detailVC = segue.destination as! PDFViewControllerWrapper
            detailVC.url = sampleSongs[selectedRow].pdfLocation
            
        }
    }
 

}
