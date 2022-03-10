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
    let numberOfLessons: String?
    let numberOfTests: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case link = "Link"
        case imageUrl = "ImageUrl"
        case numberOfLessons = "numberOfLessons"
        case numberOfTests = "numberOfTests"
    }
    
    init(_ dictCourse: [String: Any]) {
        name = dictCourse["name"] as? String
        link = dictCourse["link"] as? String
        imageUrl = dictCourse["imageUrl"] as? String
        numberOfLessons = dictCourse["numberOfLessons"] as? String
        numberOfTests = dictCourse["numberOfTests"] as? String
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
