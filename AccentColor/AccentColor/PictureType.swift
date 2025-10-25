//
//  PictureType.swift
//  AccentColor
//
//  Created by Karla Lopez on 18/10/25.
//
import UIKit
import Foundation
enum PictureType{
    case dog, cat
    
    var captionedImages: [CaptionImage]{
        switch self{
        case .dog:
            return [
                //FORMAS DE INICIALIZAR IMAGENES DESDE ASSSETS
                .init(image: UIImage.dog1, caption: "Peluzo"),
                .init(image: UIImage(resource: .dog2), caption: "Fido"),
                .init(image: UIImage(named: "dog-3") ?? UIImage(), caption: "Milaneso")
            ]
        case .cat:
            return [
                .init(image: UIImage.cat1, caption: "Milo"),
                .init(image: UIImage.cat2, caption: "Tolacoyo"),
                .init(image: UIImage.cat3, caption: "Frostinky")
            ]
        }
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
struct CaptionImage {
        var image: UIImage
        var caption: String
    }


