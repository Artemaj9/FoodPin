//
//  ActivityView.swift
//  FoodPin
//
//  Created by Artem on 02.06.2023.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    var activityItems: [Any]
    var aplicationActivities: [UIActivity]? = nil
    func makeUIViewController(context: Context) -> some UIViewController {
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: aplicationActivities)
        return activityController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
