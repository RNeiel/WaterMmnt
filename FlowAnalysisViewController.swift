//
//  FlowAnalysisViewController.swift
//  Water
//
//  Created by Richard Neiel on 03/07/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit
import Charts

class FlowAnalysisViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var flowChart: LineChartView!
    
    
    let months = ["Jan" , "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]
    
    let dollars1 = [1453.0,2352,5431,1442,5451,6486,1173,5678,9234,1345,9411,2212]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.flowChart.delegate = self
        // 2
        self.flowChart.descriptionText = "Tap node for details"
        // 3
        self.flowChart.descriptionTextColor = UIColor.whiteColor()
        self.flowChart.gridBackgroundColor = UIColor.darkGrayColor()
        // 4
        self.flowChart.noDataText = "No data provided"
        // 5
        setChartData(months)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setChartData(months : [String]) {
        // 1 - creating an array of data entries
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< months.count {
            yVals1.append(ChartDataEntry(value: dollars1[i], xIndex: i))
        }
        
        // 2 - create a data set with our array
        let set1: LineChartDataSet = LineChartDataSet(yVals: yVals1, label: "First Set")
        set1.axisDependency = .Left // Line will correlate with left axis values
        set1.setColor(UIColor.redColor().colorWithAlphaComponent(0.5)) // our line's opacity is 50%
        set1.setCircleColor(UIColor.redColor()) // our circle will be dark red
        set1.lineWidth = 2.0
        set1.circleRadius = 6.0 // the radius of the node circle
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.redColor()
        set1.highlightColor = UIColor.whiteColor()
        set1.drawCircleHoleEnabled = true
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        
        //4 - pass our months in for our x-axis label value along with our dataSets
        let data: LineChartData = LineChartData(xVals: months, dataSets: dataSets)
        data.setValueTextColor(UIColor.whiteColor())
      //  data.leftAxis.drawGridLinesEnabled = false
       // data.rightAxis.drawGridLinesEnabled = false
        //data.xAxis.drawGridLinesEnabled = false
        //data.drawGridBackgroundEnabled = false
        
        //5 - finally set our data
        self.flowChart.data = data
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
