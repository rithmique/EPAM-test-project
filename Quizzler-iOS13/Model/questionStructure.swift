//
//  questionStructure.swift
//  Quizzler-iOS13
//
//  Created by Максим on 17.03.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct Question {
    let question: String
    let answer: String
    var picture: UIImage
    
    init(q: String, a: String, p: UIImage){
        self.question = q.uppercased()
        self.answer = a
        self.picture = p
    }
}
