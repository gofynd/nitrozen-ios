## Alert - Preview

| Preview1 | Preview2 |
| ---      | ---      |
| <img src="https://raw.githubusercontent.com/keyur-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/alert1.png" width="300"> | <img src="https://raw.githubusercontent.com/keyur-gofynd/nitrozen-ios/master/Example-Nitrozen-SwiftUI/Example-Nitrozen-SwiftUI/Preview%20Content/alert2.png" width="300"> |

## Alert code snippets
Alert with example
```swift
struct Alerts: View {
    
    @State var canShowAlert1: Bool = false
    @State var canShowAlert2: Bool = false
    
    
    var body: some View {
        
        List {
            Section {
                Text("Alert with Horizontal Actions")
                
                Button {
                    self.canShowAlert1 = true
                } label: {
                    Text("Show alert")
                        .frame(maxWidth: .infinity)
                }
                .primaryButton()
            }
            
            Section {
                Text("Alert with Verticle Actions")
                
                Button {
                    self.canShowAlert2 = true
                } label: {
                    Text("Show alert")
                        .frame(maxWidth: .infinity)
                }
                .primaryButton()
                            
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red.opacity(0.2))
        .nitrozenSheet(isPresented: $canShowAlert1, postion: .center) {
            NitrozenAlert(isPresented: $canShowAlert1,
                          title: "Great! Your bank account was added successfully",
                          subtitle: "You KYC verification is pending. Check your mailbox to complete the process.",
                          topView: AnyView(
                            Image(systemName: "exclamationmark.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .foregroundColor(.orange)
                                .frame(width: 40, height: 40)
                                .padding(.top, 20)
                                .padding(.bottom, 12)
                          ),
                          closeView: .nitrozen,
                          actions: {
                
                HStack(spacing: 16) {
                    Button {
                        print("tap on button 1")
                        self.canShowAlert1 = false
                    } label: {
                        Text("B1")
                            .frame(maxWidth: .infinity)
                    }
                    .borderedButton()
                    
                    Button {
                        print("tap on button 2")
                        self.canShowAlert1 = false
                    } label: {
                        Text("B2")
                            .frame(maxWidth: .infinity)
                    }
                    .primaryButton()
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 48)
                
            })
        }
        .nitrozenSheet(isPresented: $canShowAlert2, postion: .center) {
            NitrozenAlert(isPresented: $canShowAlert2,
                          title: "Great! Your bank account was added successfully",
                          subtitle: "You KYC verification is pending. Check your mailbox to complete the process.",
                          topView: AnyView(
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .foregroundColor(.green)
                                .frame(width: 40, height: 40)
                                .padding(.top, 20)
                                .padding(.bottom, 12)
                          ),
                          closeView: .nitrozen,
                          actions: {
                
                VStack(spacing: 16) {
                    Button {
                        print("tap on button 1")
                        self.canShowAlert2 = false
                    } label: {
                        Text("B1")
                            .frame(maxWidth: .infinity)
                    }
                    .borderedButton()
                    
                    Button {
                        print("tap on button 2")
                        self.canShowAlert2 = false
                    } label: {
                        Text("B2")
                            .frame(maxWidth: .infinity)
                    }
                    .primaryButton()
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 48)
                
            })
        }
    }
}


```
