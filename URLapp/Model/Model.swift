//
//  File.swift
//  URLapp
//
//  Created by Николай Петров on 04.03.2022.
//


struct Course: Decodable {
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case link = "Link"
        case imageUrl = "ImageUrl"
        case numberOfLessons = "Number_of_lessons"
        case numberOfTests = "Number_of_tests"
    }
    
    init(_ dictCourse: [String: Any]) {
        name = dictCourse["name"] as? String
        link = dictCourse["link"] as? String
        imageUrl = dictCourse["imageUrl"] as? String
        numberOfLessons = dictCourse["number_of_lessons"] as? Int
        numberOfTests = dictCourse["number_of_tests"] as? Int
    }
    
    static func getCourses(from jsonData: Any) -> [Course] {
        
        guard let jsonData = jsonData as? Array<[String: Any]> else { return []}
        return jsonData.compactMap { Course($0) }
    }
}

struct WebsiteDescription: Decodable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
    
}
