//
//  ContentView.swift
//  Reminders
//
//  Created by Alberto Almeida on 09/09/24.
//

import SwiftUI

class NumberModel: ObservableObject {
    let id = UUID()
    @Published var number: Int
    
    init(number: Int) {
        self.number = number
    }
    
    func addUp() {
        self.number += 1
    }
}

struct ContentView: View {
    @StateObject var counter: NumberModel = NumberModel(number: 0)
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    Text("Number count: \(counter.number)")
                    
                    NavigationLink {
                        NumberView()
                    } label: {
                        Text("Go to child view")
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Text("Number count: \(counter.number)")
                    }
                }
            }
            .environmentObject(counter)
        }
        .padding()
    }
}

struct NumberView: View {
    
    var body: some View {
        VStack {
            Text("We have this child view")
            Buttonview()
        }
    }
}

struct Buttonview: View {
    @EnvironmentObject var counter: NumberModel
    var body: some View {
        VStack {
            Button {
                counter.addUp()
            } label: {
                Text("Add 1 from the inner inner child")
                    .styleText()
            }
        }
    }
}

struct AddUp: View {
    @Binding var number: NumberModel
    var body: some View {
        HStack {
            Text("\(number.number)")
            Button {
                number.addUp()
            } label: {
                Image(systemName: "heart.fill")
            }
        }
    }
}

struct CambioText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 1)
                        )
                        .foregroundColor(Color.blue)
                        
        }
}

extension Text {
    func styleText() -> some View {
        modifier(CambioText())
    }
}

#Preview {
    ContentView()
}
