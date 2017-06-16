//
//  MessageModuleMessageModuleViewController.swift
//  OnMap
//
//  Created by Viktor Novikov on 11/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class MessageModuleViewController: UIViewController, MessageModuleViewInput, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    var output: MessageModuleViewOutput!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        collectionView.contentInset = UIEdgeInsets(top: 28, left: 0, bottom: 28, right: 0)
        
        let tap = UITapGestureRecognizer(target: self, action : #selector(self.tapCollectionView))
        tap.numberOfTapsRequired = 1
        self.collectionView.addGestureRecognizer(tap)
        output.viewIsReady()
    }

    // MARK: MessageModuleViewInput
    func setupInitialState() {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollDown(animated: false)
    }

    // Выход из View
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)

        if (self.isMovingFromParentViewController){
            output.back()
        }
    }
    
    // Отправить сообщение
    @IBAction func sendMessageButtonClicked(_ sender: Any) {
        if let text = textField.text {
            output.sendMessage(text: text)
            textField.text = ""
        }
    }
    
    
    //Работа с клавиатурой
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
                //bottom.constant += keyboardSize.height
            }
        }
    }
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    func keyboardDidShow(notification: NSNotification) {
    }

    //Перезагрузить данные
    func reloadData() {
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let text = output.getText(index: indexPath.row)
        if output.isUserMessage(index: indexPath.row) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatUserMessage", for: indexPath) as! ChatUserMessageCell
            cell.textView.text = text
            cell.bubbleWithAncor?.constant = estimateFrameForText(text: text).width + 32
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatInterlocutorMessage", for: indexPath) as! ChatInterlocutorMessageCell
            cell.textView.text = text
            cell.bubbleWithAncor?.constant = estimateFrameForText(text: text).width + 32
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 0
        height = estimateFrameForText(text: output.getText(index: indexPath.row)).height + 16
        return CGSize(width: self.view.frame.width, height: height)
    }
    
    private func estimateFrameForText( text: String ) -> CGRect {
        let size = CGSize(width: 200, height: .max)
        let option = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: option, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)], context: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.didSelect(index: indexPath.row)
        self.view.endEditing(true)
    }
    
    func tapCollectionView() {
        self.view.endEditing(true)
    }
    
    func scrollDown(animated: Bool) {
        let section = (collectionView.numberOfSections) - 1
        let item = (collectionView.numberOfItems(inSection: section)) - 1
        let lastIndexPath = IndexPath(item: item, section: section)
        if item > -1 { collectionView.scrollToItem(at: lastIndexPath, at: .bottom, animated: animated) }
    }
    
}


class ChatUserMessageCell: UICollectionViewCell {
    
    var bubbleWithAncor: NSLayoutConstraint?
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "none"
        tv.font = .systemFont(ofSize: 15)
        tv.textColor = #colorLiteral(red: 0.006915812846, green: 0.09721335024, blue: 0.1624361277, alpha: 1)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.clear
        return tv
    }()
    
    let bubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7981600165, green: 0.9129616022, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(bubbleView)
        addSubview(textView)
        
        bubbleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        bubbleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bubbleWithAncor = bubbleView.widthAnchor.constraint(equalToConstant: 200)
        bubbleWithAncor?.isActive = true
        bubbleView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        textView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: 8).isActive = true
        textView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: bubbleView.rightAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
}

class ChatInterlocutorMessageCell: UICollectionViewCell {
    
    var bubbleWithAncor: NSLayoutConstraint?
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "none"
        tv.font = .systemFont(ofSize: 15)
        tv.textColor = #colorLiteral(red: 0.9431125522, green: 0.9663166404, blue: 0.9970368743, alpha: 1)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.clear
        return tv
    }()
    
    let bubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.09696156532, green: 0.3188226223, blue: 0.4722778201, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(bubbleView)
        addSubview(textView)
        
        bubbleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        bubbleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bubbleWithAncor = bubbleView.widthAnchor.constraint(equalToConstant: 200)
        bubbleWithAncor?.isActive = true
        bubbleView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        textView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: 8).isActive = true
        textView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: bubbleView.rightAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
}
