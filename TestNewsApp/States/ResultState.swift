//
//  ResultState.swift
//  TestNewsApp
//
//  Created by Taewoo Kim on 2022/03/06.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
