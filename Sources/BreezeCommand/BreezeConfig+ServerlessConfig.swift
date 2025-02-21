//    Copyright 2023 (c) Andrea Scuderi - https://github.com/swift-sprinter
//
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

import Foundation
import Yams
import SLSAdapter

extension ServerlessConfig {
    
    private static let encoder = YAMLEncoder()
    
    func writeSLS(params: BreezeLambdaAPIConfig, targetPath: String, ymlFileName: String) throws {
        let content = try Self.encoder.encode(self)
        let path = targetPath.appending("/").appending(ymlFileName)
        let destination = URL(fileURLWithPath: path)
        try content.data(using: .utf8)?.write(to: destination)
        print("📄 \(destination.path)")
    }
}
