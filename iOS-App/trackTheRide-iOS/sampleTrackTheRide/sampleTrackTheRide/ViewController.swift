//
//  ViewController.swift
//  sampleTrackTheRide
//
//  Created by Pratima Suryawanshi on 23/11/16.
//  Copyright © 2016 SSuryawanshi. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let useAppInBackground = true;
    
    //this var will be true is start trip is pressed but put on hold coz of permission.
    var startTripPending = false;
    
    var locnMgr =   CLLocationManager();
    
    

    
    
    @IBOutlet weak var tripStatusTextF: UITextField!
    
    @IBOutlet weak var tripDetailsTextView: UITextView!
    
    @IBAction func startTripPressed(_ sender: Any) {
        
        self.startTripPending = true;
        
        if self.locationEnabled() {
            self.startTripPending = false;
            
            //start the trip
            self.startTrip()
        } else {
            if useAppInBackground {
                locnMgr.requestAlwaysAuthorization()
            } else {
                locnMgr.requestWhenInUseAuthorization()
            }
        }
    }
    

    @IBAction func stopTripPressed(_ sender: Any) {
        //stop trip
    }
    
    func locationEnabled() -> Bool {
        
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
                return false;
            case .authorizedAlways, .authorizedWhenInUse:
                return true;
            }
        } else {
            return false;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startTrip() {
        
    }
    
    func stopTrip() {
        
    }
}

//MARK: Location Manager delegates
extension ViewController :CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case    .authorizedAlways,.authorizedWhenInUse:
            
            if self.startTripPending {
                self.startTrip()
            }
            //start the trip
            break
        case    .denied,.notDetermined,.restricted :
            //stop the trip
            self.stopTrip()
            break
            
        }
    }
}

