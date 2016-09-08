//
//  ViewController.swift
//  StoreSearch
//
//  Created by BT-Training on 08/09/16.
//  Copyright © 2016 BT-Training. All rights reserved.
//

import UIKit


// struct for the cell identifiers
struct TableCellIdentifiers {
    static let searchResultCell = "SearchResultCell"
    static let nothingFoundCell = "NothingFoundCell"
}

class StoreSearchViewController: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchResults = [SearchResults]()
    var hasSearched = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        
        let cellNib = UINib(nibName: TableCellIdentifiers.searchResultCell, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: TableCellIdentifiers.searchResultCell)
        tableView.registerNib(UINib(nibName: TableCellIdentifiers.nothingFoundCell, bundle: nil), forCellReuseIdentifier: TableCellIdentifiers.nothingFoundCell)
        
        searchBar.becomeFirstResponder()        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}


extension StoreSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        searchResults.removeAll()
        hasSearched = true
        
        if searchBar.text != "Justin bieber" {
            for i in 0...2 {
                let searchResult = SearchResults()
                searchResult.name = "Fake Result \(i) for"
                searchResult.artistName = "'\(searchBar.text!)'"
                searchResults.append(searchResult)
            }
        }
        tableView.reloadData()
    }
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
}


extension StoreSearchViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !hasSearched {
            return 0
        }else if searchResults.count == 0 {
            return 1
        }else {
            return searchResults.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if searchResults.count == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(TableCellIdentifiers.nothingFoundCell, forIndexPath: indexPath)
            cell.selectionStyle = .None
            return cell
        }else {
            let searchResult = searchResults[indexPath.row]
            let cell = tableView.dequeueReusableCellWithIdentifier(TableCellIdentifiers.searchResultCell, forIndexPath: indexPath) as! SearchResultCell
            cell.nameLabel!.text = searchResult.name
            cell.artistNameLabel!.text = searchResult.artistName
            cell.selectionStyle = .Default
            return cell
        }
    }
}

extension StoreSearchViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if searchResults.count == 0{
            return nil
        }else {
            return indexPath
        }
    }
}
