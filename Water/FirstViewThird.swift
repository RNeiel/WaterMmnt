//
//  FirstViewThird.swift
//  WaterManagement
//
//  Created by IE3PMDP000046 on 28/06/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit
import MapKit
import Charts
import Alamofire

class FirstViewThird: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var consumptionChart: BarChartView!
    @IBOutlet weak var flowChart: LineChartView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let GLocation = Location.sharedInstance
        
        // mapView.delegate = self
        
        print ("I am in second")
        print( GLocation )
        
        
        let Hydet = MKCoordinateRegionMake(GLocation.Position,MKCoordinateSpanMake(0.05, 0.05))
        
        
        mapView.setRegion(Hydet , animated: true)
        
        readConsumption()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addRoute() {
        let thePath = NSBundle.mainBundle().pathForResource("EntranceToGoliathRoute", ofType: "plist")
        let pointsArray = NSArray(contentsOfFile: thePath!)
        
        let pointsCount = pointsArray!.count
        
        var pointsToUse: [CLLocationCoordinate2D] = []
        
        for i in 0...pointsCount-1 {
            let p = CGPointFromString(pointsArray![i] as! String)
            pointsToUse += [CLLocationCoordinate2DMake(CLLocationDegrees(p.x), CLLocationDegrees(p.y))]
        }
        
        let myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsCount)
        
        mapView.addOverlay(myPolyline)
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer! {
        if overlay is MKCircle{
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.fillColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 0.2)
            return circleRenderer
        }
        
        if overlay is MKPolyline {
            let lineView = MKPolylineRenderer(overlay: overlay)
            lineView.strokeColor = UIColor.blueColor()
            
            return lineView
        }
        
        return nil
    }

    
    func readConsumption()
    {
        
        
        Alamofire.request(.GET, "https://honwaterserviceapi.azurewebsites.net/api/Consumption", parameters: ["foo" : "bar"]) .responseJSON { response in
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                
                print("Details:\(JSON[0]["ConsumptioninLitres"])")
//                let id = JSON[0]["LocName"]
//                print(id)
//                let id2 = JSON[1]["LocName"]
//                print(id2)
//                
//                
//                for index in JSON as! [AnyObject]{
//                    
//                    guard let id = index["LocId"] as? Int
//                        else
//                    {
//                        return}
//                    
//                    guard let latitude = index["LocLat"] as? String
//                        else
//                    {
//                        return}
//                    
//                    guard let longitude = index["LocLong"] as? String
//                        else
//                    {
//                        return}
//                    
//                    guard let health = index["LocHealth"] as? Int
//                        else
//                    {
//                        return}
//                    
//                    guard let name = index["LocName"] as? String
//                        else
//                    {
//                        return}
//                    
//                    
//                    
//                    print(id)
//                    
//                    let loc = WaterLocnDetails(locID: id,locLong: latitude,locLat: longitude,locHealth: health,locName: name)
//                    self.locationArray.append(loc)
                
                    
                }
                
                
                
            }
    
    
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
