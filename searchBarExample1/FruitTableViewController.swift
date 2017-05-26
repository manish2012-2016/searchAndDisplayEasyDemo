//
//  FruitTableViewController.swift
//  searchBarExample1
//
//  Created by Manish Kumar on 06/12/16.
//  Copyright © 2016 appface. All rights reserved.
//

import UIKit

class FruitTableViewController: UITableViewController,UISearchBarDelegate,UISearchDisplayDelegate {
    var searchActive : Bool = false
    var fruitName = ["Apple","orange","Guava","Mango","Lichi","Pineapple","Watermilon"]
    var filter = [String]()
    
    @IBOutlet weak var searchBarAction: UISearchBar!
    
    @IBOutlet var tableContent: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableContent.dataSource = self
        tableContent.delegate = self
        searchBarAction.delegate = self
        }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
      searchActive = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
      searchActive  = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false 
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filter = fruitName.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
//        if(filter.count == 0){
//            searchActive = false
//        } else {
//            searchActive = true
//        }
        searchActive = true
        if searchText == ""{
            searchActive = false
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchActive{
        return filter.count
        }
        else{
    
            return fruitName.count

        }
            }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if searchActive{
        cell.textLabel?.text = filter[indexPath.row]
        
        }else{
       cell.textLabel?.text = fruitName[indexPath.row]
                 }
        return cell
    }
 
   
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Fruit"
    }
  
    
}
