//
//  TestWatchApp.swift
//  TestWatch WatchKit Extension
//
//  Created by Joe Blau on 11/5/20.
//

import SwiftUI
import WatchConnectivity

@main
struct TestWatchApp: App {
    @WKExtensionDelegateAdaptor(ExtensionDelegate.self) var extensionDelegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
    
    class ExtensionDelegate: NSObject, WKExtensionDelegate, WCSessionDelegate {
        var session: WCSession?

        func applicationDidBecomeActive() {
            if WCSession.isSupported() {
                session = WCSession.default
                session?.delegate = self
                session?.activate()
            }
        }

        func applicationWillResignActive() {
        }

        // MARK: - WCSessionDelegate

        func session(_: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error _: Error?) {
            print("Activatoin state: \(activationState.rawValue)")
        }
    }
}
