//
//  ViewController.swift
//  HomeWork10
//
//  Created by Dmitry on 15.01.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }


    @IBOutlet weak var volumeLevelLabel: UILabel!
    @IBOutlet weak var volumeLabelTxtFld: UITextField!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    @IBAction func setVolumeWithSlider(_ sender: Any) {
        let value = volumeSlider.value
        let roundedValue = String(value.rounded())
        volumeLevelLabel.text = roundedValue
        progressView.progress =  value / 10
        volumeLabelTxtFld.text = roundedValue
        
    }
    @IBAction func setVolumeWithTetFld(_ sender: Any) {
        let value =  Float(volumeLabelTxtFld.text ?? "5.0") ?? 5.0
        volumeLevelLabel.text = volumeLabelTxtFld.text
        progressView.progress = value / 10
        volumeSlider.value = value
    }
    
    @IBAction func turnAlarm(_ sender: Any) {
        if alarmSwitch.isOn {
            timeLabel.backgroundColor = .blue
        } else {
            timeLabel.backgroundColor = .gray
        }
    }
    
    @IBAction func setThisTimePressed(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        let time = dateFormatter.string(from: datePicker.date)
        timeLabel.text = time
    }
    
    @IBAction func deleteAlarm(_ sender: Any) {
        timeLabel.text = ""
    }
    
    private func initView() {
        timeLabel.backgroundColor = .blue
    }
}

