//
//  ContentView.swift
//  BullsEye
//
//  Created by Ashish Ranjan on 11/6/19.
//  Copyright © 2019 Ashish Ranjan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible:Bool = false;
    @State var SliderValue: Double = 50;
    @State var target = Int.random(in: 1...100);
    
    var body: some View {
        
        VStack{
            Spacer()
            HStack {
                Text("Put the Bulls eye as close as you can")
                Text("\(self.target)");
            }
            
            Spacer()
            HStack{
                
                Text("1")
                Slider(value: self.$SliderValue, in: 1...100)
                
                Text("100")
            }
            Button(action: {
                self.alertIsVisible = true;
                
            }){
                Text("Hit Me")
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                let roundValue: Int = Int(self.SliderValue)
                return Alert(title: Text("Hello There"), message: Text("Slider Value \(roundValue)"), dismissButton:    .default(Text("Awesone")))
            }
            Spacer()
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score")
                Text("999")
                Spacer()
                Text("Round")
                Text("99")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
            .padding(.bottom,20)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
