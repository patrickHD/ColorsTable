//
//  MainView.swift
//  Colors
//
//  Created by Pat on 3/23/18.
//  Copyright © 2018 Mizzou. All rights reserved.
//

import UIKit

class ColorsViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var colorsTable: UITableView!
    
    //var colorList = ["red", "orange", "yellow", "green", "blue", "purple", "brown"]
    var colorList = [
        Color(name: "red", uiColor: UIColor.red),
        Color(name: "orange", uiColor: UIColor.orange),
        Color(name: "yellow", uiColor: UIColor.yellow),
        Color(name: "green", uiColor: UIColor.green),
        Color(name: "blue", uiColor: UIColor.blue),
        Color(name: "purple", uiColor: UIColor.purple),
        Color(name: "brown", uiColor: UIColor.brown)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Colors"
        colorsTable.delegate = self
        colorsTable.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = colorList[indexPath.row].name
        cell.backgroundColor = colorList[indexPath.row].uiColor
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController,
            let row = colorsTable.indexPathForSelectedRow?.row{
            destination.color = colorList[row]
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorsTable.cellForRow(at: indexPath)?.isSelected = false
    }
    
}



