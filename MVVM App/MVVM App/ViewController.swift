//
//  ViewController.swift
//  MVVM App
//
//  Created by Macbook Air on 1/30/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // let data = ["One","Two","Four","Five","Six",]
    
  //  var model = [ToDoModel]()
    var viewModel = [ViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func didTapAdd(_ sender: Any) {
        let alert = UIAlertController(title: "New item", message: "Enter to do list item", preferredStyle: .alert)
        alert.addTextField { (field) in
            field.placeholder = "Enter text"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
//                    print(text)
                let model = ToDoModel(arrTitle: text)
                    print("model: \(text)")
                    self.viewModel.append(ViewModel.init(arrTitle: text))
                    self.tableView.reloadData()
                }
            }
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        
        let Mvvm = viewModel[indexPath.row]
        cell.title.text = Mvvm.arrTitle
        
        return cell
        
    }
    
    
}

