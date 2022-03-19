//
//  ViewModel.swift
//  EdvoraSR
//
//  Created by Prajjwal on 19/03/22.
//

import Foundation

struct MainTabs : Hashable ,Codable{
    
    var id : Int
    var origin_station_code : Int
    
    
    
    var date : String
    var state : String
    var city : String
    var station_path : [Int]
    
    
    
    
}

class ViewModel : ObservableObject{
    @Published var mainTabs : [MainTabs] = []
    
    
    
    
    func fetch(){
        guard let url = URL(string: "https://assessment.api.vweb.app/rides") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){[weak self]data,_ ,
            error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let tabs = try JSONDecoder().decode([MainTabs].self , from: data)
                
                DispatchQueue.main.async {
                    self?.mainTabs = tabs
                }
                
            }
            catch{
                
                print(error)
                
            }
            
        }
        
        task.resume()
            
        
    }
}
