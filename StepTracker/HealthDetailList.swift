import SwiftUI

struct HealthDetailList: View {
    let metric: HealthMetricContext
    @State private var isShowingAddData = false
    @State private var date = Date()
    @State private var text = ""
    var body: some View {
        List(0 ..< 25) { item in
            HStack {
                Text(Date(), format: .dateTime.day().month().year())
                Spacer()
                Text(10000, format: .number.precision(.fractionLength(metric.isStep ? 0 : 1)))
            }
        }
        .navigationTitle(metric.title)
        .sheet(isPresented: $isShowingAddData) {
            addDataView
        }
        .toolbar { Button("Add", systemImage: "plus") { isShowingAddData.toggle() }}
    }
    
    var addDataView: some View {
        NavigationStack {
            Form {
                DatePicker("Date", selection: $date, displayedComponents: .date)
                HStack {
                    Text(metric.title)
                    Spacer()
                    TextField("Value", text: $text)
                        .keyboardType(metric.isStep ? .numberPad : .decimalPad)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 140)
                }
            }
            .navigationTitle(metric.title)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Dismiss") { isShowingAddData.toggle() }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Data") { isShowingAddData.toggle() }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HealthDetailList(metric: .steps)
    }
}
