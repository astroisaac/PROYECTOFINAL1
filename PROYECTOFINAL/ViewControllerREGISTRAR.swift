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
    @IBOutlet var lblValidacion: UILabel!
    @IBOutlet var lblCorreoVa: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblValidacion.isHidden = true
        lblCorreoVa.isHidden = true
    }
    

 

    @IBAction func Registart(_ sender: UIButton) {
        if let email = emailTF.text, let password = contralTF.text {
            Auth.auth().createUser(withEmail: email, password: password){ [self]
            authResult, error in
            if let e = error{
                self.lblValidacion.isHidden = false
                self.lblCorreoVa.isHidden = false
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
