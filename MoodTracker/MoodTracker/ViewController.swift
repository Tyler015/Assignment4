import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moodSlider: UISlider!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var savedMoodLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        moodSlider.minimumValue = 0
        moodSlider.maximumValue = 100
        updateMoodLabel(for: Int(moodSlider.value))
    }

    @IBAction func moodSliderChanged(_ sender: UISlider) {
        let moodValue = Int(sender.value)
        updateMoodLabel(for: moodValue)
    }

    func updateMoodLabel(for value: Int) {
        let moodDescription: String
        let emoji: String

        switch value {
        case 0...20:
            moodDescription = "Very Sad"
            emoji = "😢"
        case 21...40:
            moodDescription = "Sad"
            emoji = "🙁"
        case 41...60:
            moodDescription = "Neutral"
            emoji = "😐"
        case 61...80:
            moodDescription = "Happy"
            emoji = "🙂"
        default:
            moodDescription = "Very Happy"
            emoji = "😄"
        }

        moodLabel.text = "\(moodDescription) \(emoji)"
    }

    @IBAction func saveMoodTapped(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let date = formatter.string(from: datePicker.date)
        let emoji = moodLabel.text?.components(separatedBy: " ").last ?? ""
        savedMoodLabel.text = "On \(date), you felt \(emoji)"
    }
}
