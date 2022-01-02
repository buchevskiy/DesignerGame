//
//  HubViewController.swift
//  DesignerGame
//
//  Created by Андрей Бучевский on 20.09.2021.
//

import UIKit

class HubViewController: UIViewController {

    @IBAction func rightOnTargetButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RightOnTarget")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func selectColorButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectorColorViewContoller")
        self.present(vc, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
