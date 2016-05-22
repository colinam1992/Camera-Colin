//
//  ViewController.swift
//  Camera Colin
//
//  Created by colin on 21/05/2016.
//  Copyright © 2016 colin. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet weak var postText: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    

    @IBOutlet var imageView: UIImageView!
    
    // Create a place to render the filtered image
    let context = CIContext(options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func takePhoto(sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    
    @IBAction func selectButton(sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)

    }

          @IBAction func shareButtClicked(sender: UIButton) {
        var activityItems: [AnyObject]?
        let image = imageView.image
        
        if (postImage.image != nil) {
            activityItems = [postText.text, postImage.image!]
        } else {
            activityItems = [postText.text]
        }
        
        let activityController = UIActivityViewController(activityItems:
            activityItems!, applicationActivities: nil)
        self.presentViewController(activityController, animated: true,
                                   completion: nil)
    }
    
    
 
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

