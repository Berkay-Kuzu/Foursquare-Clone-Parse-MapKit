//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Berkay Kuzu on 7.09.2022.
//

import UIKit
import Parse

class SignUpVC: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
         Parse Veri Kaydetmek
        let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "Banana"
        parseObject["calories"] = 150
        parseObject.saveInBackground { success, error in
            if error != nil { // eğer hata nil değilse, yani hata varsa bunları yap:
                print(error?.localizedDescription)
            } else {
                print("uploaded")
            }
        }
         Parse Veri Çekmek
        let query = PFQuery(className: "Fruits")
        //query.whereKey("name", equalTo: "Apple")
        query.whereKey("calories", greaterThan: 120)
        query.findObjectsInBackground { objects, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                print(objects)
            }
        }
         */
        
        
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        if userNameText.text != "" && passwordText.text != "" {
            PFUser.logInWithUsername(inBackground: userNameText.text!, password: passwordText.text!) { user, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error!")
                } else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username/Password??")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        // Kullanıcı Oluşturmak
        if userNameText.text != "" && passwordText.text != "" {
            
            let user = PFUser()
            user.username = userNameText.text! // We know there is an input!
            user.password = passwordText.text! // We know there is an input!
            
            user.signUpInBackground { success, error in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error!")
                } else {
                    //SEGUE
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
                
            }
            
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password??")
        }
        
    }
    // Uyarı Mesajı Oluşturmak
    func makeAlert (titleInput: String, messageInput: String) {
        let alert = UIAlertController(title:titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

