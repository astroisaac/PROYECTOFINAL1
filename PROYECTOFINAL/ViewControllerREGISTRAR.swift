//
//  ViewControllerREGISTRAR.swift
//  PROYECTOFINAL
//
//  Created by ITSN_601_2022 on 17/06/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class ViewControllerREGISTRAR: UIViewController {
    @IBOutlet weak var emailTF : UITextField!
    @IBOutlet weak var contralTF : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 

    @IBAction func Registart(_ sender: UIButton) {
        if let email = emailTF.text, let password = contralTF.text {
        Auth.auth().createUser(withEmail: email, password: password){authResult, error in
            if let e = error{
                print(e.localizedDescription)
            }else{
                print("Usuario creado con exito.")
                self
                    .performSegue(withIdentifier: "Iniciosegue", sender: self)
            }
            }
        }
    }
}
