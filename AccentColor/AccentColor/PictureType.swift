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
        
    var captionedImages: [(image: UIImage, caption: String)]{
        switch self{
        case .dog:
            return [
                //FORMAS DE INICIALIZAR IMAGENES DESDE ASSSETS
                (UIImage.dog1, "Peluzo"),
                (UIImage(resource: .dog2), "Fido"),
                (UIImage(named: "dog-3") ?? UIImage(), "Milaneso")
            ]
        case .cat:
            return [
                (UIImage.cat1, "Milo"),
                (UIImage.cat2, "Tolacoyo"),
                (UIImage.cat3, "Frostinky")
            ]
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

}
