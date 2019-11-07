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
    

    var body: some View {
        
        VStack{
            HStack {
                Text("Put the Bulls eye as close as you can")
                Text("100")
            
            
            }
            
            HStack{
                
                Text("1")
                Slider(value: .constant(10))

                  Text("100")
            }
            Button(action: {
                self.alertIsVisible = true;
                
            }){
                Text("Hit Me")
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text("Hello There"), message: Text("This is my first pop up"), dismissButton:    .default(Text("Awesone")))
            }
            
//            Button(action:{
//
//                self.alertIsVisible = true;
//            }){
//                Text("knock knock")
//            }
//            .alert(isPresented: $alertIsVisible) { () -> Alert in
//                return Alert(title: Text("WHo is there"), message: Text("blah blah "), dismissButton: .default(Text("Close")))
//            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
