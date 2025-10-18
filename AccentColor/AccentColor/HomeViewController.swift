//
//  HomeViewController.swift
//  AccentColor
//
//  Created by Karla Lopez on 11/10/25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imageType: UISwitch!
    @IBOutlet weak var captionSwitch: UISwitch!
    @IBOutlet weak var customTextSwitch: UISwitch!
    @IBOutlet weak var customTextField: UITextView!
    @IBOutlet weak var picsButton: UIButton!{
        didSet{
            customTextField.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picsButton.setImage(UIImage(systemName: imageType.isOn ? "dog.fill" :
                                        "cat.fill"), for: .normal)
        customTextField.isEditable = customTextSwitch.isOn
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let feedViewController = segue.destination as? FeedViewController{
            feedViewController.pictureType = imageType.isOn ?.dog : .cat
            feedViewController.showCaption = captionSwitch.isOn
        }else if segue.identifier == "HomeInformationSegue", let InformationViewController = segue.destination as? InformationViewController{
            if customTextSwitch.isOn{
                InformationViewController.informationText = customTextField.text
            }
        }
        
    }
    
//
//    @IBAction func picsButtonTapped(_ sender: Any) {
//    }
    
    @IBAction func loggOutButtonTapped(_ sender: Any) {
        self.navigationController?.dismiss(animated: true)
    }
    
    @IBAction func informationButtonTapped(_ sender: Any){
        if customTextSwitch.isOn{
            if customTextField.text != ""{
                performSegue(withIdentifier: "HomeInformationSegue", sender: nil)
                //homeInformationSegue
            }else{
                let alertController = UIAlertController(title: nil, message: "PAdd custom text", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
                present(alertController, animated: true)
                //alert
            }
        }else{
            //HomeInformationSegue
            performSegue(withIdentifier: "HomeInformationSegue", sender: nil)
        }
    }
    

    @IBAction func imageTypeSwitchValueChanged(_ sender: UISwitch) {
        if sender == imageType{
            picsButton.setImage(UIImage(systemName: sender.isOn ? "dog.fill" : "cat.fill"), for: .normal)
        }
    }
    
    @IBAction func captionTypeSwitchValueChanged(_ sender: UISwitch) {
        customTextField.isEditable = sender.isOn
    }
    
    

}


extension HomeViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let allowedCharacterSet = CharacterSet.alphanumerics.union(CharacterSet.whitespacesAndNewlines)
        let maxCharacterCount = 10
        let currentCharacterCount = textView.text.count
        let finalCharacterCount = currentCharacterCount - range.length + text.count
        return text == "" || (CharacterSet(charactersIn: text).isSuperset(of: allowedCharacterSet) && finalCharacterCount <= maxCharacterCount)
    }
}
