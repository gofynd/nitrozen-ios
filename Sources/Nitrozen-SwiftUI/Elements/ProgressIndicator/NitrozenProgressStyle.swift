//
//  NitrozenProgressStyle.swift
//  Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 10/05/23.
//

import SwiftUI

//MARK: iOS 14+ support
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct NitrozenProgressStyle: ProgressViewStyle {
		
	var appearance: NitrozenAppearance.ProgressView
	
	public init(appearance: NitrozenAppearance.ProgressView? = nil) {
		self.appearance = appearance.or(NitrozenAppearance.shared.progressView)
	}
	
	public func makeBody(configuration: Configuration) -> some View {
		return ZStack {
			if let fractionCompleted =  configuration.fractionCompleted {
				NitrozenProgressView(style: .deterministic(value: fractionCompleted), appearance: appearance)
			} else {
				NitrozenProgressView(style: .indeterministic, appearance: appearance)
			}
		}
	}
}

//MARK: iOS 13 support
public struct NitrozenProgressView: View {
	public enum Style {
		case deterministic(value: Double), indeterministic
	}
	
	let style: Style
	var appearance: NitrozenAppearance.ProgressView
	
	public init(style: Style, appearance: NitrozenAppearance.ProgressView? = nil) {
		self.style = style
		self.appearance = appearance.or(NitrozenAppearance.shared.progressView)
	}
	
	public var body: some View {
		return ZStack {
			switch style {
			case .deterministic(let value):
				NitrozenDeterministicProgressView(fractionCompleted: value, appearance: appearance)
			case .indeterministic:
				NitrozenIndeterministicProgressView(appearance: appearance)
			}
		}
	}
}


//MARK: NitrozenDeterministicProgressView
private struct NitrozenDeterministicProgressView: View {

	var appearance: NitrozenAppearance.ProgressView
	let fractionCompleted: Double
	
	public init(fractionCompleted: Double, appearance: NitrozenAppearance.ProgressView? = nil) {
		self.appearance = appearance.or(NitrozenAppearance.shared.progressView)
		self.fractionCompleted = fractionCompleted
	}
	
	public var body: some View {
		return ZStack {
			
			Circle()
				.stroke(appearance.backgrounRingcolor, style: StrokeStyle(lineWidth: appearance.width, lineCap: .round))
			
			Circle()
				.trim(from: 0, to: fractionCompleted)
				.stroke(appearance.color, style: StrokeStyle(lineWidth: appearance.width, lineCap: .round))
				.rotationEffect(.degrees(-90), anchor: .center)
		}
	}
}

//MARK: NitrozenIndeterministicProgressView
private struct NitrozenIndeterministicProgressView: View {

	@State private var fractionCompleted: Double = 0
	var appearance: NitrozenAppearance.ProgressView
	
	public init(appearance: NitrozenAppearance.ProgressView? = nil) {
		self.appearance = appearance.or(NitrozenAppearance.shared.progressView)
	}
	
	public var body: some View {
		return ZStack {
			
			Circle()
				.stroke(appearance.backgrounRingcolor, style: StrokeStyle(lineWidth: appearance.width, lineCap: .round))
				.padding(.top, 0)
			
			GrowingArc(p: fractionCompleted)
				.stroke(appearance.color, style: StrokeStyle(lineWidth: appearance.width, lineCap: .round))
				.onAppear {
					fractionCompleted = 0
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
						withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)) {
							fractionCompleted = 1
						}
					}
				}
		}
	}
	
	private struct GrowingArc: Shape {

		var maxLength = 2 * Double.pi - 0.7
		var lag = 0.35
		var p: Double

		var animatableData: Double {
			get { return p }
			set { p = newValue }
		}

		func path(in rect: CGRect) -> Path {

			let h = p * 2
			var length = h * maxLength
			if h > 1 && h < lag + 1 {
				length = maxLength
			}
			if h > lag + 1 {
				let coeff = 1 / (1 - lag)
				let n = h - 1 - lag
				length = (1 - n * coeff) * maxLength
			}

			let first = Double.pi / 2
			let second = 4 * Double.pi - first

			var end = h * first
			if h > 1 {
				end = first + (h - 1) * second
			}

			let start = end + length

			var p = Path()
			p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.height/2),
					 radius: rect.size.width/2,
					 startAngle: Angle(radians: start),
					 endAngle: Angle(radians: end),
					 clockwise: true)
			return p
		}
	}

}
