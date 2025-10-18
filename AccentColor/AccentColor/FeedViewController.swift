//
//  FeedViewController.swift
//  AccentColor
//
//  Created by Karla Lopez on 18/10/25.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var firstCaption: UILabel!
    @IBOutlet weak var secondCaption: UILabel!
    @IBOutlet weak var thirdhCaption: UILabel!
    
    var pictureType: PictureType = .dog
    var showCaption: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        showOrHideCaptions()
        setImagesAndcaptions( )

        // Do any additional setup after loading the view.
    }
    
    private func showOrHideCaptions() {
        firstCaption.isHidden = !showCaption //si showcaption es falso queremos que se oculte
        secondCaption.isHidden = !showCaption
        thirdhCaption.isHidden = !showCaption
    }
    
    private func setImagesAndcaptions() {
        let captionedImages = pictureType.captionedImages
        firstCaption.text = captionedImages[0].caption
        secondCaption.text = captionedImages[1].caption
        thirdhCaption.text = captionedImages[2].caption
        firstImageView.image = captionedImages[0].image
        secondImageView.image = captionedImages[0].image
        thirdImageView.image = captionedImages[0].image

    }

}
