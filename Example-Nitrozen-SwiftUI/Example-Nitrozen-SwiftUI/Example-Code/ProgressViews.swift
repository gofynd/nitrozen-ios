//
//  ProgressViewExample.swift
//  Example-Nitrozen-SwiftUI
//
//  Created by Hitendra Solanki on 10/05/23.
//

import SwiftUI
import Nitrozen_SwiftUI

struct ProgressViews: View {
   
	var body: some View {
		List{
			Section("- iOS14 supported \n- deterministic progress type") {
				HStack(spacing: 20) {
					Group {
												
						ProgressView(value: 0.35, total: 1)
							.nitrozenProgress()
						
						ProgressView(value: 0.15, total: 1)
							.nitrozenProgress(apperance: .init(
								color: ColorProvider.shared.error50,
								width: 6,
								backgrounRingcolor: ColorProvider.shared.error50.opacity(0.25))
							)
					}
					.frame(width: 44, height: 44)
				}
			}


			Section("- iOS14 supported \n- indeterministic progress type") {
				HStack(spacing: 20) {
					Group {
						ProgressView()
							.nitrozenProgress()
						
						ProgressView()
							.nitrozenProgress(apperance: .init(
								color: ColorProvider.shared.error50,
								width: 6,
								backgrounRingcolor: ColorProvider.shared.error50.opacity(0.25))
							)
						
						ProgressView()
							.nitrozenProgress(apperance: .init(
								color: ColorProvider.shared.success50,
								width: 10,
								backgrounRingcolor: ColorProvider.shared.success50.opacity(0.25))
							)
						
						ProgressView()
							.nitrozenProgress(apperance: .init(
								color: ColorProvider.shared.secondary50,
								width: 12,
								backgrounRingcolor: ColorProvider.shared.secondary50	.opacity(0.25))
							)
					}
					.frame(width: 44, height: 44)
				}
			}
			
			Section("- iOS13 supported \n- deterministic progress type") {
				HStack(spacing: 20) {
					Group {
						
						NitrozenProgressView(style: .deterministic(value: 0.7))
						
						NitrozenProgressView(
							style: .deterministic(value: 0.27),
							appearance: .init(
								color: ColorProvider.shared.success50,
								width: 10,
								backgrounRingcolor: ColorProvider.shared.success50.opacity(0.25)
							)
						)
						
						NitrozenProgressView(
							style: .deterministic(value: 0.47),
							appearance: .init(
								color: .purple,
								width: 4,
								backgrounRingcolor: .purple.opacity(0.25)
							)
						)
					}
					.frame(width: 44, height: 44)
				}
			}


			Section("- iOS13 supported \n- indeterministic progress type") {
				HStack(spacing: 20) {
					Group {
						NitrozenProgressView(style: .indeterministic)
						
						NitrozenProgressView(
							style: .indeterministic,
							appearance: .init(
								color: .purple,
								width: 10,
								backgrounRingcolor: .purple.opacity(0.25))
							)
						
						NitrozenProgressView(
							style: .indeterministic,
							appearance: .init(
								color: .black,
								width: 10,
								backgrounRingcolor: .black.opacity(0.25))
						)
						
						NitrozenProgressView(
							style: .indeterministic,
							appearance: .init(
								color: .mint,
								width: 16,
								backgrounRingcolor: .indigo.opacity(0.25))
							)
					}
					.frame(width: 44, height: 44)
				}
			}
		}
	}
}

struct ProgressViews_Previews: PreviewProvider {
	static var previews: some View {
		ProgressViews()
	}
}
