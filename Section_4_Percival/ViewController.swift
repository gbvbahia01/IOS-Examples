//
//  ViewController.swift
//  Section_4_Percival
//
//  Created by Guilherme B V Bahia on 25/06/17.
//  Copyright © 2017 Planet Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   @IBOutlet weak var labelSeconds: SecondLabel!
   
   let INIT_TIME = 210
   
   var timer : Timer? = nil;
   var seconds = 0
   
   let nameSValues : [String:Int] = ["Egg": 210, "Potato": 320, "Manioc": 360, "Carrot": 260, "Onion": 110]
   
   override func viewDidLoad() {
      super.viewDidLoad()
      timer = Timer()
      updateSecondsLabel()
      seconds = INIT_TIME
      updateSecondsLabel()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


   @IBAction func playTapped(_ sender: Any) {
      labelSeconds.stopBlink()
      playAction()
   }
   
   @IBAction func lessTenTapped(_ sender: UIBarButtonItem) {
      lessTenAction()
   }
   
   @IBAction func resetTapped(_ sender: UIBarButtonItem) {
      pauseAction()
      seconds = INIT_TIME;
      updateSecondsLabel()
      playAction()
   }
   
   @IBAction func plusTenTapped(_ sender: UIBarButtonItem) {
      plusTenAction()
   }
   
   @IBAction func pauseTapped(_ sender: UIBarButtonItem) {
      pauseAction()
      updateSecondsLabel()
   }
   
   private func pauseAction() {
      timer?.invalidate()
   }
   
   private func playAction() {
      timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.secondPassed), userInfo: nil, repeats: true)
   }
   
   private func lessTenAction() {
      seconds -= 10
      if seconds < 0 {
         seconds = 0
      }
      updateSecondsLabel()
   }

   private func plusTenAction() {
      seconds += 10
   }
   
   private func updateSecondsLabel() {
      labelSeconds.text = String(seconds)
   }
   
   func secondPassed() {
      seconds -= 1
      if seconds < 0 {
         seconds = 0
         pauseAction()
         labelSeconds.startBlink()
      }
      updateSecondsLabel()
   }
   
   
   //Table Stufs
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return nameSValues.count
   }
   
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "celltime")
          cell.textLabel?.text = " \([String](nameSValues.keys)[indexPath.row]) - \(String(([Int](nameSValues.values))[indexPath.row])) "
      return cell
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      seconds = ([Int](nameSValues.values))[indexPath.row]
      updateSecondsLabel()
   }
   
}

