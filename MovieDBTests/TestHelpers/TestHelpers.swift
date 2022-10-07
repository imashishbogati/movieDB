//
//  TestHelpers.swift
//  MovieDBTests
//
//  Created by Ashish Bogati on 06/10/2022.
//

import Foundation
import ViewControllerPresentationSpy

func makeAlertVerifier() -> AlertVerifier {
    return AlertVerifier()
}


func executeRunLoop() {
    return RunLoop.current.run(until: Date())
}
