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
    let number_of_lessons: Int?
    let number_of_tests: Int?
}

struct WebsiteDescription: Decodable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
    
}
