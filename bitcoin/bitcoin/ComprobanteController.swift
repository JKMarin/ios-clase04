//
//  ComprobanteController.swift
//  bitcoin
//
//  Created by user139236 on 4/26/18.
//  Copyright © 2018 Juan C Marin. All rights reserved.
//

import UIKit
class ComprobanteController: UIViewController {
    //Declaracion de referencias
    @IBOutlet weak var lblBitcoins: UILabel!
    @IBOutlet weak var lblCambio: UILabel!
    @IBOutlet weak var lblEfectivo: UILabel!
    
    //Declaracion de propiedades
    var bitcoinsComprados:Double?=0
    var dolaresCambio:Double?=0
    var dolaresEfectivo:Double?=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Comprobante"
        if let bitcoinsAsignados = bitcoinsComprados {
            lblBitcoins.text = bitcoinsAsignados.cleanFormat(2)
        }
        if let cambioAsignados = dolaresCambio {
            lblCambio.text = cambioAsignados.cleanFormat(2)
        }
        if let efectivoAsignado = dolaresEfectivo {
            lblEfectivo.text = efectivoAsignado.cleanFormat(2)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
