//
//  QuesoViewController.swift
//  PizzaAppRev
//
//  Created by Vicente Ordoñez Garcia on 12/30/18.
//  Copyright © 2018 Vicente Ordoñez Garcia. All rights reserved.
//

import UIKit

class QuesoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var lblQuesoSel: UILabel!
    var pizzaCtx : Pizza?
    var quesos : Array<Array<String>> = Array<Array<String>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        quesos.append(["Mozarella", "Mozarella"])
        quesos.append(["Cheddar", "Cheddar"])
        quesos.append(["Parmessano", "Prmessano"])
        quesos.append(["Sin queso", "Sin queso"])
        
        lblQuesoSel.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaIngredientes = segue.destination as! IngredientesViewController
        vistaIngredientes.pizzaCtx = self.pizzaCtx
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblQuesoSel.text = pizzaCtx?.queso
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
        return self.quesos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.quesos[row][0]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let quesoSeleccionado = self.quesos[row][1]
        lblQuesoSel.text = quesoSeleccionado
        self.pizzaCtx!.queso = quesoSeleccionado
    }
    @IBAction func next(_ sender: Any) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let VistaMasa = storyBoard.instantiateViewController(withIdentifier: "MasaViewController") as! MasaViewController
            VistaMasa.pizzaCtx = self.pizzaCtx
        }
    }
}
