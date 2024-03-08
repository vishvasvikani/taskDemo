//
//  ProfilePageVC.swift
//  GallaryApplication
//
//  Created by 2022M16 on 07/03/24.
//

import UIKit
import GoogleSignIn

class ProfilePageVC: UIViewController {
    
    //MARK: - Outlet -
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var colGallary: UICollectionView!
    
    //----------------------------------------------------------------------//
    //MARK: - Custom Variables -
    
    var viewModel = ProfilePageVM()
    
    //----------------------------------------------------------------------//
    
    //MARK: - Custom Methods -
    
    func setUp() {
        self.colGallary.delegate = self
        self.colGallary.dataSource = self
        let nib = UINib(nibName: "CellGallary", bundle: nil)
        self.colGallary.register(nib, forCellWithReuseIdentifier: "CellGallary")
        self.applyTheme()
    }
    
    
    func applyTheme() {
        
        if let name = UserDefaults.standard.value(forKey: "name") as? String {
            self.lblName?.text = "HI,\(name)"
        } else {
            self.lblName.text = ""
            let alert = UIAlertController(title:"Error", message: "Your session is expire please login", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                UserDefaultsConfig.isLogin = false
                UIApplication.shared.manageLogin()
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    //----------------------------------------------------------------------//
    
    //MARK: - Actions -
    
    @IBAction func btnLogout(_ sender: UIBarButtonItem) {
        GIDSignIn.sharedInstance.signOut()
        UserDefaultsConfig.isLogin = true
        UserDefaults.standard.setValue(nil, forKey: "name")
        UserDefaults.standard.synchronize()
        UIApplication.shared.manageLogin()
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

extension ProfilePageVC : UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.numberOfListRow()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellGallary", for: indexPath) as! CellGallary
        cell.configData(viewModel.listRow(for: indexPath.row))
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.colGallary.frame.width - 10) / 2, height: (self.colGallary.frame.height - 30)/3)
    }
    
}
//----------------------------------------------------------------------//
