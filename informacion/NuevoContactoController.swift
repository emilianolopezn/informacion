//
//  NuevoContactoController.swift
//  informacion
//
//  Created by MaestroD1 on 10/4/19.
//  Copyright © 2019 MaestroD1. All rights reserved.
//

import Foundation
import UIKit

class NuevoContactoController : UIViewController {
    
    var callbackAgregar : ((Contacto) -> Void)?
    
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    @IBAction func doTapGuardar(_ sender: Any) {
        let contacto = Contacto(nombre: txtNombre.text!, telefono: txtTelefono.text!, direccion: "", correo: "", foto: "foto2")
        callbackAgregar!(contacto)
        self.navigationController?.popViewController(animated: true)
        
    }
}
