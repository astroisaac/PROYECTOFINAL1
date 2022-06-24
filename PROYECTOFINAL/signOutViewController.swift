
import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class signOutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func CerrarSesion(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
        }catch{
//            se produjo un error
        }
    }
}
