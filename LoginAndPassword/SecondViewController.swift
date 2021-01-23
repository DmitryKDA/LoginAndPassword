//
//  SecondViewController.swift
//  LoginAndPassword
//
//  Created by Дмитрий Крутько on 14.01.21.
//

import UIKit

class SecondViewController: UIViewController {
    var text = ""
    
    let firstColor = UIColor(red: 233/255, green: 29/255, blue: 139/255, alpha: 1.0)
    let secondColor = UIColor(red: 159/255, green: 121/255, blue: 50/255, alpha: 1.0)
    let gradientLayer = CAGradientLayer()
    
    @IBOutlet weak var GreetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        GreetingLabel.text = "Hello, \(text)!"
        setViewColor()

    }
    
    private func setViewColor (){
        let firstColor = UIColor(red: 233/255, green: 29/255, blue: 139/255, alpha: 1.0).cgColor
        let secondColor = UIColor(red: 159/255, green: 121/255, blue: 50/255, alpha: 1.0).cgColor
        let thirdColor = UIColor(red: 50/255, green: 220/255, blue: 200/255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame // можно вместо .frame .bonds
        gradientLayer.colors = [firstColor, secondColor, thirdColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
        
    }
    
    @IBAction func goBackButtonPressed() {
        performSegue(withIdentifier: "goBackSegue", sender: nil)
    }

    deinit {
        print("SecondVC is deinited")
    }
}
