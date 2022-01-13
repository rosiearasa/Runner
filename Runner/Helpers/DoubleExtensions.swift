//
//  DoubleExtensions.swift
//  Runner
//
//  Created by Rosie Arasa on 1/11/22.
//

import Foundation
extension Double{
    func metertoMiles() -> Double{
        let meters = Measurement(value: self, unit: UnitLength.meters)
        return meters.converted(to: .miles).value
    }
    func toString(places: Int) -> String {
        return String(format: "%.\(places)f", self)
    }
}
