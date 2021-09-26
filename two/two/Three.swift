//
//  Three.swift
//  two
//
//  Created by Jz D on 2021/9/26.
//

import UIKit

class Three: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "第 3"
        view.backgroundColor = UIColor.black
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(Three.three))
        view.addGestureRecognizer(tap)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    
    
    
    
    
    @objc func three() {
        
        
        navigationController?.popViewController(animated: true)
        
        
    }
    
    
    
    
}
