//
//  Output.swift
//  chat
//
//  Created by Виктор Новиков on 09.06.17.
//  Copyright © 2017 Виктор Новиков. All rights reserved.
//

import Foundation
import UIKit

protocol InitializerOutput {
    
    weak var viewController: UIViewController! {get set}
    static var identifier: String {get}
    var presenter:Presenter? {get}
    
    func awakeFromNib()
    
    
}
