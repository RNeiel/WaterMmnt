//
//  LeaderBoardViewController.swift
//  Water
//
//  Created by Richard Neiel on 02/07/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit
import Charts

class LeaderBoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
 
    @IBOutlet weak var tableView_details: UITableView!
    
    @IBOutlet weak var leaderChart: BarChartView!
    
    var items: [String] = ["4 Nampally", "5 Banjara Hills", "6 Q City","7 Hi tech City","8 Madhapur","9 Kukatpally","10 Jubilee Hills","11 Gachibowli","12 Secunderabad"]
    var values: [String] = ["9", "10", "10.5","10.6","11","12","15","16","18"]
    
    let months = ["Jan" , "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]
    
    let dollars1 = [20.0, 4.0, 26.0, 33.0, 19.0, 36.0, 43.0, 48.0, 26.0, 24.0, 52.0, 42.8]
    let unitsBought = [20.0, 24.0, 6.0, 3.0, 12.0, 16.0, 24.0, 18.0, 22.0, 44.0, 35.0, 12.8]
    let unitsBought2 = [26.0, 14.0, 64.0, 32.0, 32.0, 14.0, 43.0, 18.0, 44.0, 42.0, 51.0, 32.8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView_details.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        
        setLeaderChartData(months, values1: dollars1, values2: unitsBought, values3: unitsBought2)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //for names
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
        //return self.items.count
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    
    //for values
    
    func tableView_details(tableView_details: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
        //return self.items.count
        
    }
    
    func tableView_details(tableView_details: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell2:UITableViewCell = self.tableView_details.dequeueReusableCellWithIdentifier("cell2")! as UITableViewCell
        
        cell2.textLabel?.text = self.values[indexPath.row]
        
        return cell2
    }
    
    func tableView_details(tableView_details: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setLeaderChartData(dataPoints: [String], values1: [Double],values2: [Double],values3: [Double]) {
        
        var dataEntries: [BarChartDataEntry] = []
        var dataEntries2: [BarChartDataEntry] = []
        var dataEntries3: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values1[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values2[i], xIndex: i)
            dataEntries2.append(dataEntry)
        }
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values3[i], xIndex: i)
            dataEntries3.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "City1")
        let chartDataSet2 = BarChartDataSet(yVals: dataEntries2, label: "City2")
        let chartDataSet3 = BarChartDataSet(yVals: dataEntries3, label: "City3")
        
        //chartDataSet.setColor(UIColor.orangeColor())
        chartDataSet.colors = [UIColor(red: 210/255, green: 234/255, blue: 187/255, alpha: 1.0)]
        chartDataSet2.colors = [UIColor(red: 242/255, green: 238/255, blue: 164/255, alpha: 1.0) ]
        chartDataSet3.colors = [UIColor(red: 200/255, green: 233/255, blue: 247/255, alpha: 1.0)]
        
        let dataSets: [BarChartDataSet] = [chartDataSet,chartDataSet2, chartDataSet3]
        
        let chartData = BarChartData(xVals: months, dataSets: dataSets)
        leaderChart.data = chartData
        leaderChart.leftAxis.drawGridLinesEnabled = false
        leaderChart.rightAxis.drawGridLinesEnabled = false
        leaderChart.xAxis.drawGridLinesEnabled = false
        leaderChart.drawGridBackgroundEnabled = false
        leaderChart.descriptionText = ""
        leaderChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
    }


}
