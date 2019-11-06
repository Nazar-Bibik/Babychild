//
//  Clock.swift
//  BabyChild
//
//  Created by Mow on 05/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

class Clock: ObservableObject{
    var timer = Timer()
    @Published var running: Bool = false
    @EnvironmentObject var sleep: Sleep
    var callSleep: Bool = false
    var callFeed: Bool = false
    
    enum ClockError: Error {
        case runtimeError(String)
    }
    
    private func runClock() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(self.updateClock)), userInfo: nil, repeats: true)
    }
    
    @objc func updateClock() {
        if callSleep{
            sleep.timePassed += 1
        }
    }
    
    private func toggleClass(classS: String) throws{
        switch (classS) {
            case ("sleep"):
                callSleep.toggle()
            case ("feed"):
                callFeed.toggle()
            default:
                throw ClockError.runtimeError("Clock stop wrong class name provided")
        }
    }
    
    func startClock(classStart: String) throws{
        try toggleClass(classS: classStart)
        if (!running){
            running.toggle()
            runClock()
        }
    }
    
    func stopClock(classStop: String) throws{
        try toggleClass(classS: classStop)
        if (!callSleep && !callFeed && running){
            timer.invalidate()
            running.toggle()
        }
    }
    
}
