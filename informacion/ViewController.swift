//
//  ViewController.swift
//  informacion
//
//  Created by MaestroD1 on 10/1/19.
//  Copyright © 2019 MaestroD1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tvContactos: UITableView!
    var contactos : [Contacto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactos.append(Contacto(nombre: "Jose", telefono: "(644)4 20 96 54", direccion: "Guerrero 123", correo: "jose@correo.com", foto: "foto1"))
        contactos.append(Contacto(nombre: "María", telefono: "(644)4 85 14 76", direccion: "Ortiz 123", correo: "maria@correo.com", foto: "foto2"))
        contactos.append(Contacto(nombre: "Tania", telefono: "(644)4 96 31 02", direccion: "Morelos 123", correo: "tania@correo.com", foto: "foto3"))
        contactos.append(Contacto(nombre: "Pedro", telefono: "(644)4 01 02 03", direccion: "Hidalgo 123", correo: "pedro@correo.com", foto: "foto4"))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto") as? CeldaContactoController
        
        celda?.imgContacto.image = UIImage(named: contactos[indexPath.row].foto!)
        celda?.lblNombre.text = contactos[indexPath.row].nombre!
        if (contactos[indexPath.row].telefono != nil) {
            celda?.lblTelefono.text = contactos[indexPath.row].telefono!
        } else {
            celda?.lblTelefono.text = ""
        }
        
        
        return celda!
    }
    
    func recargarTabla() {
        tvContactos.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEditar" {
            let destino = segue.destination as? EditarContactoController
            destino?.contacto = contactos[tvContactos.indexPathForSelectedRow!.row]
            destino?.callbackActualizarTabla = recargarTabla
            
        }
    }

}

