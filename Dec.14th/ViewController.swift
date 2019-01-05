//
//  ViewController.swift
//  Dec.14th
//
//  Created by s20171103194 on 2018/12/14.
//  Copyright © 2018 s20171103194. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dotInput = false; //判断小数点是否已输入
    var newInput = true;  //判断是否输入新的数值
    var cacheNumber = ""  //缓冲临时数值
    var op = ""  //缓冲运算符
    
    @IBOutlet weak var resultLabel: UITextField!
    
    
    //点击小数点
    @IBAction func dotClick(_ sender: UIButton) {
        if !dotInput{  //如果小数点未输入，则执行下面语句
            resultLabel.text! += "."
            dotInput = true
        }
    }
    
    //点击数字按钮
    @IBAction func numberClick(_ sender: UIButton) {
        //输入单个整数
        //resultLabel.text = sender.titleLabel?.text
        
        //输入整数
        //let screenNum = Int(resultLabel.text! )
        //resultLabel.text = "\(screenNum! * 10 + Int(sender.titleLabel!.text!)!)"
        
        let screenNum = Int(resultLabel.text! )
        if dotInput{  //如果小数点输入，则执行下面语句
            resultLabel.text! += sender.titleLabel!.text!
        }
        else{  //如果小数点未输入，则执行下面语句
            resultLabel.text = "\(screenNum! * 10 + Int(sender.titleLabel!.text!)!)"
        }
    }
    
    //点击 + - * / 运算符按钮
    @IBAction func operatorClick(_ sender: UIButton) {
        cacheNumber = resultLabel.text!
        op = sender.titleLabel!.text!
        resultLabel.text = "0"
        dotInput = false
        newInput = true
    }
    
    //运算
    func calculate(){
        let num1 = Double(cacheNumber)!
        let num2 = Double(resultLabel.text!)!
        var result:Double
        if "+" == op {
            result = num1 + num2
        }
        else if "-" == op {
            result = num1 - num2
        }
        else if "*" == op {
            result = num1 * num2
        }
        else if "/" == op {
            result = num1 / num2
        }
        else {
            result = 0
        }
        resultLabel.text = "\(result)"
        dotInput = false
        newInput = true
        
    }
    
    //点击运算按钮 =
    @IBAction func equalClick(_ sender: UIButton) {
        calculate()
    }
    
    
    //复位 AC 按钮
    @IBAction func clearClick(_ sender: UIButton) {
        dotInput = false
        newInput = true
        cacheNumber = "0"
        op = ""
        resultLabel.text = "0"
    }
}

