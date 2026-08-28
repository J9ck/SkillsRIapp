//
// ContentView.swift
// Replaced with prototype master layout
//

import SwiftUI

struct ContentView: View {
    @State private var selection: String? = "home"

    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                NavigationLink(value: "home") {
                    Label("Home", systemImage: "house")
                }
                NavigationLink(value: "search") { Label("Customer Search", systemImage: "magnifyingglass") }
                NavigationLink(value: "appointments") { Label("Appointments", systemImage: "calendar") }
                NavigationLink(value: "tasks") { Label("Tasks", systemImage: "checkmark.circle") }
                NavigationLink(value: "opportunities") { Label("Opportunities", systemImage: "sparkles") }
                NavigationLink(value: "reports") { Label("Reports", systemImage: "chart.bar") }
                NavigationLink(value: "partners") { Label("Partners", systemImage: "building.2") }
            }
            .navigationTitle("SkillsRI OS")
            .listStyle(.sidebar)
        } columnVisibility: .automatic content: {
            Group {
                switch selection {
                case "home": NavigatorHomeView(customers: MockData.customers, appointments: MockData.appointments, tasks: MockData.tasks, suggestions: MockData.luminarySuggestions)
                case "search": CustomerSearchView(customers: MockData.customers)
                case "appointments": AppointmentsView(appointments: MockData.appointments)
                case "tasks": TasksView(tasks: MockData.tasks)
                case "opportunities": Text("Opportunities (prototype)")
                case "reports": DashboardView(customers: MockData.customers)
                case "partners": PartnerProfileView(partner: MockData.partners[0])
                default: Text("Select a screen from the sidebar.")
                }
            }
        } detail: {
            Text("Detail")
        }
    }
}

#Preview {
    ContentView()
}
