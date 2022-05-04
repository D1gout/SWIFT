//
//  TableViewController.swift
//  14 - UITableView
//
//  Created by Даниил Ащев on 24.03.2022.
//

import UIKit

class TableViewController: UITableViewController {

    
    var dataArray: [String] = []
    
    @IBAction func pushEditAction(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    func saveData() {
        UserDefaults.standard.set(dataArray, forKey: "dataArrey")
        UserDefaults.standard.synchronize()
    }
    
    func loadData() {
        let data = UserDefaults.standard.object(forKey: "dataArrey")
        if data != nil {
            dataArray = data as! [String]
        } else {
            dataArray = []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        /*
        dataArray.append("1 - Самолёт")
        dataArray.append("2 - Паровоз")
        dataArray.append("3 - Машина")
        dataArray.append("4 - Самокат")
        */

    }
    
    
    
    @IBAction func pushAddAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Добавте транспорт", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Название транспорта"
        }
        
        let alertActionAdd = UIAlertAction(title: "Добавить", style: UIAlertAction.Style.default) { (alertAction) in
            if alert.textFields?.first?.text != "" {
                self.dataArray.append((alert.textFields?.first?.text)!)
                self.tableView.reloadData()
                self.saveData()
            }
            print("push add")
        }
        let alertActionCancel = UIAlertAction(title: "Отмена", style: UIAlertAction.Style.cancel) { (alertAction) in
            print("push cancel")
        }
        
        alert.addAction(alertActionAdd)
        alert.addAction(alertActionCancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let currentTextInCell = dataArray [indexPath.row]
        
        cell.textLabel?.text = currentTextInCell
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataArray.remove(at: indexPath.row)
            saveData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let from = dataArray[fromIndexPath.row]
        
        dataArray.remove(at: fromIndexPath.row)
        dataArray.insert(from, at: to.row)
        
        saveData()
        tableView.reloadData()
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
