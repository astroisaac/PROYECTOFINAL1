
import UIKit
import FirebaseAuth
import FirebaseCore

class signOutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func CerrarSesion(_ sender: Any) {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
        }
      
    }
}

