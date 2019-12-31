//
//  TableView.swift
//  CoreRelationship
//
//  Created by logesh on 12/30/19.
//  Copyright © 2019 logesh. All rights reserved.
//

//MARK: - Modules
import Foundation
import UIKit

//MARK: - Class
class listTableView : UIViewController
{
    //MARK: - Variables
    var name : [String] = []
    var mobileNumber : [Int] = []
    
    //MARK: - OUtlets
    @IBOutlet weak var listTableView: UITableView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.name = []
        self.mobileNumber = []
        self.getData()
        listTableView.reloadData()
    }
    
    //MARK: - Functions
    func setupTableView()  {
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    func getData()  {
        let na =  CoreStore.shared.readData()
               for n in na {
                name.append(n.name!)
               }
        
        let mn = CoreStore.shared.readcontactData()
        for cont in mn{
            mobileNumber.append(Int(cont.mobileNumber))
        }
    }
}


//MARK:- Table View Delegate and DataSource
extension listTableView : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as! ListTableViewCell
        tableViewCell.setupData(name: name[indexPath.row], mobile: Int64(mobileNumber[indexPath.row]))
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66.0
    }
    
    
}
