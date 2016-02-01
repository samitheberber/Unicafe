//
//  TodayViewController.swift
//  UnicafeToday
//
//  Created by Sami Saada on 27.01.2016.
//
//

import Cocoa
import NotificationCenter

class TodayViewController: NSViewController, NCWidgetProviding, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var restaurantName: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    var lunchesForToday: [Lunch]?

    override var nibName: String? {
        return "TodayViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.restaurantName.stringValue = "Exactum"
        tableView.setDelegate(self)
        tableView.setDataSource(self)
        tableView.target = self
    }

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
        fetchData() {
            (result: Bool, lunches: [Lunch]) in
            if result {
                self.lunchesForToday = lunches
                self.tableView.reloadData()
                completionHandler(.NewData)
            } else {
                self.lunchesForToday = []
                self.tableView.reloadData()
                completionHandler(.NoData)
            }
        }
        completionHandler(.NoData)
    }

    func fetchData(completion: (result: Bool, lunches: [Lunch]) -> Void) {
        LunchFetcher.getLunches({(week: [DailyLunches]) -> Void in
            let lunches = self.getLunchesFromToday(week)
            completion(result: true, lunches: lunches!)
        })
    }

    func getLunchesFromToday(week: [DailyLunches]) -> [Lunch]? {
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE dd.MM"
        let convertedDate = dateFormatter.stringFromDate(currentDate)
        for day in week {
            if day.date == convertedDate {
                return day.lunches!
            }
            //print(day.lunches?.first?.price)
        }
        return nil
    }

    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return self.lunchesForToday?.count ?? 0
    }

    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var text:String=""
        var cellIdentifier:String=""

        guard let item = self.lunchesForToday?[row] else {
            return nil
        }

        if tableColumn == tableView.tableColumns[0] {
            text = item.name!
            cellIdentifier = "NameCellID"
        }
        else if tableColumn == tableView.tableColumns[1] {
            text = item.price!
            cellIdentifier = "PriceCellID"
        }
        if let cell = tableView.makeViewWithIdentifier(cellIdentifier, owner: nil ) as? NSTableCellView {
            cell.textField?.stringValue = text
            return cell
        }
        return nil
    }

}
