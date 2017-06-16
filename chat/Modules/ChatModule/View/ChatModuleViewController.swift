//
//  ChatModuleChatModuleViewController.swift
//  OnMap
//
//  Created by Viktor Novikov on 09/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class ChatModuleViewController: UIViewController, ChatModuleViewInput, UITableViewDelegate, UITableViewDataSource {

    var output: ChatModuleViewOutput!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        tableView.reloadData()
        
    }
    
    func barButtonPressed() {
        output.addChatButtonPressed()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Добавляем кнопку перехода на AddChatModule в NavigationBar
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.barButtonPressed))
        self.navigationItem.setRightBarButton(add, animated: false)
    }
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController){
            output.back()
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = output.getChatCount()
        return count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! ChatTableViewCell
        cell.set(lastMessage: output.getChat(identifier: indexPath.row).lastMessage, image: #imageLiteral(resourceName: "city-square-bellevue-apartments-exterior"))
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectRow(index: indexPath.row)
    }

    
    func reloadData() {
        tableView.reloadData()
    }
}


class ChatTableViewCell : UITableViewCell {
    
    @IBOutlet weak var chatImage: UIImageView!
    @IBOutlet weak var lastMessageLabel: UILabel!
    
    func set(lastMessage: String, image: UIImage) {
        lastMessageLabel.text = lastMessage
        chatImage.image = image
    }
    
}
