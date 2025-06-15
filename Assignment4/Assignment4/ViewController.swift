//
//  ViewController.swift
//  Assignment4
//
//  Created by user277244 on 6/12/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moodSlider: UISlider!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var savedMoodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moodSlider.minimumValue = 0
        moodSlider.maximumValue = 100
        moodSlider.value = 50
        updateMoodLabel(for: moodSlider.value)
    }

    @IBAction func sliderValueChanged( sender: UISlider){
        updateMoodLabel(for: sender.value)
    }
    
    func updateMoodLabel( for value: Float){
        let moodText: String
        let moodEmoji: String
        
        switch value {
        case 0...20:
            moodText = "Very Sad"
            moodEmoji = "😢"
            
        case 21...40:
            moodText = "Sad"
            moodEmoji = "😕"
            
        case 41...60:
            moodText = "Neutral"
            moodEmoji = "😐"
            
        case 61...80:
            moodText = "Happy"
            moodEmoji = "🙂"
            
        case 81...100:
            moodText = "Verry Happy"
            moodEmoji = "😆"
        default:
            moodText = "Neutral"
            moodEmoji = ""
        }
        moodLabel.text = "\(moodText) \(moodEmoji)"
    }
    
    @IBAction func saveMoodTapped( sender: UIButton){
        let selectedDate = datePicker.date
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        
        let dateString = formatter.string(from: selectedDate)
        
        let moodText = moodLabel.text ?? ""
        let emoji = moodText.components(separatedBy: " ").last ?? ""
        
        savedMoodLabel.text = "on \(dateString), you felt \(emoji)"
        
    }

}

