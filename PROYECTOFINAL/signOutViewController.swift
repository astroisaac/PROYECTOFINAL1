
import UIKit
import FirebaseAuth
import FirebaseCore

class signOutViewController: UIViewController {
    var nombreSign : String = ""
    @IBOutlet var lblUser: UILabel!
    override func viewDidLoad() {
        lblUser.text = "\(nombreSign)"
        super.viewDidLoad()
    }
    
    @IBAction func CerrarSesion(_ sender: Any) {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        navigationController?.popViewController(animated: true)
        
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
        }
      
    }
}

