// PROGRAMMER:  Dominique Felix
// PANTHERID:   4199402
// CLASS:       COP 4655-01
// INSTRUCTOR:  Steve Luis ECS 282
// ASSIGNMENT:  Group Project (STARS App)
// DUE:         Tuesday 12/6/18
//

import Foundation
import UIKit

class profileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var profileName: UITextField!
    @IBOutlet var profileEmail: UITextField!
    @IBOutlet var profileNumber: UITextField!
    var data = modelData.getSome
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileName.text = data.profileName
        profileEmail.text = data.profileEmail
        profileNumber.text = data.profileNumber
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takePicture(_ sender: UIButton)
    {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            imagePicker.sourceType = .camera
        }
        else
        {
            imagePicker.sourceType = .photoLibrary
        }
        
        imagePicker.delegate = self
        
        // Place image picker on the screen
        present(imagePicker, animated: true, completion: nil)
    }
    
    // Function for putting the picture onto the UIImageView and adding to the contact info
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String: Any]) {
        
        // Get picked image from info dictionary
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        imageView.image = image
        
        // Take image picker off the screen -
        // you must call this dismiss method
        dismiss(animated: true, completion: nil)
    }

}
