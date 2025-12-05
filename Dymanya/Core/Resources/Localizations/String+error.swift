//
//  String+text.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

extension String.error {
    static var Unknown: String { .init("Error_Unknown") }
    static var AppSettings: String { .init("Error_AppSettings") }
    static var InvalidUrl: String { .init("Error_InvalidUrl") }

    static var DiskCacheFailure: String { .init("Error_DiskCacheFailure") }

    static var SessionExpired: String { .init("Error_SessionExpired") }
    static var PasswordExpired: String { .init("Error_PasswordExpired") }
    static var ResponseSerialization: String { .init("Error_ResponseSerialization") }
    static var MissingResponseData: String { .init("Error_MissingResponseData") }
    static var InvalidForm: String { .init("Error_FormValidation") }
    static var InvalidResponseMessage: String { .init("Error_InvalidResponseMessage") }
    static var InvalidResponseError: String { .init("Error_InvalidResponseError") }
    static var FailedRequest: String { .init("Error_FailedRequest") }
    static var RequestTimeOut: String { .init("Error_RequestTimeOut") }
    static var NoNetworkConnection: String { .init("Error_NoNetworkConnection") }
    static var NetworkError: String { .init("Error_NetworkError") }

    static var MediaNullableURL: String { .init("Error_MediaNullableURL") }
    static var MediaCacheDownloadFailed: String { .init("Error_MediaCacheDownloadFailed") }
    static var MediaCacheDirectoryCreationFailed: String {
        .init("Error_MediaCacheDirectoryCreationFailed")
    }
    static var MediaCacheEmptyResponse: String { .init("Error_MediaCacheEmptyResponse") }
    static var MediaCacheHttpError: String { .init("Error_MediaCacheHttpError") }
}
