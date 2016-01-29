//
//  TodayViewController.swift
//  UnicafeToday
//
//  Created by Sami Saada on 27.01.2016.
//
//

import Cocoa
import NotificationCenter

class TodayViewController: NSViewController, NCWidgetProviding {

    var lunchesForToday: [Lunch]?

    override var nibName: String? {
        return "TodayViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
        fetchData() {
            (result: Bool, lunches: [Lunch]) in
            if result {
                self.lunchesForToday = lunches
                self.updateLunches()
                completionHandler(.NewData)
            } else {
                completionHandler(.NoData)
            }
        }
    }

    func updateLunches() {
        for lunch in self.lunchesForToday! {
            print(lunch.name)
        }
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

}
