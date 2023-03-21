//
//  Optional+Addition.swift
//
//
//  Created by Hitendra Solanki on 30/11/22.
//

import Foundation
import SwiftUI

extension Optional {
	
	var isNil: Bool {
		guard let _ = self else { return true }
		return false
	}
	var isNotNil: Bool {
		return !self.isNil
	}
}

//MARK: OR operations
extension Optional {
	
	typealias ORScopeReturnValue = Wrapped

	/// Return the value of the Optional or the `default` parameter
	/// - param: The value to return if the optional is empty
	func or(_ default: Wrapped) -> ORScopeReturnValue {
		return self ?? `default`
	}
	
	
	/// Returns the unwrapped value of the optional *or*
	/// the result of an expression `else`
	/// I.e. optional.or(else: print("Arrr"))
	func or(block: @autoclosure () -> ORScopeReturnValue) -> ORScopeReturnValue {
		return self ?? block()
	}
	
	/// Returns the unwrapped value of the optional *or*
	/// the result of calling the closure `else`
	/// I.e. optional.or(else: {
	/// ... do a lot of stuff
	/// })
	func or(block: () -> ORScopeReturnValue) -> ORScopeReturnValue {
		return self ?? block()
	}
	
	/// Returns the unwrapped contents of the optional if it is not empty
	/// If it is empty, throws exception `throw`
	func or(throw exception: Error) throws -> ORScopeReturnValue {
		guard let unwrapped = self else { throw exception }
		return unwrapped
	}
	
}

//MARK: OR operations with optional return to continue chaining
extension Optional {
	
	typealias OROptionalScopeReturnValue = Wrapped?
	
	/// Return the value of the Optional or the `default` parameter
	/// - param: The value to return if the optional is empty
	func orOptional(_ default: Wrapped) -> OROptionalScopeReturnValue {
		return self ?? `default`
	}
	
	
	/// Returns the unwrapped value of the optional *or*
	/// the result of an expression `else`
	/// I.e. optional.or(else: print("Arrr"))
	func orOptional(block: @autoclosure () -> OROptionalScopeReturnValue) -> OROptionalScopeReturnValue {
		return self ?? block()
	}
	
	/// Returns the unwrapped value of the optional *or*
	/// the result of calling the closure `else`
	/// I.e. optional.or(else: {
	/// ... do a lot of stuff
	/// })
	func orOptional(block: () -> OROptionalScopeReturnValue) -> OROptionalScopeReturnValue {
		return self ?? block()
	}
	
	/// Returns the unwrapped contents of the optional if it is not empty
	/// If it is empty, throws exception `throw`
	func orOptional(throw exception: Error) throws -> OROptionalScopeReturnValue {
		guard let unwrapped = self else { throw exception }
		return unwrapped
	}
	
}

extension Optional {
	
	/// Tries to unwrap `self` and if that succeeds continues to unwrap the parameter `optional`
	/// and returns the result of that.
	func and<B>(_ optional: B?) -> B? {
		guard self != nil else { return nil }
		return optional
	}
	
	/// Executes a closure with the unwrapped result of an optional.
	/// This allows chaining optionals together.
	func convert<T>(block: (Wrapped) -> T?) -> T? {
		guard let unwrapped = self else { return nil }
		return block(unwrapped)
	}
	
	func convert<T>(`if`: (Wrapped) -> T, `else`: ()-> T) -> T {
		guard let unwrapped = self else { return `else`() }
		return `if`(unwrapped)
	}
	
	/// Only perform `block` if the optional has a non-empty value
	func perform(block: (Wrapped) -> Void) {
		guard let unwrapped = self else { return }
		block(unwrapped)
	}
	
	/// Zips the content of this optional with the content of another
	/// optional `other` only if both optionals are not empty
	func zip2<A>(with other: Optional<A>) -> (Wrapped, A)? {
		guard let first = self, let second = other else { return nil }
		return (first, second)
	}
	
	/// Zips the content of this optional with the content of another
	/// optional `other` only if both optionals are not empty
	func zip3<A, B>(with other: Optional<A>, another: Optional<B>) -> (Wrapped, A, B)? {
		guard let first = self,
			  let second = other,
			  let third = another else { return nil }
		return (first, second, third)
	}
	
}

extension Optional {
	/// Executes a closure with the unwrapped result of an optional.
	/// This allows chaining optionals together.
	
	@ViewBuilder
	func convertToView(@ViewBuilder block: (Wrapped) -> some View) -> some View {
		if let unwrapped = self {
			block(unwrapped)
		}
	}
}
