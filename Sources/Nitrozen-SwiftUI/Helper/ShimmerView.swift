//
//  ShimmerView.swift
//  FyndPlatform
//
//  Created by Hitendra Solanki on 11/03/23.
//

import SwiftUI

//TODO: Hitendra - This is just copy from web for now, make it reusable with Configuration and Solid Standard

struct ShimmerView: View {
	@State private var isAnimating: Bool
	private let offset: CGFloat
	private let rotationAngle: Angle
	private let linearGradient: LinearGradient
	private let animation: Animation
	private let primaryColor: Color
	private let shimmerColor: Color
	private let size: CGSize
	private let shimmerSize: CGSize
	private let cornerRadius: CGFloat
	
	init(rotationAngle: Angle = Angle(degrees: 70),
		 animationSpeed: CGFloat = 0.2,
		 primaryColor: Color = .black.opacity(0.2),
		 shimmerColor: Color = .white.opacity(0.6),
		 size: CGSize = CGSize(width: 350, height: 200),
		 cornerRadius: CGFloat = 10) {
		self.offset = size.width * 1.5
		self.isAnimating = true
		self.rotationAngle = rotationAngle
		self.linearGradient = LinearGradient(colors: [shimmerColor.opacity(0.1),
													  shimmerColor,
													  shimmerColor.opacity(0.1)],
											 startPoint: .top,
											 endPoint: .bottom)
		self.animation = Animation.default.speed(animationSpeed).delay(0).repeatForever(autoreverses: false)
		self.primaryColor = primaryColor
		self.shimmerColor = shimmerColor
		self.size = size
		self.shimmerSize = CGSize(width: size.width * 1.5,
								  height: size.width * 1.5)
		self.cornerRadius = cornerRadius
	}
	
	var body: some View {
		primaryColor
			.frame(width: size.width, height: size.height)
			.overlay(shimmerLayer())
			.cornerRadius(cornerRadius)
			.onAppear {
				withAnimation(animation) {
					isAnimating.toggle()
				}
			}
	}
	
	private func shimmerLayer() -> some View {
		return Rectangle()
			.fill(linearGradient)
			.frame(width: shimmerSize.width,
				   height: shimmerSize.height)
			.rotationEffect(rotationAngle)
			.offset(x: isAnimating ? offset : -offset)
	}
}

struct ShimmerView_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			HStack {
				ShimmerView(size: CGSize(width: 60, height: 60))
				VStack(alignment: .leading) {
					ShimmerView(size: CGSize(width: 180, height: 13))
					ShimmerView(size: CGSize(width: 120, height: 13))
					ShimmerView(size: CGSize(width: 60, height: 13))
				}
			}
			
			ShimmerView()
		}
		.padding()
		.previewLayout(.sizeThatFits)
	}
}
