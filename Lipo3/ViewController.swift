import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var todoList = ["Cell 1", "Cell 2", "Cell 3", "Cell 4", "Cell 5"]
    @IBOutlet weak var マイテーブル: UITableView!
    
    override func viewDidLoad() {
        
        let userDefaults = UserDefaults.standard
        super.viewDidLoad()
        マイテーブル.register (UINib(nibName: "カスタムセルクラス", bundle: nil),forCellReuseIdentifier:"再利用セル")
    
        if let storedTodoList = userDefaults.array(forKey: "todoList") as? [String] {
            todoList.append(contentsOf: storedTodoList)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "再利用セル", for: indexPath) as! カスタムセルクラス
        cell.セルに表示するデータの制御 ( 選択数はこれを使う : indexPath )
        return cell
      }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
            if editingStyle == UITableViewCell.EditingStyle.delete {
                todoList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            }
        }
    
        @IBAction func addBtnAction(_ sender: Any) {
        let alertController = UIAlertController(title: "ToDo追加", message: "ToDoを入力してください。", preferredStyle: UIAlertController.Style.alert)
           alertController.addTextField(configurationHandler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (acrion: UIAlertAction) in
            if let textField = alertController.textFields?.first {
                
                        self.todoList.insert(textField.text!, at: 0)
                        self.マイテーブル.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right)
            }
                    }
           alertController.addAction(okAction)
           let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
           alertController.addAction(cancelButton)
           present(alertController, animated: true, completion: nil)
    }


}

