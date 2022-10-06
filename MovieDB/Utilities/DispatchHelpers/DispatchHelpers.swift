//
//  DispatchHelpers.swift
//  MovieDB
//
//  Created by Ashish Bogati on 06/10/2022.
//

import Foundation

func guarenteeMainThread(_ work: @escaping () -> Void) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async(execute: work)
    }
}
