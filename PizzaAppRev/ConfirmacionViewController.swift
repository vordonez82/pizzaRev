//
//  ConfirmacionViewController.swift
//  PizzaAppRev
//
//  Created by Vicente Ordoñez Garcia on 12/30/18.
//  Copyright © 2018 Vicente Ordoñez Garcia. All rights reserved.
//

import UIKit

class ConfirmacionViewController: UIViewController {

    @IBOutlet weak var lblSummary: UILabel!
    var pizzaCtx : Pizza?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblSummary.text = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        lblSummary.text = "Su selecciòn es una Pizza \(pizzaCtx?.tamanio ?? ""), tipo de masa: \(pizzaCtx?.masa ?? ""), tipo de queso: \(pizzaCtx?.queso ?? ""), ingredientes: \(pizzaCtx?.ingredientes ?? "")"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaTamanio = segue.destination as! ViewController
        vistaTamanio.pizzaCtx = Pizza()
    }
    
    @IBAction func btnCancelarOrden(_ sender: Any) {
        
        //self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func btnConfirmarOrden(_ sender: Any) {
        if self.pizzaCtx?.tamanio == "" {
            let alerta = UIAlertController(title: "PizzaApp", message: "Falta que seleccione el tamaño de la pizza", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) -> Void in self.error() })
            alerta.addAction(OKAction)
            self.present(alerta, animated: true, completion: nil)
        }
        else if self.pizzaCtx?.masa == "" {
            let alerta = UIAlertController(title: "PizzaApp", message: "Falta seleccionar tipo de masa", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) -> Void in self.error() })
            alerta.addAction(OKAction)
            self.present(alerta, animated: true, completion: nil)
        }
        else if self.pizzaCtx?.queso == "" {
            let alerta = UIAlertController(title: "PizzaApp", message: "Falta seleccionar tipo de queso", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) -> Void in self.error() })
            alerta.addAction(OKAction)
            self.present(alerta, animated: true, completion: nil)
        }
        else if self.pizzaCtx?.ingredientes == "" {
            let alerta = UIAlertController(title: "PizzaApp", message: "Falta seleccionar al menos un ingrediente", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) -> Void in self.error() })
            alerta.addAction(OKAction)
            self.present(alerta, animated: true, completion: nil)
        }
        else {
            let alerta = UIAlertController(title: "PizzaApp", message: "Su orden se ha procesado y en 20 minutos estará lista", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) -> Void in self.terminar() })
            alerta.addAction(OKAction)
            self.present(alerta, animated: true, completion: nil)
        }
    }
    
    func terminar() -> Void  {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let VistaTamanio = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        VistaTamanio.NuevaOrden()
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func error() -> Void {
        print("No se han selccionado todas las opciones")
    }
}
