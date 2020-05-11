//
//  ViewController.swift
//  OutputStreamTest
//
//  Created by mikey on 5/10/20.
//  Copyright © 2020 Sand Creek Software. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

//        let stream = OutputStream(toFileAtPath: "~/Documents/logtest.txt", append: false)
//
//        stream.close()

        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Directory does not exist")
            return
        }

        let fileUrl = directory.appendingPathComponent("logtest.txt")

        let fileHandle = FileHandle(forWritingAtPath: fileUrl.path)

        if fileHandle != nil {
            let data = ("Silentium est aureum" as NSString).data(using: String.Encoding.utf8.rawValue)

            // Write it to the file
            fileHandle?.write(data!)

            fileHandle?.closeFile()
        }
        else {
            print("File open failed")
        }

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

