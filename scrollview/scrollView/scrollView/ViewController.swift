//
//  ViewController.swift
//  scrollView
//
//  Created by HC2MAC13 on 04/04/18.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = view.frame.insetBy(dx: 2, dy: 2).size
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 10
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UIScrollViewDelegate{
 
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return view
        
    }
    
}
