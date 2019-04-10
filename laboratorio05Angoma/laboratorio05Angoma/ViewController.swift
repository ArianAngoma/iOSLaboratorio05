//
//  ViewController.swift
//  laboratorio05Angoma
//
//  Created by Arian Angoma on 5/04/19.
//  Copyright © 2019 angoma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tareas:[Tarea] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tareas = crearTareas()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
        
        if tarea.importante {
            cell.textLabel?.text = "🐒\(tarea.nombre)"
            
        } else {
            cell.textLabel?.text = tarea.nombre
        }
        
        cell.textLabel?.text = tarea.nombre
        return cell
    }
    
    
    
    func crearTareas() -> [Tarea] {
        
        let tarea1 = Tarea()
        tarea1.nombre = "Pasear al perro"
        tarea1.importante = false
        
        let tarea2 = Tarea()
        tarea2.nombre = "Comprar verduras"
        tarea2.importante = true
        
        let tarea3 = Tarea()
        tarea3.nombre = "Lavar los servicios"
        tarea3.importante = false
        
        return [tarea1, tarea2, tarea3]
    }
    

    @IBAction func nuevaTarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarTarea", sender: nil)
    }
}

