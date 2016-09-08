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
    var hasSearched = false
    
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchResulCell", forIndexPath: indexPath)
        if searchResults.count == 0 {
            cell.textLabel!.text = "(No result found)"
            cell.detailTextLabel!.text = ""
            cell.selectionStyle = .None
        }else {
            let searchResult = searchResults[indexPath.row]
            cell.textLabel!.text = searchResult.name
            cell.detailTextLabel!.text = searchResult.artistName
            cell.selectionStyle = .Default
        }
        
        return cell
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
