class BaseballGame {

    var tryCount: [Int] = [] // 시도 횟수를 저장하는 배열
    var count: Int = 0 // 게임 횟수를 저장하는 변수
    
    func start() {
        print("원하시는 번호를 입력해주세요")
        while true {
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            print("선택하세요", terminator: " ")
            
            guard let choice = readLine(), let option = Int(choice) else {
                print("잘못입력하셨습니다")
                continue
            }
            
            switch option {
            case 1:
                play()
            case 2:
                print("< 게임 기록 보기 >")
                for i in 0..<count {
                    print("\(i + 1)번째 게임 : 시도 횟수 - \(tryCount[i])")
                }
            case 3:
                print("게임을 종료하겠습니다")
                return
            default:
                print("잘못입력하셨습니다")
            }
        }
    }

    func play() {
        let answer = makeAnswer() // 정답을 만드는 함수
        var trialCount = 0

        print("게임을 시작하겠습니다!")
        
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

            trialCount += 1
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

        // 게임이 끝난 후 시도 횟수를 기록하고 게임 횟수를 증가
        tryCount.append(trialCount)
        count += 1
    }

    func makeAnswer() -> [Int] {
        var digits = [Int]()
        
        while digits.count < 3 {
            let digit = Int.random(in: digits.isEmpty ? 1...9 : 0...9)
            if !digits.contains(digit) {
                digits.append(digit)
            }
        }
        
        return digits
    }
}

