//
//  SubFeedsApp.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/8.
//


import SwiftUI
import AppTrackingTransparency
import Network
import Combine

let USERDEFAULT_ATTrRACKINGMANAGER_ACTION = "attrracking_manager_action"
let USERDEFAULT_SPLAN_ACTION = "start_splan_action"

class AppNetworkReachabilityManager: ObservableObject {
    static let shared = AppNetworkReachabilityManager()
    private init() {
        checkNewStatus()
    }
    
    @Published var isReachable = false
    private let networkMonitor = NWPathMonitor()
    private let networkQueue = DispatchQueue(label: "NetworkMonitor")
    private var cancellable: AnyCancellable?
   
    func checkNewStatus() {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            self?.isReachable = path.status == .satisfied
        }
        cancellable = AnyCancellable {
            self.networkMonitor.cancel()
        }
        networkMonitor.start(queue: networkQueue)
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return true
    }
}


@main
struct SubFeedsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) var scenePhase

    // 弹窗授权
    @State private var isATTrackingCompleted: Bool = false
    
    // 引导启动页
    @State private var isOnBoardingCompleted: Bool = false

    // 展示内容
    @State private var canShowContentView: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack() {
                ContentView()
            }
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active: appActiveStatus()
            case .inactive: appInactiveStatus()
            case .background: appBackgroundStatus()
            }
        }
    }
        
    func appActiveStatus() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            requestIDFAPermission()
        }
    }
    
    func appInactiveStatus() {
    }
    
    func appBackgroundStatus() {
      
    }
    
    func requestIDFAPermission() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .notDetermined: break
                case .denied, .authorized, .restricted:
                    isATTrackingCompleted = true
                    UserDefaults.standard.setValue(true, forKey: USERDEFAULT_ATTrRACKINGMANAGER_ACTION)
                    UserDefaults.standard.synchronize()
                default:
                    isATTrackingCompleted = true
                    UserDefaults.standard.setValue(true, forKey: USERDEFAULT_ATTrRACKINGMANAGER_ACTION)
                    UserDefaults.standard.synchronize()
                }
            }
        } else {
            isATTrackingCompleted = true
            UserDefaults.standard.setValue(true, forKey: USERDEFAULT_ATTrRACKINGMANAGER_ACTION)
            UserDefaults.standard.synchronize()
        }
    }
}
