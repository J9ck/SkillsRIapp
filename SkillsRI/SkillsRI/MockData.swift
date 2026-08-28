//
// MockData.swift
// Contains local mock data used by the prototype
//

import Foundation

enum MockData {
    static let navigator = Navigator(id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!, name: "Kelly")

    static let customers: [Customer] = {
        let c1 = Customer(
            id: UUID(uuidString: "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa")!,
            firstName: "Kelly",
            lastName: "Anderson",
            preferredName: "Kelly",
            pronouns: "she/her",
            contactEmail: "kelly.anderson@example.org",
            contactPhone: "(401) 555-0123",
            preferredLanguage: "English",
            communicationPreferences: ["Email","Text"],
            navigatorId: navigator.id,
            currentJourneyId: nil,
            currentStage: 1,
            goals: ["Find full-time work in healthcare","Obtain CNA certification"],
            skills: ["Customer service","CPR"],
            interests: ["Healthcare","Community work"],
            notes: ["Mentioned childcare constraint"],
            upcomingAppointmentId: nil,
            nextStep: "Confirm availability for CNA class"
        )

        let c2 = Customer(
            id: UUID(uuidString: "bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb")!,
            firstName: "Marcus",
            lastName: "Diaz",
            preferredName: "Marc",
            pronouns: "he/him",
            contactEmail: "marcus.d@example.org",
            contactPhone: "(401) 555-0987",
            preferredLanguage: "Spanish",
            communicationPreferences: ["Phone","Email"],
            navigatorId: navigator.id,
            currentJourneyId: nil,
            currentStage: 2,
            goals: ["Internship in software dev"],
            skills: ["JavaScript","SQL"],
            interests: ["Tech","Startups"],
            notes: ["Needs resume support"],
            upcomingAppointmentId: nil,
            nextStep: "Set resume workshop"
        )

        let c3 = Customer(
            id: UUID(uuidString: "cccccccc-cccc-cccc-cccc-cccccccccccc")!,
            firstName: "John",
            lastName: "Smith",
            preferredName: "John",
            pronouns: "he/him",
            contactEmail: "john.smith@example.org",
            contactPhone: "(401) 555-0001",
            preferredLanguage: "English",
            communicationPreferences: ["Email"],
            navigatorId: navigator.id,
            currentJourneyId: nil,
            currentStage: 3,
            goals: ["Part-time retail job"],
            skills: ["Cash handling"],
            interests: ["Retail"],
            notes: [],
            upcomingAppointmentId: nil,
            nextStep: "Confirm shift availability"
        )

        let c4 = Customer(
            id: UUID(uuidString: "dddddddd-dddd-dddd-dddd-dddddddddddd")!,
            firstName: "Joe",
            lastName: "Lopez",
            preferredName: "Joe",
            pronouns: "he/him",
            contactEmail: "joe.lopez@example.org",
            contactPhone: "(401) 555-0002",
            preferredLanguage: "Spanish",
            communicationPreferences: ["Phone"],
            navigatorId: navigator.id,
            currentJourneyId: nil,
            currentStage: 1,
            goals: ["Explore college options"],
            skills: ["Writing"],
            interests: ["Education"],
            notes: [],
            upcomingAppointmentId: nil,
            nextStep: "Schedule college counseling"
        )

        let c5 = Customer(
            id: UUID(uuidString: "eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee")!,
            firstName: "Jeff",
            lastName: "Miller",
            preferredName: "Jeff",
            pronouns: "he/him",
            contactEmail: "jeff.miller@example.org",
            contactPhone: "(401) 555-0003",
            preferredLanguage: "English",
            communicationPreferences: ["Email"],
            navigatorId: navigator.id,
            currentJourneyId: nil,
            currentStage: 4,
            goals: ["Start small business"],
            skills: ["Marketing"],
            interests: ["Entrepreneurship"],
            notes: [],
            upcomingAppointmentId: nil,
            nextStep: "Enroll in business bootcamp"
        )

        let c6 = Customer(
            id: UUID(uuidString: "ffffffff-ffff-ffff-ffff-ffffffffffff")!,
            firstName: "Jason",
            lastName: "Nguyen",
            preferredName: "Jason",
            pronouns: "he/him",
            contactEmail: "jason.nguyen@example.org",
            contactPhone: "(401) 555-0004",
            preferredLanguage: "English",
            communicationPreferences: ["Text"],
            navigatorId: navigator.id,
            currentJourneyId: nil,
            currentStage: 2,
            goals: ["Apprenticeship in trades"],
            skills: ["Handywork"],
            interests: ["Trades"],
            notes: [],
            upcomingAppointmentId: nil,
            nextStep: "Connect with apprenticeship partner"
        )

        let c7 = Customer(
            id: UUID(uuidString: "11111111-2222-3333-4444-555555555555")!,
            firstName: "Justin",
            lastName: "Khan",
            preferredName: "Justin",
            pronouns: "he/him",
            contactEmail: "justin.khan@example.org",
            contactPhone: "(401) 555-0005",
            preferredLanguage: "English",
            communicationPreferences: ["Email","Text"],
            navigatorId: navigator.id,
            currentJourneyId: nil,
            currentStage: 5,
            goals: ["Gain full-time employment"],
            skills: ["Forklift certified"],
            interests: ["Logistics"],
            notes: [],
            upcomingAppointmentId: nil,
            nextStep: "Confirm interview prep"
        )

        let c8 = Customer(
            id: UUID(uuidString: "22222222-3333-4444-5555-666666666666")!,
            firstName: "Juan",
            lastName: "Perez",
            preferredName: "Juan",
            pronouns: "he/him",
            contactEmail: "juan.perez@example.org",
            contactPhone: "(401) 555-0006",
            preferredLanguage: "Spanish",
            communicationPreferences: ["Phone","Text"],
            navigatorId: navigator.id,
            currentJourneyId: nil,
            currentStage: 1,
            goals: ["Explore training"],
            skills: ["Bilingual"],
            interests: ["Tech"],
            notes: [],
            upcomingAppointmentId: nil,
            nextStep: "Conduct guided discovery"
        )

        return [c1, c2, c3, c4, c5, c6, c7, c8]
    }()

    static let journeys: [Journey] = {
        customers.map { customer in
            Journey(id: UUID(), customerId: customer.id, title: "Opportunity Journey for \(customer.preferredName ?? customer.firstName)", currentStage: customer.currentStage ?? 1, stages: ["Welcome","Guided Discovery","Journey Planning","Readiness","Connected Expertise","Reflection","Continued Engagement","Next Opportunity","Re-engagement"]) }
    }()

    static let appointments: [Appointment] = {
        [Appointment(id: UUID(), customerId: customers[0].id, partnerId: nil, staffId: navigator.id, type: "Intake", date: Date().addingTimeInterval(3600), location: "Main Office", link: nil),
         Appointment(id: UUID(), customerId: customers[1].id, partnerId: nil, staffId: navigator.id, type: "Resume Workshop", date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, location: "Room 204", link: nil)]
    }()

    static let partners: [Partner] = {
        [Partner(id: UUID(), name: "Acme Health", contacts: ["J. Smith"], roles: ["Employer"]), Partner(id: UUID(), name: "Community CBO", contacts: ["L. Rivera"], roles: ["CBO"])]
    }()

    static let tasks: [TaskItem] = {
        [TaskItem(id: UUID(), title: "Follow up with Kelly re: CNA class", assignedToId: navigator.id, dueDate: Date().addingTimeInterval(86400), completed: false)]
    }()

    static let opportunities: [Opportunity] = {
        [Opportunity(id: UUID(), title: "CNA cohort starting", customerId: customers[0].id, status: "Suggested")]
    }()

    static let conversations: [ConversationItem] = {
        [ConversationItem(id: UUID(), customerId: customers[0].id, summary: "Discussed transportation needs", timestamp: Date().addingTimeInterval(-3600)), ConversationItem(id: UUID(), customerId: customers[1].id, summary: "Resume draft reviewed", timestamp: Date().addingTimeInterval(-7200))]
    }()

    static let luminarySuggestions: [LuminarySuggestion] = {
        [LuminarySuggestion(id: UUID(), message: "Consider asking about transportation options before scheduling trainings."), LuminarySuggestion(id: UUID(), message: "This customer mentioned childcare in their last conversation.")]
    }()
}
