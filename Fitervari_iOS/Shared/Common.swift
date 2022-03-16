//
//  Common.swift
//  Fitervari
//
//  Created by Tobias Kern on 16.12.21.
//

extension Result where Success == Void {
	static var success: Result {
		return .success(())
	}
}

typealias VoidResult<E: Error> = Result<Void, E>
