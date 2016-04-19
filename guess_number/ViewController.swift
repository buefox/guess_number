//
//  ViewController.swift
//  guess_number
//
//  Created by ANDYYU on 2016/4/19.
//  Copyright © 2016年 ANDYYU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var start_button: UIButton!
    @IBOutlet weak var times_left: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var guess: UITextField!
    @IBOutlet weak var start_num: UITextField!
    @IBOutlet weak var end_num: UITextField!
    @IBOutlet weak var answer: UILabel!
    var s:Int = 0
    var e:Int = 100
    var ans:Int?
    var t = 5
    @IBAction func start_set(sender: UITextField) {
        self.s = Int(sender.text!)!
    }
    @IBAction func end_set(sender: UITextField) {
        self.e = Int(sender.text!)!
        print("\(e)")
    }
    @IBAction func start_tapped(sender: UIButton) {
        srandom(UInt32(time(nil)))
        self.ans = random() % (self.e - self.s) + 1 + self.s
        print("\(ans)")
        self.t = 5
        self.status.text = ""
        self.times_left.text = "Times left: 5"
    }
    @IBAction func guess_set(sender: UITextField) {
        let g = Int(sender.text!)!
        if g == ans{
            self.status.text = "Correct!"
        }
        else{
            if g > ans {
                self.status.text = "Lower!"
            }
            else{
                self.status.text = "Higher!"
            }
        }
        t -= 1
        if t == 0{
            self.times_left.text = "Answer: \(ans!)"
        }
        else{
            self.times_left.text = "Times left: \(t)"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(_:)))
        view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tap(gesture: UITapGestureRecognizer) {
        start_num.resignFirstResponder()
        end_num.resignFirstResponder()
        guess.resignFirstResponder()
        
    }

}

