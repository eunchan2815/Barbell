import Foundation

struct RateMenu: Identifiable, Equatable, Codable {
    var id = UUID()
    let rateLabel: String
    let multiplier: Double
}
