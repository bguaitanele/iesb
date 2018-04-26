//
//  ScrollView.swift
//  scrollView
//
//  Created by HC2MAC13 on 04/04/18.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit

class ScrollView: UIScrollView, UIScrollViewDelegate {

    var container : UIView!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.delegate = self
        self.minimumZoomScale = 1
        self.maximumZoomScale = 5
        // Drawing code
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return container
        
    }
    


}
