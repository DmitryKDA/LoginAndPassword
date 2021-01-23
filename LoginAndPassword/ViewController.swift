//
//  ViewController.swift
//  LoginAndPassword
//
//  Created by Дмитрий Крутько on 14.01.21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
    //MARK: IB Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    private let userName = "Roman"
    private let userPassword = "111"

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        passwordTextfield.delegate = self
    }
    
    //MARK: IB Actions
    @IBAction func loginButtonPresed() {
        passwordTextfield.resignFirstResponder()
        nameTextField.becomeFirstResponder()
        controlNameAndPassword()
    }
    @IBAction func forgotNameButtonPressed() {
        showAlert(title: "UserName is", message: userName)
    }
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Password is", message: userPassword)
    }
    
    private func controlNameAndPassword() {
        guard let name = nameTextField.text,
              let password = passwordTextfield.text,
              name == userName,
              password == userPassword
        
        else {
            showAlert(title: "Access denied", message: "Enter correct username and password")
            passwordTextfield.text?.removeAll()
            return
        }
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    private func showAlert (title: String, message: String) {
        let alert = UIAlertController (title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else {
            return
        }
        guard let text = nameTextField.text else { return }
        secondVC.text = text
        nameTextField.text = nil
        passwordTextfield.text = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            nameTextField.resignFirstResponder()
            passwordTextfield.becomeFirstResponder()
        } else {
            passwordTextfield.resignFirstResponder()
            nameTextField.becomeFirstResponder()
            controlNameAndPassword()
        }
        return true
    }
    
    @IBAction func unwindSegue(_ unwindSegue: UIStoryboardSegue) {
    }

    deinit {
        print("startVC is deinited")
    }
}

