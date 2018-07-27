//
//  WordDetailViewController.swift
//  Playlist
//
//  Created by Adam on 26/07/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class WordDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var word: Word?
    
    @IBOutlet weak var playlistLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var wordImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        playlistLabel.text = word?.song?.playlist?.name
        artistLabel.text = word?.song?.artist
        songLabel.text = word?.song?.name
        wordLabel.text = word?.name
        guard let imageData = word?.image else { return }
        wordImage.image = UIImage(data: imageData)
    }

    @IBAction func addPictureBtnTapped(_ sender: UIBarButtonItem) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true)
            } else {
                print("Camera not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        guard let word = word else { return }
        WordController.addImage(with: image, to: word)
        wordImage.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        //1) check the identifier of the segue
//        if segue.identifier == "toCameraVC" {
//
//            //2) Get the destination of where you want to go
//            if let destinationVC = segue.destination as? CameraViewController {
//                    destinationVC.word = word
//            }
//        }
//    }

}
