//
//  ViewController.swift
//  RasPi-BLE
//
//  Created by Ross Justin on 12/5/16.
//  Copyright © 2016 Ross Justin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NRFManagerDelegate {
  
  var nrfManager:NRFManager!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    nrfManager = NRFManager(
      onConnect: {
        print("C: ★ Connected")
    },
      onDisconnect: {
        print("C: ★ Disconnected")
    },
      onData: {
        (data:Data?, string:String?)->() in
        print("C: ⬇ Received data - String: \(string) - Data: \(data)")
    },
      autoConnect: false
    )
    
    nrfManager.verbose = true
    nrfManager.delegate = self
  }
  
  func sendData() {
    let string = "Hello World!"
    let result = self.nrfManager.writeString(string)
    print("⬆ Sent string: \(string) - Result: \(result)")
  }
  
  @IBAction func connectButtonPressed(_ sender: Any) {
    nrfManager.connect()
  }
  
  @IBAction func disconnectButtonPressed(_ sender: Any) {
    nrfManager.disconnect()
  }
  
  @IBAction func sendButtonPressed(_ sender: Any) {
    sendData()
  }
  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

