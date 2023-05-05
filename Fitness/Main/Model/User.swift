//
//  User.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/1/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation

enum Gender: String, Codable {
    
    case Male = "Male", Female = "Female", Other = "Other"
    
    var descrption: String {
        switch self {
        case .Male:
            return "Male"
        case .Female:
            return "Female"
        case .Other:
            return "Other"
        }
    }
    
}

class User: Hashable, Equatable, ObservableObject, Codable {
    
    // Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    //Equatable conformance
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name
    }
    
    enum Language: String, CaseIterable {
        case english = "English",
             russian = "Russian"
    }
    
    let id: UUID
    let name: String
    @Published var language: Language.RawValue
    @Published var hasCompletedOnboarding: Bool
    @Published var hasAcceptedPrivacyPolicy: Bool
    var userID: UInt?
    var firstName: String?
    var lastName: String?
    var gender: Gender?
    var birthday: Date?
    var height: UInt8?
    var weight: UInt8?
    var email: String?
    var phone: String?
    
    //Codable conformance
    enum CodingKeys: CodingKey {
        case id
        case name
        case language
        case hasCompletedOnboarding
        case hasAcceptedPrivacyPolicy
        case userID
        case firstName
        case lastName
        case gender
        case birthday
        case height
        case weight
        case email
        case phone
    }
    
    init() {
        firstName = UserDefaults.standard.string(forKey: "firstName") ?? nil
        lastName = UserDefaults.standard.string(forKey: "lastName") ?? nil
        gender = nil
        birthday = nil
        self.id = UUID()
        self.name = String()
        self.language = Language.english.rawValue
        self.hasCompletedOnboarding = false
        self.hasAcceptedPrivacyPolicy = false
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.language, forKey: .language)
        try container.encodeIfPresent(self.hasCompletedOnboarding, forKey: .hasCompletedOnboarding)
        try container.encodeIfPresent(self.hasAcceptedPrivacyPolicy, forKey: .hasAcceptedPrivacyPolicy)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.language = try container.decode(Language.RawValue.self, forKey: .language)
        self.hasCompletedOnboarding = try container.decode(Bool.self, forKey: .hasCompletedOnboarding)
        self.hasAcceptedPrivacyPolicy = try container.decode(Bool.self, forKey: .hasAcceptedPrivacyPolicy)
    }
    
    // sample user for previews
    static let sampleUser = User()
}
