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

    override var nibName: String? {
        return "TodayViewController"
    }

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
        lol()
        completionHandler(.NoData)
    }

    func lol() {
        LunchFetcher.getLunches({(week: [DailyLunches]) -> Void in
            let lunches = self.getLunchesFromToday(week)
            for lunch in lunches {
                print(lunch.name)
            }
        })
    }

    func getLunchesFromToday(week: [DailyLunches]) -> [Lunch] {
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
        return []
    }

}
