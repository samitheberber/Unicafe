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
        RestaurantFetcher.getRestaurants({(restaurants: [Restaurant]) -> Void in
            print(restaurants)
        })
    }

}
