//
//  Two.swift
//  two
//
//  Created by Jz D on 2021/9/26.
//

import UIKit

class Two: UIViewController {
    let navAnimatorPush = NavBaseCustomAnimatorPush(direction: .left)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "第 2"
        view.backgroundColor = UIColor.blue
        navigationController?.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    
    @IBAction func two(_ sender: Any) {
        
        if var arr = navigationController?.viewControllers{
            arr.removeLast()
            arr.append(Three())
            navigationController?.setViewControllers(arr, animated: true)
        }
    }
    
    
    

}




extension Two: UINavigationControllerDelegate{
    
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push{
            return navAnimatorPush
        }
        else{
            return nil
        }
    }
    
}
