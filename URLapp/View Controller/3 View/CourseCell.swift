//
//  CourseCell.swift
//  URLapp
//
//  Created by Николай Петров on 04.03.2022.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLable: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    
    
    func configure(with course: Course) {
        courseNameLable.text = course.name
        numberOfLessons.text = "Nimber of Lessons \(course.numberOfLessons ?? 0)"
        numberOfTests.text = "Nimber of Tests \(course.numberOfTests ?? 0)"
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: course.imageUrl ?? "") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
           
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData)
            }
        }
    }
}
