
class RecordManager {
    private var records = [Int]()
    
    func add(traialCount: Int){
        records.append(traialCount)
    }
    
    func showRecords() {
        if records.isEmpty {
            print("기록이 없습니다")
        } else {
            print("게임 기록")
            for (index,record) in records.enumerated() {
                print("\(index + 1)번째 게임 : 시도 횟수 - \(record)")
            }
        }
    }
}
