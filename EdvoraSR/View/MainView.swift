//
//  MainView.swift
//  EdvoraSR
//
//  Created by Prajjwal on 17/03/22.
//

import SwiftUI

//struct URLImage : View{
//
//    let urlString : String
//    @State var data : Data?
//    var body: some View{
//
//        if let data  = data{
//
//        }
//        else{
//            Image("")
//                .onAppear(){
//
//                }
//        }
//
//    }
//
//    private func fetchData(){
//        guard let url = URL(string : urlString)else{
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url){ data, _,_in
//
//            self.data = data
//        }
//
//    }
//
//}



struct MainView: View {
    
    @State var placer = 0
    
    @StateObject var viewModel = ViewModel()
    @State private var showingSheet = false
    var body: some View {
        ZStack{
            VStack {
                HStack{
                    Text("Edvora").fontWeight(.bold).font(.system(size: 50))
                    
                    Spacer()
                    
                    
                    
                    Image("bill_gates_pic").resizable().aspectRatio( contentMode: .fit).frame(width : 60,height :60).clipShape(Circle())
                    
                    
                }
                .padding(.horizontal)
                
                HStack(spacing : 15){
                    
                    Button(action : {placer = 0}){
                        Text("Nearest").fontWeight(.semibold).foregroundColor(placer==0 ? .white : .black)
                    }
                    .frame(width : 80,height : 40)
                    .background(placer==0 ? Color.black : Color.white)
                    .cornerRadius(12)
                    
                    Button(action : {placer = 1}){
                        Text("Upcoming").fontWeight(.semibold).foregroundColor(placer==1 ? .white : .black)
                    }
                    .frame(width : 100,height : 40).background(placer == 1 ? Color.black : Color.white)
                    
                    .cornerRadius(12)
                    Button(action : {placer = 2}){
                        Text("Past").fontWeight(.semibold).foregroundColor(placer==2 ? .white : .black)
                    }
                    .frame(width : 80,height : 40).background(placer == 2 ? Color.black : Color.white)
                    
                    .cornerRadius(12)
                    
                    Text("Filter")
                   
                    
                    
                
                }.padding(5)
                
                Spacer()
                
                ScrollView(showsIndicators : false){
                    ForEach(viewModel.mainTabs, id : \.self){ tab in
                        
                        
                        Button(action:{showingSheet.toggle()}){
                            TabView(detail: tab)
                        }
//
                        
                        
                        
                    }
                }
                    
                
            }
            
        }
        .onAppear(){
            viewModel.fetch()
        }
    }
}


struct TabView : View{
    let detail : MainTabs
    @State private var animationAmount = 1.0

    @State var extend  = false
    
    var body: some View{
        
        ZStack {
            
            VStack {
                HStack {
                    VStack(alignment : .leading){
                        Text("Ride ID").foregroundColor(.black)
                            .fontWeight(.light)
                        Text("\(detail.id)").foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    VStack(alignment : .trailing){
                        Text("Origin Station").foregroundColor(.black) .fontWeight(.light)
                        Text("\(detail.origin_station_code)").foregroundColor(.black).fontWeight(.semibold)
                    }
                }
                .padding(.horizontal,40)
                .padding(.vertical,5)
                
                Rectangle().frame(width : UIScreen.main.bounds.width-50,height : 1).foregroundColor(.black)
                HStack {
                    VStack(alignment : .leading){
                        Text("State").foregroundColor(.black)
                            .fontWeight(.light)
                        Text(detail.state).foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    VStack(alignment : .trailing){
                        Text("City").foregroundColor(.black) .fontWeight(.light)
                        Text(detail.city).foregroundColor(.black).fontWeight(.semibold)
                    }
                }
                .padding(.horizontal,40)
                .padding(.vertical,5)
                
                Rectangle().frame(width : UIScreen.main.bounds.width-50,height : 1).foregroundColor(.black)
                
                HStack{
                    VStack(alignment : .leading){
                    Text("Station Path").foregroundColor(.black)
                        .fontWeight(.light)
                    
                        HStack {
                            ForEach(0..<detail.station_path.count){x in
                            Text("\(detail.station_path[x])")
                               
                                .foregroundColor(.black).fontWeight(.semibold)
                            }
                        }
                    }
                    Spacer()
                    
                   
                    
                }
                .padding(.horizontal,40)
                .padding(.vertical,5)
            }
            .opacity(extend ? 1.0 : 0.0)
            VStack {
                
                Image("ESRmap").resizable()
                Spacer()
                
                
                
                HStack(spacing : 100){
                    
                    Text("\(detail.id)")
                        .fontWeight(.semibold).foregroundColor(.black)
                    
                    
                
                    Text(detail.date).foregroundColor(.black)
                }.padding(.bottom)
                
            }
           
            .opacity(extend ? 0.0 : 1)
            
            
        
            
            
            .frame(width: 350, height: 250)
            
            .background(Color.gray.opacity(extend ? 0.1 : 0.5))
            
            .cornerRadius(20)
            
        .padding(.vertical,5)
        }
        .onTapGesture(perform: {
            extend.toggle()
        }).animation(.easeIn(duration: 2),value : animationAmount)
        
        
    }
      
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

