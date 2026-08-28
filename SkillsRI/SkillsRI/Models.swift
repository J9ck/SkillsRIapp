//
// Models.swift
// SkillsRI
//
// Auto-generated prototype models for SkillsRI OS UX prototype
//

import Foundation

// Stable IDs matching conceptual SkillsRI data model

public struct Customer: Identifiable, Codable {
    public let id: UUID
    public var firstName: String
    public var lastName: String
    public var preferredName: String?
    public var pronouns: String?
    public var contactEmail: String?
    public var contactPhone: String?
    public var preferredLanguage: String?
    public var communicationPreferences: [String]?
    public var navigatorId: UUID?
    public var currentJourneyId: UUID?
    public var currentStage: Int?
    public var goals: [String]?
    public var skills: [String]?
    public var interests: [String]?
    public var notes: [String]?
    public var upcomingAppointmentId: UUID?
    public var nextStep: String?
}

public struct Navigator: Identifiable, Codable {
    public let id: UUID
    public var name: String
}

public struct Journey: Identifiable, Codable {
    public let id: UUID
    public var customerId: UUID
    public var title: String
    public var currentStage: Int
    public var stages: [String]
}

public struct Appointment: Identifiable, Codable {
    public let id: UUID
    public var customerId: UUID
    public var partnerId: UUID?
    public var staffId: UUID?
    public var type: String
    public var date: Date
    public var location: String?
    public var link: String?
}

public struct Partner: Identifiable, Codable {
    public let id: UUID
    public var name: String
    public var contacts: [String]?
    public var roles: [String]?
}

public struct TaskItem: Identifiable, Codable {
    public let id: UUID
    public var title: String
    public var assignedToId: UUID?
    public var dueDate: Date?
    public var completed: Bool
}

public struct Opportunity: Identifiable, Codable {
    public let id: UUID
    public var title: String
    public var customerId: UUID?
    public var status: String
}

public struct ConnectedExpertiseRequest: Identifiable, Codable {
    public let id: UUID
    public var customerId: UUID
    public var specialistId: UUID?
    public var need: String
    public var readiness: String
    public var status: String
}

public struct ConversationItem: Identifiable, Codable {
    public let id: UUID
    public var customerId: UUID
    public var summary: String
    public var timestamp: Date
}

public struct LuminarySuggestion: Identifiable, Codable {
    public let id: UUID
    public var message: String
}
