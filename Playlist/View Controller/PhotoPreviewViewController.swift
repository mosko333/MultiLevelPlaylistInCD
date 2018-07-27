//
//  PhotoPreviewViewController.swift
//  Playlist
//
//  Created by Adam on 26/07/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class PhotoPreviewViewController: UIViewController {

    var image: UIImage?
    var word: Word?
    
    @IBOutlet weak var photoPreview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    func updateViews() {
        photoPreview.image = image
    }
    

    @IBAction func saveBtn(_ sender: UIButton) {
    //navigationController?.popToViewController(WordDetailViewController(), animated: true)
        //WordDetailViewController().dismiss(animated: true, completion: nil)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
