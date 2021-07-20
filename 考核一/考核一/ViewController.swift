//
//  ViewController.swift
//  考核一
//
//  Created by GC on 2021/7/16.
//

import UIKit

class ViewController: UIViewController {
    
    var resoureData = [Int](repeating: 0, count: 30)
    let fullScreenSize = UIScreen.main.bounds.size
    var selectIndex:Int = -1
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x:0,y:0,width: fullScreenSize.width,height: fullScreenSize.height),style:.plain);
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"Cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .singleLine
        
        tableView.separatorInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        
        tableView.allowsSelection = true
        
        tableView.allowsMultipleSelection = false
        
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        Fibonacci()
        setupUI()
        setupConstraints()
    }
    
    override func awakeFromNib() {
        print("awakeFromNib")
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func didReceiveMemoryWarning() {
        print("didReceiveMemoryWarning")
    }
}

//MARK: -
extension ViewController {
    func Fibonacci(){
        resoureData[1] = 1
        for i in 2..<30 {
            resoureData[i] = resoureData[i-1] + resoureData[i-2]
            
        }
    }
    
}


//MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView:UITableView,didSelectRowAt indexPath: IndexPath) {
        selectIndex = indexPath.row
        print(indexPath)
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resoureData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath as IndexPath) as UITableViewCell
        if let myLabel = cell.textLabel {
            myLabel.text = "\(resoureData[indexPath.row])"
        }
        cell.textLabel?.textColor = .black
        
        if selectIndex == indexPath.row {
            cell.textLabel?.textColor = .red
        }
        
        return cell
    }

    

    
    
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
        
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?{
           return "删除"
       }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
       {
           
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.resoureData.remove(at: indexPath.row)
            if indexPath.row < selectIndex  {
                selectIndex = selectIndex-1
            } else if indexPath.row == selectIndex {
                selectIndex = -1
            }
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            tableView.reloadData()

           }
       }
}

//MARK: - UI
extension ViewController {
    
    func setupUI() {
        self.view.addSubview(tableView)
    }
    func setupConstraints() {
        
        
    }
    
}
