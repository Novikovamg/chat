//
//  AddChatModuleAddChatModuleViewController.swift
//  OnMap
//
//  Created by Viktor Novikov on 15/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class AddChatModuleViewController: UIViewController, AddChatModuleViewInput, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate  {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var output: AddChatModuleViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AddChatModuleViewInput
    func setupInitialState() {
    }

    // Выход из View
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "addChatCell", for: indexPath) as! AddChatTableViewCell
        cell.set(text: output.getChat(identifier: indexPath.row).lastMessage)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectRow(index: indexPath.row)
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            output.searchButtonClicked(searchString: text)
        }
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func dismiss() {
        self.navigationController!.popViewController(animated: true)
    }
}

class AddChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var chatLabel: UILabel!
    
    func set(text: String) {
        chatLabel.text = text
    }
}
