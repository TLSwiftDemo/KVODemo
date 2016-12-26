//
//  ViewController.swift
//  KVODemo
//
//  Created by Andrew on 16/9/13.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit

private var myContext = 0

class ViewController: UIViewController {
    
    var house:String?
    
    var stu:Student?
    

    override func viewDidLoad() {
        super.viewDidLoad()
      initView()
    }
    
    deinit{
//       stu?.removeObserver(self, forKeyPath: "name")
        stu?.removeObserver(self, forKeyPath: "name", context: &myContext)
    }

    
    func initView() -> Void {
        stu = Student()
        stu?.addObserver(self, forKeyPath: "name", options: [.New,.Old], context: nil)
        stu?.name = "张三"
        
//        house.addObserver(self, forKeyPath: "name", options: .New, context: nil)
    }

    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        print("keypath:\(keyPath)")
        print("object:\(object)")
        print("change:\(change)")
        print("context:\(context)")
        
        
        
    }
    
    
  

}

