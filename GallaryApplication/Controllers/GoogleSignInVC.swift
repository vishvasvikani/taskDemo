//
//  GoogleSignInVC.swift
//  GallaryApplication
//
//  Created by 2022M16 on 07/03/24.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class GoogleSignInVC: UIViewController {
    
    
    //MARK: - Outlet -
    
    @IBOutlet weak var imgGoogle: UIImageView!
    @IBOutlet weak var btnGoogleSignIn: UIButton!
    @IBOutlet weak var imgLogo: UIImageView!
    
    //----------------------------------------------------------------------//
    
    //MARK: - Custom Variables -
        
    
    //----------------------------------------------------------------------//
    
    //MARK: - Custom Methods -
    
    func setUp() {
        self.imgGoogle.image = UIImage(named: "imgGoogle")
        self.imgLogo.image = UIImage(named: "imgLogo")
        DispatchQueue.main.async {
            self.btnGoogleSignIn.layer.cornerRadius = 10.0
        }
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                if let error = error {
                    // Handle the error
                    print("Error restoring previous sign-in: \(error.localizedDescription)")
                } else if user != nil {
                    // User restored successfully
                    print("User restored: \(user.debugDescription)")
                } else {
                    // No previous sign-in found
                    print("No previous sign-in found.")
                }
            }
        }  
    }
    
    
    
    
    //----------------------------------------------------------------------//
    
    //MARK: - Actions -
    
    
    @IBAction func btnGoogleSignInTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            
            guard let signInResult = signInResult else { return }
            UserDefaultsConfig.isLogin = true
            print(signInResult.user.profile?.name)
            if let profile = signInResult.user.profile {
                UserDefaults.standard.setValue(profile.name, forKey: "name")
                UserDefaults.standard.synchronize()
            }
            UIApplication.shared.manageLogin()
            
        }
    }
    //----------------------------------------------------------------------//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUp()
    }
    
}

//----------------------------------------------------------------------//

//MARK: - LifeCycle Method -

//----------------------------------------------------------------------//
