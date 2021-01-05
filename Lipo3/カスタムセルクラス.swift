import UIKit

class カスタムセルクラス: UITableViewCell {

    @IBOutlet weak var 画像: UIImageView!
    @IBOutlet weak var ラベル: UILabel!
    @IBOutlet weak var ラベル２: UILabel!
    @IBOutlet weak var マーク: UIImageView!
    var WriteDate = "2020-12-30"
    
    func セルに表示するデータの制御(選択数はこれを使う: IndexPath){
      self.ラベル.text = String((選択数はこれを使う.row)+1)
      self.画像.image = UIImage(named: "1.jpg")
      self.ラベル２.text = String("\(WriteDate)")
      self.マーク.image = UIImage(named: "2.png")
    }
    
}
