//
//  AllArticalVM.swift
//  IOS_EX
//
//  Created by Fawaz  on 10/2/21.
//

import Foundation
import UIKit
class  AllArticlesViewMode: NSObject {
    let apiService = ApiService()
    
     private (set) var listOfArticles = [Article]()
    var isListLoaded = Bindable<Bool>()
        
    override init() {
                super.init()
        getListOfAllArticales()
        }
    func getNumberOfAllArticales() -> Int {
        return listOfArticles.count
    }
    
    func getInndexPathOfAllArtical (index:Int) -> Article{
        return listOfArticles[index]
        }
    func getAllArticaleByTitle (title: String) -> Article{
        return listOfArticles.first(where: { $0.title == title })! 
        }
    }
extension AllArticlesViewMode {

    public func getListOfAllArticales()  {
        apiService.network()
        {
            data in
            self.listOfArticles = data
            self.isListLoaded.value=true
            
        }
    }
    
}
