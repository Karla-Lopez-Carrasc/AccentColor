//
//  CaptionImage.swift
//  AccentColor
//
//  Created by Karla Lopez on 25/10/25.
//

import UIKit

final class CaptionedImageView: UIView {
    
    @IBOutlet private var image: UIImageView!
    @IBOutlet private var caption: UILabel!
    
//    cada vez que detecte un cambio va a mandar a mostar u ocultar el caption
    var showCaption: Bool = false {
        didSet {
            caption.isHidden = !showCaption
        }
    }
    
    var captionedImage: CaptionImage? {
        didSet{
            caption.text = captionedImage?.caption
            image.image = captionedImage?.image
        }
    }
    
//    sirve cuando las cosas son programaticas
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewWuthBundle()
    }
    
//    para cuando usamos todo desde interface builder
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpViewWuthBundle()
//        COMPLETAR
    }
    
    private func setUpViewWuthBundle(){
        guard let contentView = Bundle.main.loadNibNamed("CaptionedImageView", owner: self)?.first as? UIView else { return }
        addSubview(contentView)
        
//        CONSTRAINTS PROGRAMATICOS
        contentView.translatesAutoresizingMaskIntoConstraints = false //siempre se debe poner
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setUpViewWithNibInicialiser(){
        guard let contentView = UINib(nibName: "CaptionedImageView", bundle: nil).instantiate(withOwner: self).first as? UIView else { return }
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false //siempre se debe poner
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

}
