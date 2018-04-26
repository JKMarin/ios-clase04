//
//  ViewController.swift
//  bitcoin
//
//  Created by user139236 on 4/21/18.
//  Copyright © 2018 Juan C Marin. All rights reserved.
//

import UIKit
extension Double {
    //Se extiende la Clase Double para darle formato de miles y decimales para mostarlo en pantalla
    func cleanFormat(_ decimals:Int) ->  String {//formato miles
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = decimals
        formatter.minimumFractionDigits = decimals
        
        return  formatter.string(from: NSNumber(value:self))!
    }
    var cleanValue: String {//formato con o sin decimales segun el valor
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
        
    }
    func cleanValueTo(_ decimals:Int) -> String {//formato con N o sin decimales segun el valor
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.\(decimals)f",self)
        
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    //Declaracion de referencia a los objetos
    @IBOutlet weak var textDolares: UITextField!
    
    //Declaracion de Constantes
    let precioBitCoin:Double = 1500
    
    //Declaracion de propiedades
    var bitcoinsResultado:Double?=0
    var cambioResultado:Double?=0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textDolares.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {//Para menejo de REturn en Teclado
        self.view.endEditing(true)
        return true;
    }
    
    //Mostar mensaje
    func mostrarMensaje(_ mensaje:String){
        let alertController: UIAlertController = UIAlertController(title: "Mensaje", message: mensaje, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    //Valida si el textbox tiene un valor valido
    func validaEntrada() -> Bool {
        if textDolares.text == ""{
            return false
        }
        
        if let _ = Double(textDolares.text!){
            return true
            
        }else{
            return false
        }
    }
    
    //Convierte dolares a bitcoins, siempre y cuando se pueda comprar al menos 1
    func comprar(_ dolares:Double) -> Double? {
        if dolares < precioBitCoin {
            return nil
        }else{
            return Double(Int(dolares/precioBitCoin))
        }
    }
    
    //Retorna el cambio que sobra al comprar bitcins por el precio dado
    func cambio(_ dolares:Double) -> Double {
        return dolares.truncatingRemainder(dividingBy: precioBitCoin)
    }
    
    //Valida antes de transaision
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if let ident = identifier {
            if ident == "comprar" {
                if validaEntrada() {
                    if let bitcoins=comprar(Double(textDolares.text!)!){
                        bitcoinsResultado=bitcoins
                        cambioResultado=cambio(Double(textDolares.text!)!)
                    }else{
                        mostrarMensaje("No se cuenta con el suficiente dinero para reallizar a compra")
                        return false
                    }
                }else{
                    mostrarMensaje("Se debe incluir un valor valido")
                    return false
                }
            }
        }
        return true
    }
    
    //antes de la tansision y traslado de variabes
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "comprar" {
            let nextViewController = segue.destination as? ComprobanteController
            if let svc = nextViewController {
                svc.bitcoinsComprados = bitcoinsResultado
                svc.dolaresCambio = cambioResultado
                svc.dolaresEfectivo = Double(textDolares.text!)!
            }
        }
    }
}

