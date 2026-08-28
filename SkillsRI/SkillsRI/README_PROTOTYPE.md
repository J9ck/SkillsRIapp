//
// README_PROTOTYPE.md
// Description and instructions for the prototype
//

# SkillsRI OS — Prototype (SwiftUI)

This is a UX prototype intended for evaluation and handoff. It lives inside the existing SkillsRI Xcode project and uses local mock data only. It is not production-ready and contains no authentication, persistence, or third-party integrations.

How to run

1. Open `SkillsRI/SkillsRI.xcodeproj` in Xcode (Xcode 15+ recommended).
2. Build and run the `SkillsRI` target on an iPad simulator (iPad Air or similar) or a connected device.
3. The prototype uses `ContentView` as the main entry and local mock data from `MockData.swift`.

What is included

- Navigator Home
- Customer Search
- Customer Profile (read-only mock)
- Journey visual timeline
- Guided Discovery (multi-step conversational UI)
- Connected Expertise handoff screen
- Appointments, Tasks, Conversations, Partners
- Luminary panel (non-intrusive suggestions)
- Basic reporting dashboard

Files added/changed

- SkillsRI/SkillsRI/Models.swift — Prototype data models with stable IDs mapping to future backend tables:
  - customers.customer_id -> Customer.id
  - journeys.journey_id -> Journey.id
  - appointments.appointment_id -> Appointment.id
  - partners.partner_id -> Partner.id
  - tasks.task_id -> TaskItem.id
  - opportunities.opportunity_id -> Opportunity.id
  - connected_expertise.request_id -> ConnectedExpertiseRequest.id

- SkillsRI/SkillsRI/MockData.swift — Local mock dataset used by the prototype.
- SkillsRI/SkillsRI/Components.swift — Reusable UI components (Card, Timeline, LuminaryPanel).
- SkillsRI/SkillsRI/Views.swift — Prototype screens assembled for quick iteration.
- SkillsRI/SkillsRI/ContentView.swift — Updated entry point showing the sidebar and navigation.
- SkillsRI/SkillsRI/README_PROTOTYPE.md — This document.

Mapping to Microsoft Power Apps (future)

- Each primary model maps to a Dataverse table or SharePoint list (customers, journeys, appointments, tasks, partners, opportunities, connected_expertise, conversations, luminary_suggestions).
- Navigator Home cards map to Power Apps galleries and charts.
- Guided Discovery can be implemented with a series of screens and conditional visibility.

What this is NOT

- Not a production app — no secure storage, no backend, no authentication, no audit logging.
- Mock data is static and stored in code.
- Not accessibility-complete — visual contrast and VoiceOver labeling are prototypical.

Next steps

- If you want me to wire these files into the Xcode project file (project.pbxproj) so they appear as groups automatically, I can update the project file next. That is mechanical but requires careful edits — I can do it on request.
