//
//  ViewController.swift
//  SwiftBlock
//
//  Created by admin on 2017/11/6.
//  Copyright © 2017年 com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        paramsBlockMethods {
            print("调用后")
        }
        
        paramsBlockMethod2 { (a) in
            
            print(a)
        }
        
        paramsMethods3 { (a, b) in
            
            print("\(a),,\(b)")
        }
        
        paramsMethod4 { (a) -> String in
            
            return "这是返回值"
        }
        doSomeThings {
            
            print("逃逸闭包")
        }
    }

    // 一般形式
    func CustomBlock() {
        let callAdd:(Int,Int)->(Int) = {(a:Int,b:Int)->(Int) in
            return a+b
        }
        
        let x = callAdd(100,50)
        print(x)
        
        // 闭包可以根据上下文推断
        let calladd2:(Int,Int)->(Int) = {a,b in
            
            return a+b
        }
        let x2 = calladd2(100,30)
        print(x2)
        
        // 单行表达式，省略return
        let callAdd3:(Int,Int)->(Int) = {a,b in a+b}
        let x3 = callAdd3(100,39)
        print(x3)
        
        // 如果闭包表达式没有参数，可以省略 in，亦可以省略return
        let callAdd4:()->(Int) = {160}
        let x4 = callAdd4()
        print(x4)
        
        // 没有参数，没有返回值
        let call5:()->() = {print("咩有参数，没有返回值")}
        call5()
    }
    
    // 起别名
    
    func TypeBlock() {
        
        typealias addBlock = (Int,Int)->()
        // 实现
        let add1:addBlock = {c,d in
            print("没有返回值\(c)，\(d)")
        }
        
        // 引用
        add1(100,120)
    }
    
    
    // 尾随闭包,作为参数
    typealias paramsBlcok = (Int,Int)->()
    
    // 无参回调
    func paramsBlockMethods(testBlock:()->()) ->() {
        print("调用前")
        testBlock()
    }
    
    // 带参回调,单个参数，无返回值
    
    func paramsBlockMethod2(testBlock:(Int)->()) {
        print("调用paramsBlockMethods")

        testBlock(100)
    }
    
    // 带参回调，多个参数
    
    func paramsMethods3(testBlock:(Int,String)->Void) {
        
        testBlock(140,"你好")
    }
    
    // 带参回调，带返回值
    
    func paramsMethod4(testBlock:(Int)->String) {
        
        let str:String =  testBlock(345)
        
        print(str)
    }
    
    // 逃逸闭包,异步操作常用
    func doSomeThings(some:@escaping()->()) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            
            some()
        }
        print("函数体")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

