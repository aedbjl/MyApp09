//
//  ViewController.swift
//  MyApp09
//
//  Created by iii-user on 2017/6/26.
//  Copyright © 2017年 iii-user. All rights reserved.
//

//執行 佇列 main => UI only


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    
    private var a = 0
    
    @IBAction func test1(_ sender: Any) {
        //global 與 main 的差異
        //cpu 分時的效果展現
        //async sync  差異
        //main 不能使用sync
        
        
        DispatchQueue.global().async {
            self.task1() //不同層級的queue 需呼叫
        }
//        DispatchQueue.main.async {
//            self.task2()
//        }
//        DispatchQueue.global().async {
//            self.task3()
//        }
           }
    
    func task1(){
        for i in 1...10{
            print(i)
//            sleep(1)
            usleep(200*1000)
            DispatchQueue.main.async {
                self.label1.text = String(i)
            }
//            self.label1.text = String(i)
        }
        
    }
    func task2(){
        for i in 11...20{
            print(i)
//            sleep(1)
            usleep(200*1000)
            DispatchQueue.main.async {
                self.label2.text = String(i)
            }
        }
        
    }
    func task3(){
        for i in 21...30{
            print(i)
            //            sleep(1)
            usleep(200*1000)
        }
        
    }

    
    @IBAction func test2(_ sender: Any) {
        DispatchQueue.global().async {
            self.task2()
        }
    }
    @IBAction func test3(_ sender: Any) {
        let opq = OperationQueue()
        opq.addOperation {
            for i in 1...100 {
                sleep(1)
                DispatchQueue.main.async {
                    self.label1.text = String(i)
                }
            }
        }
        opq.addOperation {
            for i in 1...100 {
                usleep(100*1000)
                DispatchQueue.main.async {
                    self.label2.text = String(i)
                }
            }

        }
        
    }
    
    @IBAction func test4(_ sender: Any) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
        (timer) in
            self.task4()
           
        })
    }
    
    func task4(){
        
            a += 1
        
        label1.text = String(a)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

  

}

