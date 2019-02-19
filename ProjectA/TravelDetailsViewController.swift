//
//  TravelDetailsViewController.swift
//  ProjectA
//
//  Created by Lawrence Bang on 8/11/18.
//  Copyright © 2018 Lawrence Bang. All rights reserved.
//

import UIKit

class TravelDetailsViewController: UIViewController {

    var travelInfo :Travel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationPicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationPicture.image = travelInfo.picture
        nameLabel.text = travelInfo.name
        addressLabel.text = travelInfo.address
        descriptionLabel.text = travelInfo.descript
        
        //sending the file via message
        let activity = UIActivityViewController(activityItems: [travelInfo], applicationActivities: nil)
        present(activity, animated: true, completion: nil)
    }

}
