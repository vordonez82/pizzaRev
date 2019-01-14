//
//  IngredientesViewController.swift
//  PizzaAppRev
//
//  Created by Vicente Ordoñez Garcia on 12/30/18.
//  Copyright © 2018 Vicente Ordoñez Garcia. All rights reserved.
//

import UIKit

class IngredientesViewController: UIViewController {
    
    @IBOutlet weak var opJamon: UISwitch!
    @IBOutlet weak var opPepperoni: UISwitch!
    @IBOutlet weak var opPavo: UISwitch!
    @IBOutlet weak var opSal: UISwitch!
    @IBOutlet weak var opAceituna: UISwitch!
    @IBOutlet weak var opCebolla: UISwitch!
    @IBOutlet weak var opPimiento: UISwitch!
    @IBOutlet weak var opPinia: UISwitch!
    
    @IBOutlet weak var opAnchoa: UISwitch!
    
    var ingredientes : String?
    var pizzaCtx : Pizza?

    @IBAction func jamonCheck(_ sender: UISwitch) {
        let ingrediente = "Jamón, "
        if sender.isOn {
            ingredientes = ingredientes! + ingrediente
        }
        else {
            if ingredientes!.contains(ingrediente)
            {
                ingredientes = ingredientes!.replacingOccurrences(of: ingrediente, with: "")
            }
        }
        pizzaCtx?.ingredientes = ingredientes!
    }
    @IBAction func PepperoniCheck(_ sender: UISwitch) {
        let ingrediente = "Peperonni, "
        if sender.isOn {
            ingredientes = ingredientes! + ingrediente
        }
        else {
            if ingredientes!.contains(ingrediente)
            {
                ingredientes = ingredientes!.replacingOccurrences(of: ingrediente, with: "")
            }
        }
        
        pizzaCtx?.ingredientes = ingredientes!
    }
    @IBAction func PavoCheck(_ sender: UISwitch) {
        let ingrediente = "Pavo, "
        if sender.isOn {
            ingredientes = ingredientes! + ingrediente
        }
        else {
            if ingredientes!.contains(ingrediente)
            {
                ingredientes = ingredientes!.replacingOccurrences(of: ingrediente, with: "")
            }
        }
        
        pizzaCtx?.ingredientes = ingredientes!
    }
    @IBAction func SalchichaCheck(_ sender: UISwitch) {
        let ingrediente = "Salchicha, "
        if sender.isOn {
            ingredientes = ingredientes! + ingrediente
        }
        else {
            if ingredientes!.contains(ingrediente)
            {
                ingredientes = ingredientes!.replacingOccurrences(of: ingrediente, with: "")
            }
        }
        
        pizzaCtx?.ingredientes = ingredientes!
    }
    @IBAction func AceitunaCheck(_ sender: UISwitch) {
        let ingrediente = "Aceituna, "
        if sender.isOn {
            ingredientes = ingredientes! + ingrediente
        }
        else {
            if ingredientes!.contains(ingrediente)
            {
                ingredientes = ingredientes!.replacingOccurrences(of: ingrediente, with: "")
            }
        }
        
        pizzaCtx?.ingredientes = ingredientes!
    }
    @IBAction func CebollaCheck(_ sender: UISwitch) {
        let ingrediente = "Cebolla, "
        if sender.isOn {
            ingredientes = ingredientes! + ingrediente
        }
        else {
            if ingredientes!.contains(ingrediente)
            {
                ingredientes = ingredientes!.replacingOccurrences(of: ingrediente, with: "")
            }
        }
        pizzaCtx?.ingredientes = ingredientes!
    }
    @IBAction func PimientoCheck(_ sender: UISwitch) {
        let ingrediente = "Pimiento, "
        if sender.isOn {
            ingredientes = ingredientes! + ingrediente
        }
        else {
            if ingredientes!.contains(ingrediente)
            {
                ingredientes = ingredientes!.replacingOccurrences(of: ingrediente, with: "")
            }
        }
        
        pizzaCtx?.ingredientes = ingredientes!
    }
    @IBAction func PiniaCheck(_ sender: UISwitch) {
        let ingrediente = "Piña, "
        if sender.isOn {
            ingredientes = ingredientes! + ingrediente
        }
        else {
            if ingredientes!.contains(ingrediente)
            {
                ingredientes = ingredientes!.replacingOccurrences(of: ingrediente, with: "")
            }
        }
        pizzaCtx?.ingredientes = ingredientes!
    }
    @IBAction func AbchoaCheck(_ sender: UISwitch) {
        let ingrediente = "Anchoa, "
        if sender.isOn {
            ingredientes = ingredientes! + ingrediente
        }
        else {
            if ingredientes!.contains(ingrediente)
            {
                ingredientes = ingredientes!.replacingOccurrences(of: ingrediente, with: "")
            }
        }
        pizzaCtx?.ingredientes = ingredientes!
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaConfirmacion = segue.destination as! ConfirmacionViewController
        vistaConfirmacion.pizzaCtx = self.pizzaCtx
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ingredientes = pizzaCtx?.ingredientes
        if ingredientes!.contains("Jamón, ") {
            opJamon.isOn = true
        }
        if ingredientes!.contains("Peperonni, , ") {
            opPepperoni.isOn = true
        }
        if ingredientes!.contains("Pavo, ") {
            opPavo.isOn = true
        }
        if ingredientes!.contains("Salchicha, ") {
            opSal.isOn = true
        }
        if ingredientes!.contains("Aceituna, ") {
            opAceituna.isOn = true
        }
        if ingredientes!.contains("Cebolla, ") {
            opCebolla.isOn = true
        }
        if ingredientes!.contains("Pimiento, ") {
            opPimiento.isOn = true
        }
        if ingredientes!.contains("Piña, ") {
            opPinia.isOn = true
        }
        if ingredientes!.contains("Anchoa, ") {
            opAnchoa.isOn = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func next(_ sender: Any) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let VistaQueso = storyBoard.instantiateViewController(withIdentifier: "QuesoViewController") as! QuesoViewController
            VistaQueso.pizzaCtx = self.pizzaCtx
        }
    }
}
