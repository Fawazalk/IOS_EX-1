//
//  ViewController.swift
//  IOS_EX
//
//  Created by Fawaz  on 9/30/21.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {
    
    var viewModel = AllArticlesViewMode()

    var articleTitle: String = ""

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
                    ArticalesTableViewCell.nib,
                    forCellReuseIdentifier: ArticalesTableViewCell.identifier)
        
        bindViewModel()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        

    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.getNumberOfAllArticales()
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:ArticalesTableViewCell.identifier,for: indexPath) as! ArticalesTableViewCell
         var articallll = viewModel.getInndexPathOfAllArtical(index: indexPath.row)
        cell.configure(articallll)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showDetails", sender: viewModel.getInndexPathOfAllArtical(index: indexPath.row))
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if let indexPath = tableView.indexPathsForSelectedRows{
                    guard let destiontionVc = segue.destination as? ArticalViewController else {return}
                
                    destiontionVc.articleTitle = (sender as! Article).title
                }
            }
        func bindViewModel(){
        viewModel.isListLoaded.bind { [weak self] (isListLoaded) in
        DispatchQueue.main.async {
            self?.tableView.reloadData()
        }
        }
}

}
