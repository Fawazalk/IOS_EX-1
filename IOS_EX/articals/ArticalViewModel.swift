//
//  ArticalViewModel.swift
//  IOS_EX
//
//  Created by Fawaz  on 10/3/21.
//

import Foundation
import UIKit

class  ArticlesViewMode: NSObject {
    let apiService = ApiService()
    
     private (set) var listOfArticles = [Article]()
    var isArticaloaded = Bindable<Bool>()
            override init() {
        
        super.init()
        getListOfArticales()
    
    }
    func getNumberOfArticales() -> Int {
        return listOfArticles.count
    }
        func getInndexPathOfArtical (index:Int) -> Article{
        return listOfArticles[index]
        }
    
        func getArticaleByTitle (title: String) -> Article{
        return listOfArticles.first(where: { $0.title == title })!
        }
    }
    extension ArticlesViewMode {

    public func getListOfArticales()  {
        apiService.network()
        {
            data in
            self.listOfArticles = data
            self.isArticaloaded.value=true
            
        }
    }
}
