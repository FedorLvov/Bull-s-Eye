//
//  AboutViewController.swift
//  BullsEyeGame
//
//  Created by Fedor Lvov on 19/08/2019.
//  Copyright © 2019 Fedor Lvov. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmpPage = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmpPage);
            let request = URLRequest(url: url);
            webView.load(request);
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButton() {
        dismiss(animated: true, completion: nil);
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
