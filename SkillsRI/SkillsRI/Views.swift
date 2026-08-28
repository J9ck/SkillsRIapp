//
// Views.swift
// Multiple prototype screens combined for brevity
//

import SwiftUI

struct NavigatorHomeView: View {
    var customers: [Customer]
    var appointments: [Appointment]
    var tasks: [TaskItem]
    var suggestions: [LuminarySuggestion]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Good morning, \(MockData.navigator.name)")
                            .font(.largeTitle).bold()
                        Text("You have \(appointments.count) appointments today")
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    LuminaryPanelView(suggestions: suggestions).frame(width: 260)
                }

                HStack(spacing: 16) {
                    Card {
                        VStack(alignment: .leading) {
                            SectionHeader(title: "Customers needing attention")
                            ForEach(customers) { c in
                                Text("\(c.preferredName ?? c.firstName) \(c.lastName) — Next: \(c.nextStep ?? "—")")
                                    .font(.subheadline)
                            }
                        }
                    }

                    VStack(spacing: 16) {
                        Card { VStack(alignment: .leading) { SectionHeader(title: "Upcoming") ForEach(appointments) { a in Text("\(a.type) — \(a.location ?? "") at \(a.date, style: .time)") } } }
                        Card { VStack(alignment: .leading) { SectionHeader(title: "Open tasks") ForEach(tasks) { t in Text(t.title) } } }
                    }
                }

                Card {
                    VStack(alignment: .leading) {
                        SectionHeader(title: "Journey milestones")
                        Text("No immediate milestones due.")
                    }
                }

            }
            .padding()
        }
    }
}

struct CustomerSearchView: View {
    @State private var q = ""
    var customers: [Customer]
    var body: some View {
        VStack {
            TextField("Search customers", text: $q).textFieldStyle(.roundedBorder).padding()
            List(customers.filter { q.isEmpty ? true : ($0.firstName + " " + $0.lastName).localizedCaseInsensitiveContains(q) }) { c in
                VStack(alignment: .leading) { Text("\(c.preferredName ?? c.firstName) \(c.lastName)").bold(); Text(c.contactEmail ?? "") }
            }
        }
    }
}

struct CustomerProfileView: View {
    var customer: Customer
    var journey: Journey?
    var conversations: [ConversationItem]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(customer.preferredName ?? customer.firstName) \(customer.lastName)")
                            .font(.title).bold()
                        Text("\(customer.pronouns ?? "") • \(customer.preferredLanguage ?? "")").foregroundStyle(.secondary)
                        Text(customer.contactEmail ?? "")
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Button("New Conversation") {}
                        Button("Add Task") {}
                    }
                }

                Card {
                    VStack(alignment: .leading) {
                        SectionHeader(title: "Goals & Interests")
                        ForEach(customer.goals ?? [], id: \.(self)) { g in Text("• \(g)") }
                        ForEach(customer.interests ?? [], id: \.(self)) { i in Text("• \(i)") }
                    }
                }

                if let j = journey {
                    Card {
                        VStack(alignment: .leading) {
                            SectionHeader(title: "Journey")
                            TimelineView(stages: j.stages, currentStage: j.currentStage)
                        }
                    }
                }

                Card {
                    VStack(alignment: .leading) {
                        SectionHeader(title: "Recent Conversations")
                        ForEach(conversations) { conv in
                            Text("\(conv.timestamp, style: .relative) — \(conv.summary)")
                        }
                    }
                }

                Card {
                    VStack(alignment: .leading) {
                        SectionHeader(title: "Next Step")
                        Text(customer.nextStep ?? "No next step")
                    }
                }

            }
            .padding()
        }
    }
}

struct JourneyDetailView: View {
    var journey: Journey
    var body: some View {
        VStack(alignment: .leading) {
            Text(journey.title).font(.title2).bold()
            TimelineView(stages: journey.stages, currentStage: journey.currentStage)
            Spacer()
        }
        .padding()
    }
}

struct GuidedDiscoveryView: View {
    @State private var step = 0
    let questions = ["What brings you to SkillsRI today?","Are you looking for employment, training, or education?","Any transportation or childcare concerns?"]
    var body: some View {
        VStack(alignment: .leading) {
            ProgressView(value: Double(step+1), total: Double(questions.count)).padding()
            Text(questions[step]).font(.title3).padding()
            Spacer()
            HStack { Button("Back") { if step>0 { step -= 1 } } Spacer(); Button(step == questions.count-1 ? "Finish" : "Next") { if step < questions.count-1 { step += 1 } } }
        }
        .padding()
    }
}

struct ConnectedExpertiseView: View {
    var request: ConnectedExpertiseRequest
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Connected Expertise Request").font(.title2).bold()
            Text("Need: \(request.need)")
            Text("Readiness: \(request.readiness)")
            Text("Status: \(request.status)")
            Spacer()
            Button("Return to Navigator") {}
        }
        .padding()
    }
}

struct AppointmentsView: View {
    var appointments: [Appointment]
    var body: some View {
        List(appointments) { a in
            VStack(alignment: .leading) {
                Text(a.type).bold()
                Text(a.location ?? "")
                Text(a.date, style: .date)
            }
        }
    }
}

struct DashboardView: View {
    var customers: [Customer]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Navigator Dashboard").font(.largeTitle).bold()
                HStack {
                    Card { VStack(alignment: .leading) { SectionHeader(title: "Active Customers"); Text("\(customers.count)") } }
                    Card { VStack(alignment: .leading) { SectionHeader(title: "Follow-ups due"); Text("3") } }
                }
            }
            .padding()
        }
    }
}

struct TasksView: View {
    var tasks: [TaskItem]
    var body: some View {
        List(tasks) { t in
            HStack { VStack(alignment: .leading) { Text(t.title); if let d = t.dueDate { Text(d, style: .date).font(.caption).foregroundStyle(.secondary) } }; Spacer(); if t.completed { Image(systemName: "checkmark.circle.fill").foregroundColor(.green) } }
        }
    }
}

struct ConversationsView: View {
    var conversations: [ConversationItem]
    var body: some View {
        List(conversations) { c in
            VStack(alignment: .leading) { Text(c.summary); Text(c.timestamp, style: .relative).font(.caption).foregroundStyle(.secondary) }
        }
    }
}

struct PartnerProfileView: View {
    var partner: Partner
    var body: some View {
        VStack(alignment: .leading) {
            Text(partner.name).font(.title)
            SectionHeader(title: "Contacts")
            ForEach(partner.contacts ?? [], id: \.(self)) { c in Text(c) }
            Spacer()
        }
        .padding()
    }
}

