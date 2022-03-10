import CareKit
import CareKitStore
import UIKit
import SwiftUI

class ScheduleViewController: OCKDailyPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Schedule"
    }
    
    override func dailyPageViewController(_ dailyPageViewController: OCKDailyPageViewController, prepare listViewController: OCKListViewController, for date: Date) {
        
        //let identifiers = ["steps", "surveys", "painSurvey", "sampleWalkingTask"]
        let identifiers = ["sampleWalkingTask", "onboardingSurvey", "reportFall"]
        var query = OCKTaskQuery(for: date)
        query.ids = identifiers
        query.excludesTasksWithNoEvents = true
        
        storeManager.store.fetchAnyTasks(query: query, callbackQueue: .main) { result in
            switch result {
            case .failure(let error): print("Error: \(error)")
            case .success(let tasks):
                
                
                /* TIP VIEW */
                
                // Add a non-CareKit view into the list
                let tipTitle = "Your GaitMate Schedule:"
                let tipText = "Complete your daily tasks and fill your rings."
                
                // Only show the tip view on the current date
                if Calendar.current.isDate(date, inSameDayAs: Date()) {
                    let tipView = TipView()
                    tipView.headerView.titleLabel.text = tipTitle
                    tipView.headerView.detailLabel.text = tipText
                    tipView.imageView.image = UIImage(named: "walking_man_2")
                    listViewController.appendView(tipView, animated: false)
                }
                
                 
                /* NUMERIC PROGRESS TASK VIEW */
                
                if #available(iOS 14, *), let walkTask = tasks.first(where: { $0.id == "steps" }) {
                    
                    let view = NumericProgressTaskView(
                        task: walkTask,
                        eventQuery: OCKEventQuery(for: date),
                        storeManager: self.storeManager)
                        .padding([.vertical], 10)
                    
                    listViewController.appendViewController(view.formattedHostingController(), animated: false)
                }
                
                /* PAIN SURVEY */
                /*
                if let surveyTask = tasks.first(where: { $0.id == "painSurvey" }) {
                    let surveyCard = SurveyItemViewController(
                        viewSynchronizer: SurveyItemViewSynchronizer(),
                        task: surveyTask,
                        eventQuery: .init(for: date),
                        storeManager: self.storeManager)
                    
                    listViewController.appendViewController(surveyCard, animated: false)
                }
                 */
                
                if let sampleWalkingTask = tasks.first(where: { $0.id == "sampleWalkingTask" }) {
                    let surveyCard = SurveyItemViewController(
                        viewSynchronizer: SurveyItemViewSynchronizer(),
                        task: sampleWalkingTask,
                        eventQuery: .init(for: date),
                        storeManager: self.storeManager)
                    
                    listViewController.appendViewController(surveyCard, animated: false)
                }
                
                if let surveyTask = tasks.first(where: { $0.id == "onboardingSurvey" }) {
                    let surveyCard = SurveyItemViewControllerOnboarding(
                        viewSynchronizer: SurveyItemViewSynchronizerOnboarding(),
                        task: surveyTask,
                        eventQuery: .init(for: date),
                        storeManager: self.storeManager)
                    
                    listViewController.appendViewController(surveyCard, animated: false)
                }
                
                if let reportFallTask = tasks.first(where: { $0.id == "reportFall" }) {
                    let surveyCard = SurveyItemViewControllerReportFall(
                        viewSynchronizer: SurveyItemViewSynchronizerReportFall(),
                        task: reportFallTask,
                        eventQuery: .init(for: date),
                        storeManager: self.storeManager)
                    
                    listViewController.appendViewController(surveyCard, animated: false)
                }
                
                /* PAIN CHART */
                /*
                let painGradientStart = UIColor { traitCollection -> UIColor in
                    return traitCollection.userInterfaceStyle == .light ? #colorLiteral(red: 0.9960784314, green: 0.3725490196, blue: 0.368627451, alpha: 1) : #colorLiteral(red: 0.8627432641, green: 0.2630574384, blue: 0.2592858295, alpha: 1)
                }
                let painGradientEnd = UIColor { traitCollection -> UIColor in
                    return traitCollection.userInterfaceStyle == .light ? #colorLiteral(red: 0.9960784314, green: 0.4732026144, blue: 0.368627451, alpha: 1) : #colorLiteral(red: 0.8627432641, green: 0.3598620686, blue: 0.2592858295, alpha: 1)
                }
                
                let aggregator = OCKEventAggregator.custom { events -> Double in
                    let value = events.first?.outcome?.values.first?.integerValue ?? 0
                    return Double(value)
                }
                
                let painDataSeries = OCKDataSeriesConfiguration(
                    taskID: "painSurvey",
                    legendTitle: "Pain",
                    gradientStartColor: painGradientStart,
                    gradientEndColor: painGradientEnd,
                    markerSize: 5,
                    eventAggregator: aggregator)
                
                let insightsCard = OCKCartesianChartViewController(
                    plotType: .line,
                    selectedDate: date,
                    configurations: [painDataSeries],
                    storeManager: self.storeManager)

                insightsCard.chartView.headerView.titleLabel.text = "Pain"
                insightsCard.chartView.headerView.detailLabel.text = "This Week"
                insightsCard.chartView.headerView.accessibilityLabel = "Pain, This Week"
                listViewController.appendViewController(insightsCard, animated: false)
                */
                
                /* LOAD SURVEYS FROM CLOUD */
                
                if let surveysTask = tasks.first(where: {$0.id == "surveys"}){
                    let surveysCard = CheckListItemViewController(
                        viewSynchronizer: CheckListItemViewSynchronizer(),
                        task: surveysTask,
                        eventQuery: .init(for: date),
                        storeManager: self.storeManager)
                    
                    listViewController.appendViewController(surveysCard, animated: false)
                }
                
            }
        }
    }
    
}

private extension View {
    func formattedHostingController() -> UIHostingController<Self> {
        let viewController = UIHostingController(rootView: self)
        viewController.view.backgroundColor = .clear
        return viewController
    }
}
