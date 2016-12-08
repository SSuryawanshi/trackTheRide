//
//  TripRecorder.swift
//  sampleTrackTheRide
//
//  Created by Suryawanshi, Srikanth (ASPL) on 12/5/16.
//  Copyright © 2016 SSuryawanshi. All rights reserved.
//

import Foundation
import CoreLocation


protocol TripRecordingDelegate: class {
    func didStartTrip()->CLLocation?
    func didStopTrip()->CLLocation?
}

class TripRecorder:NSObject {
    
    weak var delegate:TripRecordingDelegate?
    var locationArr:[CLLocation];
    
    override init() {
        
        self.locationArr = [];
    }
    
    let locationManager = CLLocationManager()
    
    
    func startTripRecording() {
        locationManager.delegate = self;
        locationManager.startUpdatingLocation()
        
        //reset
        self.locationArr.removeAll()
        
    }
    
    func stopTripRecording() {
        //stop updates
        locationManager.stopUpdatingLocation()
        
        //calculate the trip
        
        
    }
}

extension TripRecorder:CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .denied,.notDetermined,.restricted:
            //ask for permission to stop the trip
            break
        default:
            break
        }
    }
   
}

