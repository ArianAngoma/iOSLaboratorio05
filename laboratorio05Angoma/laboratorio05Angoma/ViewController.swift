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
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerTareas()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
        
        if tarea.importante {
            cell.textLabel?.text = "🦁 \(tarea.nombre!)"
            
        } else {
            cell.textLabel?.text = tarea.nombre!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tarea = tareas  [indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: tarea)
    }
    

    @IBAction func nuevaTarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarTarea", sender: nil)
    }
    
    func obtenerTareas() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tareas = try context.fetch(Tarea.fetchRequest()) as! [Tarea]
        } catch {
            print("AH OCURRIDO UN ERROR")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "tareaSeleccionadaSegue" {
            let siguienteVC = segue.destination as! TareaCompletadaViewController
            siguienteVC.tarea = sender as! Tarea
        }
    }
}

