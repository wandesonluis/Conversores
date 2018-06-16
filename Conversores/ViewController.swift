//
//  ViewController.swift
//  Conversores
//
//  Created by MacOSSierra on 31/03/18.
//  Copyright © 2018 MacOSSierra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dolar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Kilômetro", for: .normal)
            default :
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
    }
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch lbUnit.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcPeso()
            case "Moeda":
                calcMoeda()
            default :
                calcDistance()
        }
        view.endEditing(true) //fechar teclado
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result) // convert para 2 casas decimais apos virgula
    }
    func calcTemperature(){
        guard let temperature = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Farenheint"
            lbResult.text = String(temperature * 1.8 + 32.0)
        }else{
            lbResultUnit.text = "Celcius"
            lbResult.text = String((temperature * -32.0) / 1.8)
        }
    }
    func calcPeso(){
        guard let peso = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Libra"
            lbResult.text = String(peso / 2.2046)
        }else{
            lbResultUnit.text = "Kilograma"
            lbResult.text = String(peso * 2.2046)
        }
        
    }
    func calcMoeda(){
        guard let currency = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Dolar"
            lbResult.text = String(currency / 3.5)
        }else{
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 3.5)
        }
        
    }
    func calcDistance(){
        guard let distance = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Kilometro"
            lbResult.text = String(distance * 1000)
        }else{
            lbResultUnit.text = "Metro"
            lbResult.text = String(distance / 1000)
        }
        
    }


}

