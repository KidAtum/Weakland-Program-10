//
//  ViewController.swift
//  Weakland Program 10
//
//  Created by Lucas Weakland on 4/27/20.
//  Copyright © 2020 Lucas Weakland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var job: UITextField!
    @IBOutlet weak var results: UITextView!
    
    
    
    
    
    @IBAction func saveResults(_ sender: Any) {
        let csvLine:String =
            "\(firstName.text!),\(lastName.text!),\(number.text!),\(job.text!)\n"
            let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            let docDir:String=paths[0]
            let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
            
                if !FileManager.default.fileExists(atPath: resultsFile) {
                FileManager.default.createFile(atPath: resultsFile,contents: nil, attributes: nil)
                }
            
            let
            fileHandle:FileHandle=FileHandle(forUpdatingAtPath:resultsFile)!
            fileHandle.seekToEndOfFile()
            fileHandle.write(csvLine.data(using: String.Encoding.utf8)!)
            fileHandle.closeFile()
            
            firstName.text = ""
            lastName.text = ""
            number.text = ""
            job.text = ""
    }
    
    
    @IBAction func displayResults(_ sender: Any) {
        let paths =
            NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir:String=paths[0]
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
        
            if FileManager.default.fileExists(atPath: resultsFile) {
            let fileHandle:FileHandle = FileHandle(forReadingAtPath:resultsFile)!
            let resultsData:String!=NSString(data: fileHandle.availableData, encoding: String.Encoding.utf8.rawValue)! as String
            fileHandle.closeFile()
            
            results?.text=resultsData
        }
        else
            {
            // file doesnt exist
        }
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

