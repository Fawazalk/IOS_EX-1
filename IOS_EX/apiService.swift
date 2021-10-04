//
//  apiService.swift
//  IOS_EX
//
//  Created by Fawaz  on 10/2/21.
//

import Foundation

struct ApiService {

    func network(comp: @escaping ([Article])->()) {
    
    let api = URL(string:"https://no89n3nc7b.execute-api.ap-southeast-1.amazonaws.com/staging/exercise")
    
    URLSession.shared.dataTask(with: api!){
        data,response, error in
        if error != nil {
            print(error?.localizedDescription)
            return
        }
            do
            {
                let result = try JSONDecoder().decode(Welcome.self, from: data!)
                comp(result.articles)
            } catch {
                                
            }
        
    }.resume()
    

}
}
