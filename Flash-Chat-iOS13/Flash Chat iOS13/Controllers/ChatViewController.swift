//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase


class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    var messages : [Message] = []
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🪐FlashChat"
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMesages()
        
    }
    
    func loadMesages(){
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener{ (querySnapshot, error) in
                self.messages = []
                if let e = error{
                    print("An error occurred while collecting data!, \(e)")
                }else{
                    if let snapshotDocuments = querySnapshot?.documents{
                        for doc in snapshotDocuments{
                            let data = doc.data()
                            if let messageSender = data[K.FStore.senderField] as? String,
                                let messageBody = data[K.FStore.bodyField] as? String{
                                let newMessage = Message(sender: messageSender,message:messageBody)
                                
                                self.messages.append(newMessage)
                                DispatchQueue.main.async {
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.tableView.reloadData()
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                    
                                }
                            }
                        }
                    }
                }
        }
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {

        if let messageSender = Auth.auth().currentUser?.email, let messageBody = messageTextfield.text{
            db.collection(K.FStore.collectionName)
                .addDocument(data: [K.FStore.senderField: messageSender,
                                    K.FStore.bodyField: messageBody,
                                    K.FStore.dateField:Date().timeIntervalSince1970]){ (error) in
                                        if let e = error{
                                            print("error is \(e)")
                                        }else{
                                            print("Data is successfully added")
                                            DispatchQueue.main.async{
                                                self.messageTextfield.text = ""
                                            }
                                        }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}
// table view u kesfet
// table view and messages connect


//MARK: - datasource

extension ChatViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        if message.sender == Auth.auth().currentUser?.email{
            cell.messageImage.isHidden = false
            cell.messageImage2.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named:K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        }else{
            cell.messageImage.isHidden = true
            cell.messageImage2.isHidden = false
            cell .messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        cell.label.text = message.message
        return cell
    }
    
    
}
// TO DO:
// once git hubdaki repoya git
// proje ye ekle
// app delegateda importla
// app delegateda enable it ve git hub doctan curser i resign da yap
