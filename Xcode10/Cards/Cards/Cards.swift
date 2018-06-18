//
//  Cards.swift
//  Cards
//
//  Created by Gene Backlin on 6/12/18.
//  Copyright © 2018 Gene Backlin. All rights reserved.
//

import UIKit

public class Cards: NSObject {
    
    public class func cardImageNames() -> [String] {
        return ["0", "1", "2", "3", "4", "5"]
    }
    
    public class func cardValues() -> [Int] {
        return [1, 8, 2, 16, 4, 32]
    }

}
