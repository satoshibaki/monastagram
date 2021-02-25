//
//  MessageViewController.swift
//  monastagram
//
//  Created by 中村智史 on 2021/02/21.
//
import UIKit
import Firebase
import SVProgressHUD

class MessageViewController: UIViewController{
    
    var postData: PostData?
    
    @IBOutlet weak var CommentLabel: UILabel!
    @IBOutlet weak var messagetextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func messagepost(_ sender: Any) {
        
        let message = messagetextField.text
        
        // 更新データを作成する
        var updateValue: FieldValue
        
        // 今回新たなmessageを追加する更新データを作成
        updateValue = FieldValue.arrayUnion([message as Any])
        
        // messageに更新データを書き込む
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData!.id)
        postRef.updateData(["message": updateValue])
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
