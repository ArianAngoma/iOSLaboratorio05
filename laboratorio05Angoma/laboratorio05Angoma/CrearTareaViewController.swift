//
//  CrearTareaViewController.swift
//  laboratorio05Angoma
//
//  Created by Arian Angoma on 12/04/19.
//  Copyright © 2019 angoma. All rights reserved.
//

import UIKit

class CrearTareaViewController: UIViewController {
    

    @IBOutlet weak var txtNombreTarea: UITextField!
    @IBOutlet weak var swImportante: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func agregar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let tarea = Tarea(context: context);
        tarea.nombre = txtNombreTarea.text!
        tarea.importante = swImportante.isOn
        
        navigationController!.popViewController(animated: true)
    }
}
