//
//  Task.swift
//  lab-task-squirrel
//
//  Created by Charlie Hieger on 11/15/22.
//

import UIKit
import CoreLocation

class Task {
    let title: String
    let description: String
    var image: UIImage?
    var imageLocation: CLLocation?
    var isComplete: Bool {
        image != nil
    }

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

    func set(_ image: UIImage, with location: CLLocation) {
        self.image = image
        self.imageLocation = location
    }
}

extension Task {
    static var mockedTasks: [Task] {
        return [
            Task(title: "Your favorite restaurant🧑🏽‍🍳",
                 description: "Where do you enjoy a good meal with great ambience and company?"),
            Task(title: "Your favorite beach🌊",
                 description: "Being in a white sand, clear waters, maybe next to mountains?"),
            Task(title: "Your favorite local cafe☕️",
                 description: "Where can you relax, study, work and be enjoy strong coffee?")
        ]
    }
}
