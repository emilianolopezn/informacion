//
//  EditarContactoController.swift
//  informacion
//
//  Created by MaestroD1 on 10/1/19.
//  Copyright © 2019 MaestroD1. All rights reserved.
//

import Foundation
import UIKit

class EditarContactoController : UIViewController {
    
    var contacto : Contacto?
    var callbackActualizarTabla : (() -> Void)?

    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    
    override func viewDidLoad() {
        txtTelefono.text = contacto!.telefono
        txtNombre.text = contacto!.nombre
    }
    
    @IBAction func doTapGuardar(_ sender: Any) {
        contacto?.nombre = txtNombre.text
        contacto?.telefono = txtTelefono.text
        callbackActualizarTabla!()
    }
}
