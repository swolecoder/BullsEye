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
    @State var score = 0;
    @State var round = 1;
    
    
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
                Slider(value: self.$SliderValue, in: 1...100);
                Text("100")
            }
            Button(action: {
                self.alertIsVisible = true;
                
            }){
                Text("Hit Me")
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                let roundValue: Int = Int(self.SliderValue)
                return Alert(title: Text("\(self.alertTitle())"), message: Text("Slider Value is \(roundValue) \n"
                    
                    + " You scored \(self.pointsForCurrentRound()) points this round"
                    
                    ), dismissButton:    .default(Text("Awesone")){
                        self.score += self.pointsForCurrentRound();
                        self.target = Int.random(in:1...100);
                        self.round += 1;
                        
                    })
            }
            Spacer()
            HStack{
                Button(action: {
                    self.SliderValue = 50;
                    self.target = Int.random(in: 1...100);
                    self.score = 0;
                    self.round = 1;
                    
                }) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("\(self.score)")
                Spacer()
                Text("Round:")
                Text("\(self.round)")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
            .padding(.bottom,20)
            
        }
    }
    
    func pointsForCurrentRound()-> (Int){
        let result = Int(self.SliderValue) - Int(self.target);
        return 100 - abs(result);
    }
    
    func alertTitle()-> String{
        let result = Int(self.SliderValue) - Int(self.target);
        let returnData = result == 0 ? "Perfect" : result < 10 ? "You almost had it!!" : "Keep Trying";
        return returnData;
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
