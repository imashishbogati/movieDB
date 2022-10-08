//
//  TestHelpers.swift
//  MovieDBTests
//
//  Created by Ashish Bogati on 06/10/2022.
//

import UIKit

func executeRunLoop() {
    return RunLoop.current.run(until: Date())
}

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}
