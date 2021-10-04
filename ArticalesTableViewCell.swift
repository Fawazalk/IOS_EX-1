//
//  ArticalesTableViewCell.swift
//  IOS_EX
//
//  Created by Fawaz  on 10/3/21.
//

import UIKit

class ArticalesTableViewCell: UITableViewCell {
        
    @IBOutlet weak var titleLAble: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    @IBOutlet weak var imagesView: UIImageView!
    
    static let identifier = "ArticalCell"
    
    

    // Returning the xib file after instantiating it
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    
                   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
    

           
        }
    func configure(_ artical: Article) {
        
        self.titleLAble.text = " \(artical.title)"
        self.descriptionLable.text = " \(artical.content)"
        
            
        guard let imageURL = URL(string:"\(artical.imageURL)") else { return }

            // just not to cause a deadlock in UI!
            DispatchQueue.global().async {
                guard let imageData = try? Data(contentsOf: imageURL) else { return }

                let image = UIImage(data: imageData)

                DispatchQueue.main.async {
                    self.imagesView.image = image
                }
            }
        }
    
       
    }
        
    
    


