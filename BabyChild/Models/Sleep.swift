//
//  Sleep.swift
//  BabyChild
//
//  Created by Mow on 05/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import SwiftUI

class Sleep: ObservableObject{
    @EnvironmentObject var clock: Clock
    @Published var isSleeping: Bool = false
    @Published var timePassed: Int = 0
    @Published var isNight: Bool = false
    @Published var lastTime: Date = Date()
    
    func toggle() {
        if isSleeping{
            sleep()
        } else {
            wake()
        }
    }
    
    func sleep() {
        isSleeping = true
        timePassed = 0
        do {try clock.startClock(classStart: "sleep")}
        catch {
            print("Clock stop wrong class name provided")
        }
        
    }
    
    func wake() {
        isSleeping = false
        timePassed = 0
        do {try clock.startClock(classStart: "sleep")}
        catch {
            print("Clock stop wrong class name provided")
        }
    }
    
    func showTime() -> String {
        DateHelper.showTimeFormated(minutes: timePassed)
    }
    
    func showButton() -> String{
        if isSleeping{
            return "Sleeping"
        }
        return "Awake"
    }
}
