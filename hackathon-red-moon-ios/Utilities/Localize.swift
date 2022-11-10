//
// Copyright (c) 2021 Yassir S.P.A. All rights reserved.
//

import Foundation

/// Returns a localized string using the main bundle if one is not specified.
///
/// - Parameters:
///   - key: The key for a string in the table identified by tableName.
///   - tableName: The receiver’s string table to search. If tableName is nil or is an empty string, the method attempts to use the table in Localizable.strings.
///   - bundle: The bundle containing the strings file.
///   - value: The value to return if key is nil or if a localized string for key can’t be found in the table.
///   - comment: The comment to place above the key-value pair in the strings file.
@inlinable
func Localize(_ key: String, tableName: String? = nil, bundle: Bundle = .main, value: String = "", comment: String = "") -> String {
    return NSLocalizedString(key, tableName: tableName, bundle: bundle, value: value, comment: comment)
}
