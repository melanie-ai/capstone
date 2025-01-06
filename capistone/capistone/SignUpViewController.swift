//
//  SignUpViewController.swift
//  capistone
//
//  Created by Shawneice Salmon on 12/16/24.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn


class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGradientToView(view: view)
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    
    func addGradientToView(view: UIView) {
           let gradientLayer = CAGradientLayer()
           gradientLayer.frame = view.bounds
           gradientLayer.colors = [UIColor.blue.cgColor, UIColor.green.cgColor] // Gradient colors
           gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top-left corner
           gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Bottom-right corner
           view.layer.insertSublayer(gradientLayer, at: 0)
       }
    
    @IBAction func sig(_ sender: Any) {
        
        GIDSignIn.sharedInstance.signOut()
        
        performSegue(withIdentifier: "signout", sender: nil)

        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        
    }
    
}
