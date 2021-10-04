//
//  ArticalViewController.swift
//  IOS_EX
//
//  Created by Fawaz  on 10/3/21.
//

import Foundation

import UIKit


class ArticalViewController: UIViewController {
    
    var viewModel = ArticlesViewMode()

    let parser = ApiService()
    var articles = [Article] ()
    var articleTitle: String = ""

    
    @IBOutlet weak var detPoster: UIImageView!
    @IBOutlet weak var detTitle: UILabel!
    @IBOutlet weak var detDescription: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        bindViewModel()
    }
                        
    func configure(_ artical: Article) {
        
        self.detTitle.text = " \(artical.title)"
        self.detDescription.text = " \(artical.content)"
        
            
        guard let imageURL = URL(string:"\(artical.imageURL)") else { return }

            // just not to cause a deadlock in UI!
            DispatchQueue.global().async {
                guard let imageData = try? Data(contentsOf: imageURL) else { return }

                let image = UIImage(data: imageData)

                DispatchQueue.main.async {
                    self.detPoster.image = image
                }
            }
            }
   }

extension ArticalViewController {
    
    func bindViewModel(){
        viewModel.isArticaloaded.bind { [weak self] (isArticleLoaded) in
        DispatchQueue.main.async {
            self?.configure(self!.viewModel.getArticaleByTitle(title: self!.articleTitle))
        }
        }
}
}



