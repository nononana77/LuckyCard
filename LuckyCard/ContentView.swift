//
//  ContentView.swift
//  LuckyCard
//
//  Created by dawon on 2/8/24.
//
//
//  PracticeView.swift
//  Practice20240206
//
//  Created by dawon on 2/6/24.
//

import SwiftUI

struct ContentView: View {
    @State var isFlipped = false
    
    @State var isOn = true
    @State var stepperValue = 0
    @State var textValue = ""
    
    @State var isVisible = false
    @State var isVisible2 = false
    
    var body: some View {
        VStack{
            Button{
                print("스위치는 \(isOn ? "Hot" :"Ice")\n 스테퍼: \(stepperValue) \n 글자 입력: \(textValue)")
            } label: {
                Image(systemName: "ladybug")
                Text("LUCKY CARD")
                    .font(.title)
                Image(systemName: "lizard.fill")
                    
            }
            
            
            TextField("YOUR NAME", text: $textValue)
                .frame(width:150, height: 100,alignment: .center)
                
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.blue))
                
                
            
            
            
            
            Button("Create") {
                isVisible2 = true
            }
            .font(.title2)
            
            .sheet(isPresented: $isVisible2, content: {
                ZStack{
                    myCard(text: "🍀🍀🍀🍀🍀🍀🍀", textC: .black, color: .red, scolor: .blue, isTrue: 0, isFalse: -90, isFlipped: isFlipped)
                        
                        .animation(isFlipped ? .linear.delay(0.35): .linear, value: isFlipped)
                    myCard(text: textValue, textC: .black, color: .yellow, scolor: .red, isTrue: 90, isFalse: 0, isFlipped: isFlipped)
                   
                        .animation(isFlipped ? .linear : .linear.delay(0.35) , value: isFlipped)
                }
                .onTapGesture {
                    withAnimation (.easeInOut){
                        isFlipped.toggle()
                    }
                }
            })
            
            
            
        }
        .padding()
    
    }
}

#Preview {
    ContentView()
}

struct myCard: View {
    var text: String
    var textC: Color
    var color: Color
    var scolor: Color
    var isTrue: CGFloat
    var isFalse : CGFloat
    var isFlipped : Bool
    
    
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width:250, height:200)
                .foregroundColor(color)
            
            Text(text).bold().font(.title)
                .foregroundStyle(textC)
        }
        .rotation3DEffect(.degrees(isFlipped ? isTrue : isFalse),
                          axis: (x: 0.0, y: 1.0, z:0.0))
    }
}
