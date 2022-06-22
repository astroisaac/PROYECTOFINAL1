//
//  ViewControllerINICIAR.swift
//  PROYECTOFINAL
//
//  Created by ITSN_601_2022 on 17/06/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class ViewControllerINICIAR: UIViewController {

    @IBOutlet weak var correoTF: UITextField!
    @IBOutlet weak var contraTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func iniciarsesion(_ sender: UIButton) {
        if let email = correoTF.text, let password = contraTF.text{
            Auth.auth().signIn(withEmail: email, password: password){
                authResult, error in
                if let e = error{
                    print(e.localizedDescription)
                }
                else{
                    print("Inicio de sesion exitosa")
                    self.performSegue(withIdentifier: "InicioSegue", sender: self)
                }
            }
        }
    }
    
}
