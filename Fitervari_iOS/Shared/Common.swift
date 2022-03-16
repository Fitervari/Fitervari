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

extension Collection {

	/// Returns the element at the specified index if it is within bounds, otherwise nil.
	subscript (safe index: Index) -> Element? {
		return indices.contains(index) ? self[index] : nil
	}
}
