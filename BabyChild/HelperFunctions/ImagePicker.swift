//
//  ImagePicker.swift
//  BabyChild
//
//  Created by Mowsumi Rahman on 03/12/2019.
//  Copyright © 2019 Mowsumi Rahman. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

// UIKit injection of image pickers for photo galery
final class ImagePicker : ObservableObject {
    static let shared : ImagePicker = ImagePicker()
    private init() {}
    let view = ImagePicker.View()
    let coordinator = ImagePicker.Coordinator()
    
    let willChange = PassthroughSubject<UIImage?, Never>()
    @Published var image: UIImage? = nil {
        didSet {
            if image != nil { willChange.send(image) }
        }
    }
}

// Image picking
extension ImagePicker {
    class Coordinator: NSObject,
        UINavigationControllerDelegate,
    UIImagePickerControllerDelegate {
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            ImagePicker.shared.image = uiImage
            picker.dismiss(animated:true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated:true)
        }
    }
}

// Scene control
extension ImagePicker {
    struct View: UIViewControllerRepresentable {
        func makeCoordinator() -> Coordinator {
            ImagePicker.shared.coordinator
        }
        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker.View>) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.delegate = context.coordinator
            return picker
        }
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker.View>) {}
    }
}
