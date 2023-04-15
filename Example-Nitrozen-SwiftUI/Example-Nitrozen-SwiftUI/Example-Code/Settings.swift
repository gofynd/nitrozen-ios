//
//  Settings.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 14/04/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct Settings: View {
	
	init(){
		self.primaryColor = NitrozenAppearance.shared.colorProvider.primary50
		self.secondaryColor = NitrozenAppearance.shared.colorProvider.secondary50
		self.sparkleColor = NitrozenAppearance.shared.colorProvider.sparkle50
	}
	
	@State var primaryColor: SystemColor
	@State var secondaryColor: SystemColor
	@State var sparkleColor: SystemColor
	
	
	
	let circleSize: CGFloat = 20
	
	var body: some View {
		ScrollView {
			VStack {
				
				Group {
					primaryView()
					Divider()
					
					secondaryView()
					Divider()
					
					sparkleView()
					Divider()
				}
				
				Group {
					grayShadesView()
					Divider()
					
					HStack {
						successView()
						Divider()
						
						errorView()
					}
					
					Divider()
					
					warningView()
				}
			}
			
		}
		.frame(height: 700)
	}
	
	@ViewBuilder
	func errorView() -> some View {
		
		VStack {
			Text("Error Colors")
				.body(size: .m, weight: .useDefault)
				.frame(maxWidth: .infinity, alignment: .leading)
			
			HStack {
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.error80)
						.frame(width: circleSize)
					Text("e80")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.error50)
						.frame(width: circleSize)
					Text("e50")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.error20)
						.frame(width: circleSize)
					Text("e20")
				}
				
				Spacer()
				
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
	
	@ViewBuilder
	func warningView() -> some View {
		
		VStack {
			Text("Warning Colors")
				.body(size: .m, weight: .useDefault)
				.frame(maxWidth: .infinity, alignment: .leading)
			
			HStack {
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.warning80)
						.frame(width: circleSize)
					Text("w80")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.warning50)
						.frame(width: circleSize)
					Text("w50")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.warning20)
						.frame(width: circleSize)
					Text("w20")
				}
				
				Spacer()
				
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
	
	@ViewBuilder
	func successView() -> some View {
		VStack {
			Text("Success Colors")
				.body(size: .m, weight: .useDefault)
				.frame(maxWidth: .infinity, alignment: .leading)
			
			HStack {
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.success80)
						.frame(width: circleSize)
					Text("s80")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.success50)
						.frame(width: circleSize)
					Text("s50")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.success20)
						.frame(width: circleSize)
					Text("s20")
				}
				
				Spacer()
				
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
	
	@ViewBuilder
	func primaryView() -> some View {
		VStack {
			HStack {
				ColorPicker("Set primary50 color", selection: $primaryColor)
					.body(size: .m, weight: .useDefault)
				let _ = NitrozenAppearance.shared.colorProvider.primary50(self.primaryColor, autoUpdateToOtherControls: true) //update to theme
				Spacer()
			}
		}
		
		VStack {
			HStack {
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.primary80)
						.frame(width: circleSize)
					Text("p80")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.primary70)
						.frame(width: circleSize)
					Text("p70")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.primary60)
						.frame(width: circleSize)
					Text("p60")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.primary50)
						.frame(width: circleSize)
					Text("p50")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.primary40)
						.frame(width: circleSize)
					Text("p40")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.primary30)
						.frame(width: circleSize)
					Text("p30")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.primary20)
						.frame(width: circleSize)
					Text("p20")
				}
				
				Spacer()
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
	
	@ViewBuilder
	func secondaryView() -> some View {
		
		//secondaryColor
		VStack {
			HStack {
				ColorPicker("Set secondary50 color", selection: $secondaryColor)
					.body(size: .m, weight: .useDefault)
				let _ = NitrozenAppearance.shared.colorProvider.secondary50(self.secondaryColor)//update to theme
				Spacer()
			}
		}
		
		VStack {
			HStack {
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.secondary80)
						.frame(width: circleSize)
					Text("s80")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.secondary70)
						.frame(width: circleSize)
					Text("s70")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.secondary60)
						.frame(width: circleSize)
					Text("s60")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.secondary50)
						.frame(width: circleSize)
					Text("s50")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.secondary40)
						.frame(width: circleSize)
					Text("s40")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.secondary30)
						.frame(width: circleSize)
					Text("s30")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.secondary20)
						.frame(width: circleSize)
					Text("s20")
				}
				
				Spacer()
				
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
		
	}
	
	
	@ViewBuilder
	func sparkleView() -> some View {
		
		VStack {
			HStack {
				ColorPicker("Set sparkle50 color", selection: $sparkleColor)
					.body(size: .m, weight: .useDefault)
				let _ = NitrozenAppearance.shared.colorProvider.sparkle50(self.sparkleColor)//update to theme
				Spacer()
			}
		}
		
		VStack {
			HStack {
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.sparkle80)
						.frame(width: circleSize)
					Text("sp80")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.sparkle70)
						.frame(width: circleSize)
					Text("sp70")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.sparkle60)
						.frame(width: circleSize)
					Text("sp60")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.sparkle50)
						.frame(width: circleSize)
					Text("sp50")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.sparkle40)
						.frame(width: circleSize)
					Text("sp40")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.sparkle30)
						.frame(width: circleSize)
					Text("sp30")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.sparkle20)
						.frame(width: circleSize)
					Text("sp20")
				}
				
				Spacer()
				
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
		
	}
	
	@ViewBuilder
	func grayShadesView() -> some View {
		
		VStack {
			Text("Gray shades color")
				.body(size: .m, weight: .useDefault)
				.frame(maxWidth: .infinity, alignment: .leading)
			
			HStack {
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.gray100)
						.frame(width: circleSize)
					Text("g100")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.gray80)
						.frame(width: circleSize)
					Text("g80")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.gray60)
						.frame(width: circleSize)
					Text("g60")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.gray40)
						.frame(width: circleSize)
					Text("g40")
				}
				
				VStack {
					Circle()
						.fill(NitrozenAppearance.shared.colorProvider.gray20)
						.frame(width: circleSize)
					Text("g20")
				}
				
				Spacer()
				
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
}

