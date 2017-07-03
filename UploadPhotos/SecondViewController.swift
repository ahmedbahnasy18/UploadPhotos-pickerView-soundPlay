//
//  SecondViewController.swift
//  UploadPhotos
//
//  Created by ahmed on 6/29/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    var mySound: AVAudioPlayer!

    @IBOutlet var langaugesBtn: UIButton!
    @IBOutlet var languagesPicker: UIPickerView!
    
    @IBOutlet var scrollView: UIScrollView!
    
    var languagesArr = ["Swift", "Objective-C", "Java", "JavaScript", "C#"]
    override func viewDidLoad() {
        super.viewDidLoad()
        languagesPicker.dataSource = self
        languagesPicker.delegate = self
        languagesPicker.isHidden = true
        
        scrollView.addSubview(langaugesBtn)
        scrollView.addSubview(languagesPicker)
        
        //scrollView.backgroundColor = UIColor.darkGray
        //scrollView.contentSize = CGSize(width: view.frame.size.width, height: 10)
    
        let path = Bundle.main.path(forResource: "my", ofType: "mp3")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try mySound = AVAudioPlayer(contentsOf: soundURL)
            mySound.prepareToPlay()
        }catch let err as NSError {
            print(err.debugDescription)
        }
    }

    
    @IBAction func languagesBtnPressed(_ sender: AnyObject) {
        languagesPicker.isHidden = false
    }

    @IBAction func palyBtnPressed(_ sender: AnyObject) {
        mySound.play()
    }
    @IBAction func stopBtnPressed(_ sender: AnyObject) {
        if mySound.isPlaying {
            mySound.stop()
        }
    }
}

extension SecondViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.languagesArr.count
    }
}

extension SecondViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return self.languagesArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        langaugesBtn.setTitle(self.languagesArr[row], for: UIControlState.normal)
        languagesPicker.isHidden = true
    }
}
