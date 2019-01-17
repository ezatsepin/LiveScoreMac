//
//  ViewController.swift
//  FirstApp
//
//  Created by Evgeniy Zatsepin on 03.12.2017.
//  Copyright © 2017 Evgeniy Zatsepin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet weak var logView: NSScrollView!
    
    
    var ini_seconds = 30
    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    var html = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            showNotification()
            runTimer()
        } else {
            seconds -= 1
        }
    }
    
    func runTimer() {
        seconds = ini_seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func getRequest() {
        let url = URL(string: "/parser/livescore_parser.php")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data, let html2 = String(data: data, encoding: String.Encoding.utf8) {
                self.html = html2
            }
        }
        task.resume()
    }
    
    func showNotification() {
        getRequest()
        if !html.isEmpty {
            logView.documentView?.insertText(html)  //insertText(html) //textStorage?.append(NSAttributedString(string: html))
            let notification = NSUserNotification()
        
            notification.title = "LiveScoreMac"
            notification.informativeText = html
            //notification.contentImage = greeting
            notification.soundName = NSUserNotificationDefaultSoundName
        
            NSUserNotificationCenter.default.deliver(notification)
        }
    }

    @IBAction func sayButtonClicked(_ sender: Any) {
        showNotification()
    }
    
}

