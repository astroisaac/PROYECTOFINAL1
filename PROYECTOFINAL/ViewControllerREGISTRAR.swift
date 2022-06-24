//
//  ViewControllerREGISTRAR.swift
//  PROYECTOFINAL
//
//  Created by ITSN_601_2022 on 17/06/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class ViewControllerREGISTRAR: UIViewController {
    @IBOutlet var usuarioTF: UITextField!
    @IBOutlet weak var emailTF : UITextField!
    @IBOutlet weak var contralTF : UITextField!
    @IBOutlet var lblValidacion: UILabel!
    @IBOutlet var lblCorreoVa: UILabel!
    
    private let db = Firestore.firestore()
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
                db.collection("User").document(email).setData(["Nombre" : usuarioTF.text ?? " "])
                self
                    .performSegue(withIdentifier: "Iniciosegue", sender: self)
                
                }
            }
        }
    }
}
