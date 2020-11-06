//
//  TestWatchApp.swift
//  TestWatch
//
//  Created by Joe Blau on 11/5/20.
//

import SwiftUI
import WatchConnectivity

@main
struct TestWatchApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate, WCSessionDelegate {
        var session: WCSession?
        
        func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
            
            if WCSession.isSupported() {
                session = WCSession.default
                session?.delegate = self
                session?.activate()
            }
            
            return true
        }
        
        // MARK: - WCSessionDelegate

        func session(_: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error _: Error?) {
            print("Activatoin state: \(activationState.rawValue)")
        }

        func sessionDidBecomeInactive(_: WCSession) {
            print("Session Inactive")
        }

        func sessionDidDeactivate(_: WCSession) {
            print("Session Deactivate")
        }
    }
}
