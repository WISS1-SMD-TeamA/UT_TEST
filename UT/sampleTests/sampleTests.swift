//
//  sampleTests.swift
//  sampleTests
//
//  Created by Bob on 2022/06/10.
//

import XCTest
@testable import sample

class MySampleTests: XCTestCase {
    
    override func setUpWithError() throws {
        // ここにセットアップコードを入力します。 このメソッドは、クラス内の各テストメソッドを呼び出す前に呼び出されます。
        
    }

    override func tearDownWithError() throws {
        // このメソッドは、クラス内の各テストメソッドの呼び出し後に呼び出されます。
        
    }

    func testMysample(){
        let mySample = MySample()
        let add = mySample.add(a: 2, b: 3)
        XCTAssertEqual(add, 5)
    }
    
    func testExample() throws {
        // これは機能テストケースの例です。
        // XCTAssertおよび関連する関数を使用して、テストで正しい結果が得られることを確認します。
    }

    func testPerformanceExample() throws {
        // これは、パフォーマンステストケースの例です。
        self.measure {
            // ここに時間を測定したいコードを入れてください。
        }
    }

}
