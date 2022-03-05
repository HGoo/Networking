//
//  CoursesViewController.swift
//  URLapp
//
//  Created by Николай Петров on 04.03.2022.
//

import UIKit

class CoursesViewController: UITableViewController {

    // MARK: - Private Properties
    private let jsonUrlOne = "https://swiftbook.ru//wp-content/uploads/api/api_course"
    private let jsonUrlTwo = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    private let jsonUrlThree = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
    private let jsonUrlFour = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
   
    private var courses: [Course] = []
  

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! CourseCell
        
        let course = courses[indexPath.row]
        cell.configure(with: course)
        
        return cell
    }
    
    //MARK: - TabeleViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func fetchDataV1() {
        guard let url = URL(string: jsonUrlOne) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let course = try JSONDecoder().decode(Course.self, from: data)
                print(course.name ?? "")
                print(course.imageUrl ?? "")
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchDataV2() {
        guard let url = URL(string: jsonUrlTwo) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchDataV3() {
        guard let url = URL(string: jsonUrlThree) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let websiteDescripton = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescripton.courses ?? [])
                print(websiteDescripton.websiteDescription ?? "")
                print(websiteDescripton.websiteName ?? "")
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchDataV4() {
        guard let url = URL(string: jsonUrlFour) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let websiteDescripton = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescripton.courses ?? [])
                print(websiteDescripton.websiteDescription ?? "nil")
                print(websiteDescripton.websiteName ?? "nil")
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchDataV() {
        guard let url = URL(string: jsonUrlTwo) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                self.courses = try JSONDecoder().decode([Course].self, from: data)
            } catch let error {
                print(error)
            }
        }.resume()
    }
        

    
}
