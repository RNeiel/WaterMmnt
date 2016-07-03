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
    @IBOutlet var tableView_details: UITableView!
    
    @IBOutlet weak var leaderChart: BarChartView!
    
    var items: [String] = ["We", "Heart", "Swift","","","","","",""]
    var items_2: [String] = ["We", "Heart", "Swift","","","","","",""]
    
    let months = ["Jan" , "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]
    
    let dollars1 = [1453.0,2352,5431,1442,5451,6486,1173,5678,9234,1345,9411,2212]
    let unitsBought = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 12.8]
    let unitsBought2 = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 12.8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView_details.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setLeaderChartData(months, values1: dollars1, values2: unitsBought, values3: unitsBought2)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
        //return self.items.count
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView_details(tableView_details: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
        //return self.items.count
        
    }
    
    func tableView_details(tableView_details: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
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
        chartDataSet.colors = [UIColor.orangeColor(),UIColor.brownColor()]
        chartDataSet2.colors = [UIColor.blackColor(),UIColor.greenColor()]
        chartDataSet3.colors = [UIColor.blueColor(),UIColor.cyanColor()]
        
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
