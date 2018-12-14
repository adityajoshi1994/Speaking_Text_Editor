//
//  ViewController.swift
//  SpeakingTextEditor
//
//  Created by Aditya Joshi on 10/31/18.
//  Copyright © 2018 Aditya Joshi. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    
    var contents: String {
        get{
            return textView.string
        }
        set{
            textView.string = newValue
        }
    }
    
    let speechSynthesizer = NSSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func speakButtonClicked (sender: NSButton){
        
        if let contents: String = textView.string, !contents.isEmpty {
            speechSynthesizer.startSpeaking(contents)
        }else{
            speechSynthesizer.startSpeaking("Nothing much to say.")
        }
        
    }
    
    @IBAction func stopButtonClicked (sender: NSButton){
        speechSynthesizer.stopSpeaking()
    }

}

