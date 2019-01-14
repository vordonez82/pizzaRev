//
//  ViewController.swift
//  PizzaAppRev
//
//  Created by Vicente Ordoñez Garcia on 12/30/18.
//  Copyright © 2018 Vicente Ordoñez Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var lblTamanioSel: UILabel!
    var tamanios : Array<Array<String>> = Array<Array<String>>()
    var pizzaCtx : Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tamanios.append(["Chica", "Chica"])
        tamanios.append(["Mediana", "Mediana"])
        tamanios.append(["Grande", "Grande"])
        
        lblTamanioSel.text = ""
        pizzaCtx = Pizza()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView : UIPickerView, numberOfRowsInComponent numberOrRowsInComponent : Int) -> Int {
        return self.tamanios.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.tamanios[row][0]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let tamanioSeleccionado = self.tamanios[row][1]
        lblTamanioSel.text = tamanioSeleccionado
        self.pizzaCtx?.tamanio = tamanioSeleccionado
    }
    
    
    @IBAction func next(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaTipoMasa = segue.destination as! MasaViewController
        vistaTipoMasa.pizzaCtx = self.pizzaCtx
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblTamanioSel.text = pizzaCtx!.tamanio
    }

    func NuevaOrden() {
        self.pizzaCtx = Pizza()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            
        }
    }
}

