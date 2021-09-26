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
        
        
        let s = UIScreen.main.bounds.size
        let tip = UILabel()
        tip.textAlignment = .center
        tip.textColor = UIColor.white
        tip.backgroundColor = UIColor.gray
        tip.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        tip.center = CGPoint(x: s.width / 2.0, y: s.height / 2.0)
        tip.text = "3 后退"
        view.addSubview(tip)
        
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
