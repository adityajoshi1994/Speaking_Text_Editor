//
//  Document.swift
//  SpeakingTextEditor
//
//  Created by Aditya Joshi on 10/31/18.
//  Copyright © 2018 Aditya Joshi. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    var contents: String = ""
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        
        let viewController = windowController.contentViewController as! ViewController
        viewController.contents = contents
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController  as! ViewController
        let contents = viewController.contents ?? ""
        if let data = contents.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            return data
        }else{
            let userInfo = [NSLocalizedRecoveryOptionsErrorKey: "File cannot be encoded"]
            throw NSError(domain: "com.aj", code: 0, userInfo: userInfo)
        }
        
    }

    override func read(from data: Data, ofType typeName: String) throws {
        if let contents = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as? String{
            self.contents = contents
        } else {
            let userInfo = [NSLocalizedRecoveryOptionsErrorKey: "File not valid"]
            throw NSError(domain: "com.aj", code: 0, userInfo: userInfo)
        }
        
    }


}

