//
//  ViewController.swift
//  TeamOneIOS
//
//  Created by 이범준 on 2022/04/13.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    var ref : DatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //유저가 로그인 상태인지 확인해주는 프로퍼티
        if let user = Auth.auth().currentUser {
            emailTextField.placeholder = "이미 로그인 된 상태입니다."
            pwTextField.placeholder = "이미 로그인 된 상태입니다."
        }
    }


    @IBAction func loginButtonTouched(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: pwTextField.text!) { (user, error) in
            if user != nil {
                print("login success")
            } else {
                print("login fail")
            }
        }
    }

}

