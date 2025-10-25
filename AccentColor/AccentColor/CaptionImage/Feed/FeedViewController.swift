//
//  FeedViewController.swift
//  AccentColor
//
//  Created by Karla Lopez on 18/10/25.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var firstICaptionView: CaptionedImageView!
    @IBOutlet weak var secondCaptionView: CaptionedImageView!
    @IBOutlet weak var thirdCaptionView: CaptionedImageView!
    
    var pictureType: PictureType = .dog
    var showCaption: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        showOrHideCaptions()
        setImagesAndcaptions()

        // Do any additional setup after loading the view.
    }
    
    private func showOrHideCaptions() {
        firstICaptionView.showCaption = !showCaption //si showcaption es falso queremos que se oculte
        secondCaptionView.showCaption = !showCaption
        thirdCaptionView.showCaption = !showCaption
    }
    
    private func setImagesAndcaptions() {
        let captionedImages = pictureType.captionedImages
        firstICaptionView.captionedImage = captionedImages[0]
        secondCaptionView.captionedImage = captionedImages[1]
        thirdCaptionView.captionedImage = captionedImages[2]

    }

}
