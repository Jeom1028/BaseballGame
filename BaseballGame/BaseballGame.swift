// BaseballGame.swift 파일 생성
struct BaseballGame {
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
        
        print("게임을 시작하겠습니다")
        
        while true {
            print("숫자를 입력하세요", terminator: " ")
            
            guard let input = readLine() else {
                continue
            }
            
            guard let number = Int(input) else {
                print("잘못된 입력입니다")
                continue
            }
            
            guard input.count == 3 else {
                print("세 자리 숫자를 입력하세요")
                continue
            }
            
            
            let digits = String(number).compactMap { Int(String($0)) }
            
            guard digits.count == 3, Set(digits).count == 3 else {
                
                print("잘못된 입력입니다")
                continue
            }
            
            var strike = 0
            var ball = 0
            
            for (index, digit) in digits.enumerated() {
                if digit == answer[index] {
                    strike += 1
                } else if answer.contains(digit) {
                    ball += 1
                }
            }
            
            if strike == 3 {
                print("정답입니다!")
                break
            } else {
                print("\(strike)스트라이크 \(ball)볼")
            }
        }
    }
    
    func makeAnswer() -> [Int] {
        // 함수 내부를 구현하기
        var digits = [Int]()
        
        while digits.count < 3 {
            //첫번째 숫자가 0이 안나오게 하기
            let digit = Int.random(in: digits.isEmpty ? 1...9 : 0...9)
            if !digits.contains(digit) {
                digits.append(digit)
            }
        }
        
        return digits
    }
}
