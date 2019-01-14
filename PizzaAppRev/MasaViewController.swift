//
//  MasaViewController.swift
//  PizzaAppRev
//
//  Created by Vicente Ordoñez Garcia on 12/30/18.
//  Copyright © 2018 Vicente Ordoñez Garcia. All rights reserved.
//

import UIKit

class MasaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var lblMasaSel: UILabel!
    var pizzaCtx : Pizza?
    var masas : Array<Array<String>> = Array<Array<String>>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        masas.append(["Delgada", "Delgada"])
        masas.append(["Gruesa", "Gruesa"])
        masas.append(["Crujiente","Crujiente"])
        
        lblMasaSel.text = ""
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaTipoQueso = segue.destination as! QuesoViewController
        vistaTipoQueso.pizzaCtx = self.pizzaCtx
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblMasaSel.text = pizzaCtx?.masa
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView : UIPickerView, numberOfRowsInComponent numberOrRowsInComponent : Int) -> Int {
        return self.masas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.masas[row][0]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let masaSeleccionado = self.masas[row][1]
        lblMasaSel.text = masaSeleccionado
        self.pizzaCtx!.masa = masaSeleccionado
        print(pizzaCtx!.tamanio)
    }

    @IBAction func next(_ sender: Any) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let VistaTamanio = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            VistaTamanio.pizzaCtx = self.pizzaCtx
        }
    }
}
