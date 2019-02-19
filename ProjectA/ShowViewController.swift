//
//  ShowViewController.swift
//  ProjectA
//
//  Created by Lawrence Bang on 9/11/18.
//  Copyright © 2018 Lawrence Bang. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var travels = [Travel]()
    var selectedTravels : Travel!
    
    //search (update table)
    var currentTravelArray = [Travel]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // search
        setUpSearchBar()
        
        // layout
        alterLayout()
        
        let compressedData  = UserDefaults.standard.object(forKey: "data") as! Data
        travels =  NSKeyedUnarchiver.unarchiveObject(with: compressedData) as! [Travel]
        
        currentTravelArray = travels
    }

    // search
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    // layout
    func alterLayout() {
        table.tableHeaderView = UIView()
        // search bar in section header
        table.estimatedSectionHeaderHeight = 50
        // search bar in navigation bar
        navigationItem.titleView = searchBar
        searchBar.placeholder = "Search the Place here"
    }
    /*
    // table header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return searchBar
    }
    */
    /*
    // search bar in section header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    */
    
    // search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentTravelArray = travels;
            table.reloadData()
            return
        }
        currentTravelArray = travels.filter({ travel -> Bool in
            travel.name.lowercased().contains(searchText.lowercased())
        })
        table.reloadData()
    }    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTravelArray.count
        //return travels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TravelTableViewCell
        cell.imgView.image = currentTravelArray[indexPath.row].picture
        cell.nameLabel.text = currentTravelArray[indexPath.row].name
        cell.addressLabel.text = currentTravelArray[indexPath.row].address
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedTravels = currentTravelArray[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationController =  segue.destination as! TravelDetailsViewController
        destinationController.travelInfo = selectedTravels
    }
    

}
