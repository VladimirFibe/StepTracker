import SwiftUI

enum HealthMetricContext: CaseIterable, Identifiable {
    case steps, weight
    
    var title: String {
        switch self {
        case .steps: return "Steps"
        case .weight: return "Weight"
        }
    }
    var isStep: Bool { self == .steps}
    var id: Self { self}
}
struct DashboardView: View {
    @State private var selectedStat: HealthMetricContext = .steps
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Picker("Selected Stat", selection: $selectedStat) {
                        ForEach(HealthMetricContext.allCases) {
                            Text($0.title).tag($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    VStack(spacing: 20) {
                        HStack {
                            NavigationLink(value: selectedStat) {
                                VStack(alignment: .leading) {
                                    Label("Steps", systemImage: "figure.walk")
                                        .font(.title3.bold())
                                        .foregroundStyle(.pink)
                                    Text("Avg: 10K Steps")
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .foregroundStyle(.secondary)
                        }
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 150)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.secondarySystemBackground))
                    )
                    
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading) {
                            Label("Averages", systemImage: "calendar")
                                .font(.title3.bold())
                                .foregroundStyle(.pink)
                            Text("Last 28 days")
                        }
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 240)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.secondarySystemBackground))
                    )
                }
            }
            .padding()
            .navigationTitle("Dashboard")
            .navigationDestination(for: HealthMetricContext.self) {
                HealthDetailList(metric: $0)
            }
        }
        .tint(selectedStat.isStep ? .indigo : .pink)
    }
}

#Preview {
    DashboardView()
}
