//
//  ViewControllerINICIAR.swift
//  PROYECTOFINAL
//
//  Created by ITSN_601_2022 on 17/06/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
class ViewControllerINICIAR: UIViewController {

    @IBOutlet weak var correoTF: UITextField!
    @IBOutlet weak var contraTF: UITextField!
    @IBOutlet var lblinicioVa: UILabel!
    @IBOutlet var lblinicioContra: UILabel!
    private let db = Firestore.firestore()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        lblinicioVa.isHidden = true
        lblinicioContra.isHidden = true
    }
    @IBAction func iniciarsesion(_ sender: UIButton) {
        if let email = correoTF.text, let password = contraTF.text{
            Auth.auth().signIn(withEmail: email, password: password){
                authResult, error in
                if let e = error{
                    print(e.localizedDescription)
                    self.lblinicioVa.isHidden = false
                    self.lblinicioContra.isHidden = false
                }
                else{
                    print("Inicio de sesion exitosa")
                    self.db.collection("users").document(email).getDocument {
                        (documentSnapshot, error) in
                        if let document = documentSnapshot, error == nil {
                            if let Nombre = document.get("Nombre") as? String{
                                func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                                    if segue.identifier == "LoginSegue"{
                                        let info1 = segue.destination as! signOutViewController
                                        info1.nombreSign = Nombre
                                }
                                
                            }
                        }
                    }
                    self.performSegue(withIdentifier: "LoginSegue", sender: self)
                }
            }
        }
    }
}
}
