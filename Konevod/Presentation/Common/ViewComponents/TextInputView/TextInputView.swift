//
//  Created by Ilya Sakalou on 14.11.20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct TextInputView<Store>: View where Store: TextInputViewOutput {
  var placeholder: String
  @ObservedObject var store: Store
  
  var body: some View {
    ZStack {
      GeometryReader { geometry in
        if $store.state.wrappedValue == .error {
          HStack {
            HStack {
              VStack(alignment: .leading) {
                Text(store.enteredText)
                  .fixedSize(horizontal: false, vertical: true)
                Text(store.errorText)
                  .fixedSize(horizontal: false, vertical: true)
                  .font(.system(size: 11))
                  .foregroundColor(Color.red)
              }
              Spacer()
              Image("alert")
                .renderingMode(.template)
                .foregroundColor(.red)
            }.padding()
          }
          .frame(
            width: geometry.size.width,
            height: geometry.size.height,
            alignment: .center
          )
          .overlay(
            RoundedRectangle(cornerRadius: 16)
              .stroke(Color.red, lineWidth: 2)
              .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .center
              )
          )
          .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
        }
        if $store.state.wrappedValue == .input {
          HStack {
            TextField(placeholder, text: $store.enteredText)
              .padding()
          }
          .frame(
            width: geometry.size.width,
            height: geometry.size.height,
            alignment: .center
          )
          .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
        }
      }
    }
  }
}

struct TextInputErrorView_Previews: PreviewProvider {
  static var previews: some View {
    TextInputView(placeholder: "Please enter email", store: TextInputStore())
      .frame(width: 340, height: 60, alignment: .center)
      .background(Color.clear)
      .previewLayout(.sizeThatFits)
    
    TextInputView(placeholder: "Please enter email", store: TextInputStore())
      .frame(width: 200, height: 100, alignment: .center)
      .background(Color.gray)
      .previewLayout(.sizeThatFits)
    
    TextInputView(placeholder: "Please enter email", store: TextInputStore())
      .frame(width: 340, height: 60, alignment: .center)
      .background(Color.black)
      .previewLayout(.sizeThatFits)
      .environment(\.layoutDirection, .rightToLeft)
    
    TextInputView(
      placeholder: "Please enter email",
      store: TextInputStore(
        state: .error,
        errorText: "Пользователя с таким email не существует",
        enteredText: "test@example.com"
      )
    )
    .frame(width: 340, height: 60, alignment: .center)
    .background(Color.gray)
    .previewLayout(.sizeThatFits)
    
    TextInputView(
      placeholder: "Please enter email",
      store: TextInputStore(
        state: .error,
        errorText: "Пользователя с таким email не существует",
        enteredText: "test@example.com"
      )
    )
    .frame(width: 340, height: 60, alignment: .center)
    .background(Color.gray)
    .previewLayout(.sizeThatFits)
    .environment(\.layoutDirection, .rightToLeft)
  }
}
