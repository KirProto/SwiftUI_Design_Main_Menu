//
//  ContentView.swift
//  Yan_SwiftUI_Design_Main_Menu
//
//  Created by KIR Q on 2022.02.17.
//


// person.crop.circle
//
// cart.fill
// bag.fill
//
// text.justify
// rectangle.and.pencil.and.ellipsis
//
// Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255)
//
//
//


import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    @State var show = false
    
    var body: some View {
        
        ZStack {
            
            HStack {
                
                VStack(alignment: .leading, spacing: 12) {
                    //                    avatar
//                    Image(systemName: "person.crop.circle")
//                    Image("apple")
                    Image("Color")
                        .clipShape(Circle())
                    Text("Hello,")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    Text("Apple")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        
                        self.index = 0
                        
                        withAnimation {
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 25) {
                            
                            Image(systemName: "cart.fill")
                                .foregroundColor(self.index == 0 ? Color.indigo : Color.white)
//                            Text("Catalogue")
                            Text("Каталог")
                                .foregroundColor(self.index == 0 ? Color.indigo : Color.white)
                        }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(self.index == 0 ? Color.indigo.opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                    }
                    .padding(.top, 25)
                    
                    
                    Button(action: {
                        
                        self.index = 1
                        
                        withAnimation {
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 25) {
                            
                            Image(systemName: "bag.fill")
                                .foregroundColor(self.index == 1 ? Color.indigo : Color.white)
                            
//                            Text("Bag")
                            Text("Корзина")
                                .foregroundColor(self.index == 1 ? Color.indigo : Color.white)
                            
                        }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(self.index == 1 ? Color.indigo.opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = 2
                        
                        withAnimation {
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 25) {
                            
                            Image(systemName: "heart.fill")
                                .foregroundColor(self.index == 2 ? Color.indigo : Color.white)
                            
                                //Text("Favorite")
                            Text("Избранное")
                                .foregroundColor(self.index == 2 ? Color.indigo : Color.white)
                        }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(self.index == 2 ? Color.indigo.opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        
                        self.index = 3
                        
                        withAnimation {
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 25) {
                            
                            Image(systemName: "text.justify")
                                .foregroundColor(self.index == 3 ? Color.indigo : Color.white)
                            
                            //Text("My Orders")
                            Text("Мои Заказы")
                                .foregroundColor(self.index == 3 ? Color.indigo : Color.white)
                            
                        }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(self.index == 3 ? Color.indigo.opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                    }
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical, 30)
                    
                    Button(action: {
                        //
                    }) {
                        
                        HStack(spacing: 25) {
                            
                            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                                .foregroundColor(Color.white)
                            
//                            Text("Door")
                            Text("Exit")
                                .foregroundColor(Color.white)
                        }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 0)
                }
                    .padding(.top, 25)
                    .padding(.horizontal, 20)
            
            Spacer(minLength: 0)
        }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        
        
        VStack(spacing: 0) {
            
            HStack(spacing: 15) {
                
                Button(action: {
                    
                    withAnimation {
                        
                        self.show.toggle()
                    }
                    
                }) {
                    
                    
                    Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                        .resizable()
                        .frame(width: self.show ? 18 : 22, height: 18)
                        .foregroundColor(Color.black.opacity(0.4))
                }
                
                
                Text(self.index == 0 ? "Каталог" : (self.index == 1 ? "Корзина" : (self.index == 2 ? "Избранное" : "Мои Заказы")))
                    .font(.title)
                    .foregroundColor(Color.black.opacity(0.6))
                
                Spacer(minLength: 0)
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            // UIWindowScene.windows
            // .padding(.top, UIWindowScene.windows.first?.safeAreaInsets.top)
            .padding()
            
            
            GeometryReader { _ in
                
                VStack {
                    
                    if self.index == 0 {
                        
                        Catalogue()
                    }
                    else if self.index == 1 {
                        
                        Cart()
                    }
                    else if self.index == 2 {
                        
                        Favorite()
                    }
                    else {
                        
                        Orders()
                    }
                }
            }
        }
            
        .background(Color.white)
        .cornerRadius(self.show ? 30 : 0)
        .scaleEffect(self.show ? 0.9 : 1)
        .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
        .rotationEffect(.init(degrees: self.show ? -5 : 0))
            
            }
//        .background(Color.brown)
        .background(Color.red.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
}
}



struct Catalogue: View {
    
    var body: some View {
        
        VStack {
            
            Text("Каталог")
        }
    }
}


struct Cart: View {
    
    var body: some View {
        
        VStack {
            
            Text("Корзина")
        }
    }
}


struct Orders: View {
    
    var body: some View {
        
        VStack {
            
            Text("Мои Заказы")
        }
    }
}


struct Favorite: View {
    
    var body: some View {
        
        VStack {
            
            Text("Избранное")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
