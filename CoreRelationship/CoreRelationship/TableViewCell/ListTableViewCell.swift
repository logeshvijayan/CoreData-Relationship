//
//  ListTableViewCell.swift
//  CoreRelationship
//
//  Created by logesh on 12/30/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mobileNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    func setupData(name : String , mobile : Int64)  {
        self.nameLabel.text = name
        self.mobileNumber.text = String(mobile)
    }
    
    
}
