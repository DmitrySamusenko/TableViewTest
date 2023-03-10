//
//  ViewController.swift
//  TableViewTest
//
//  Created by Dmitry Samusenko on 23.01.2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Variables
    private var counter: Int = 0
    private var items: [PostItem] = [
        PostItem(type: .post, image: UIImage(systemName: "applewatch"), text: "This is new AppleWatch!"),
        PostItem(type: .post, image: UIImage(systemName: "applepencil"), text: "This is new AppleWatch!"),
        PostItem(type: .ad, image: nil, text: "Check our new Table View"),
    ]
    
    // MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let adNib = UINib(nibName: "AdCell", bundle: nil)
        tableView.register(adNib, forCellReuseIdentifier: "AdCell")
        let postNib = UINib(nibName: "PostCell", bundle: nil)
        tableView.register(postNib, forCellReuseIdentifier: "PostCell")
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item.type {
        case .post:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
            cell.configure(icon: item.image, text: item.text)
            return cell
        case .ad:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as! AdCell
            cell.configure(with: item.text)
            cell.delegate = self
            return cell
        }
    }
    
    
}

extension ViewController: AdDelegate {
    func didTapActionButton(cell: UITableViewCell) {
        counter += 1
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let row = indexPath.row
        items[row].text = String(counter)
        
        tableView.reloadData()
    }
    
    
}
