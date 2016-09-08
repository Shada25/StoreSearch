//
//  ViewController.swift
//  StoreSearch
//
//  Created by BT-Training on 08/09/16.
//  Copyright © 2016 BT-Training. All rights reserved.
//

import UIKit

class StoreSearchViewController: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchResults = [SearchResults]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}


extension StoreSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        searchResults.removeAll()
        for i in 0...2 {
            let searchResult = SearchResults()
            searchResult.name = "Fake Result \(i) for"
            searchResult.artistName = "'\(searchBar.text!)'"
            searchResults.append(searchResult)
        }
        
        tableView.reloadData()
    }
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
}


extension StoreSearchViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchResulCell", forIndexPath: indexPath)
        let searchResult = searchResults[indexPath.row]
        cell.textLabel!.text = searchResult.name
        cell.detailTextLabel!.text = searchResult.artistName
        return cell
    }
}

extension StoreSearchViewController: UITableViewDelegate {
    
}
