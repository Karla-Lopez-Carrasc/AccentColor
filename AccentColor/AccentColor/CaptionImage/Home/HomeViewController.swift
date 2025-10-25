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
        setBarButtonItemGroup()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
//
//    @IBAction func picsButtonTapped(_ sender: Any) {
//    }
    
//    @IBAction func loggOutButtonTapped(_ sender: Any) {
//        self.navigationController?.dismiss(animated: true)
//    }
    
    @objc func informationButtonTapped(_ sender: Any){
        if customTextSwitch.isOn{
            if customTextField.text != ""{
                navigateToInformationController()                //homeInformationSegue
            }else{
                let alertController = UIAlertController(title: nil, message: "PAdd custom text", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
                present(alertController, animated: true)
                //alert
            }
        }else{
            //HomeInformationSegue
            navigateToInformationController()
        }
    }
    
    private func setBarButtonItemGroup(){
        let logoutButton = UIBarButtonItem(title: "Logout", image: UIImage(systemName: "multiply.circle.fill"), target: self, action: #selector(logout))
        let informationButton = UIBarButtonItem(title: "Information", image: UIImage(systemName: "info.circle.fill"), target: self, action: #selector(informationButtonTapped))
        navigationItem.centerItemGroups = [UIBarButtonItemGroup.fixedGroup(items: [logoutButton, informationButton])]
    }
    
    @objc
    private func logout(){
        navigationController?.dismiss(animated: true)

    }
    
    private func navigateToInformationController(){
        let infoViewController = InformationViewController(nibName: nil, bundle: nil)
        if customTextSwitch.isOn{
            infoViewController.informationText = customTextField.text
        }
        present(infoViewController, animated: true)
    }
    
    

    @IBAction func imageTypeSwitchValueChanged(_ sender: UISwitch) {
        if sender == imageType{
            picsButton.setImage(UIImage(systemName: sender.isOn ? "dog.fill" : "cat.fill"), for: .normal)
        }
    }
    
    @IBAction func captionTypeSwitchValueChanged(_ sender: UISwitch) {
        customTextField.isEditable = sender.isOn
    }
    
    @IBAction func picsButtonTapped(_ sender: UIButton) {
        let feedViewController = FeedViewController(nibName: nil, bundle: nil)
        feedViewController.pictureType = imageType.isOn ?.dog : .cat
        feedViewController.showCaption = captionSwitch.isOn
        
        navigationController?.pushViewController(feedViewController, animated: true)
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
