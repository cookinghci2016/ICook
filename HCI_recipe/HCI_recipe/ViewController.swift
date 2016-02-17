//
//  ViewController.swift
//  HCI_recipe
//
//  Created by Jie Tan on 2/15/16.
//  Copyright © 2016 Jie Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {


    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var flavorLabel: UILabel!
    @IBOutlet var ingredientLabel: UILabel!
    @IBOutlet var stepLabel: UILabel!
    @IBOutlet weak var caloryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var anotherNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var thisRecipe = Recipe(name:"Sweat and Sour Chicken",photo:UIImage(named: "SweetSour_Chicken")!, description: "")!
    var ingredients = ["Chicken","Sesame","Ketchup","Sugar"]
    var dosages = ["500g","1tsp","2Tsp","1Tsp"]
    var cookingtime = 30
    var flavor = "sweet"
    var calorie = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ScrollView.contentSize.height = 2000
        
        nameLabel.text = thisRecipe.name
        self.recipeImage.image = thisRecipe.photo
        anotherNameLabel.text = thisRecipe.name
        descriptionLabel.text = thisRecipe.description
        
        timeLabel.numberOfLines = 0
        timeLabel.frame = CGRectMake(0, 0, 65,50)
        timeLabel.text = "Time\n\(cookingtime)mins"
        //timeLabel.layer.borderWidth = 0.5
        //timeLabel.layer.borderColor = UIColor.greenColor().CGColor
        flavorLabel.numberOfLines=0
        flavorLabel.frame = CGRectMake(0, 0, 65,50)
        flavorLabel.text = "Flavor\n"+flavor
        caloryLabel.numberOfLines=0
        caloryLabel.frame = CGRectMake(0, 0, 65,50)
        caloryLabel.text = "Calorie\n\(calorie)K"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! IngredientCell
        cell.ingredientName.text = ingredients[indexPath.row]
        cell.ingredientDosage.text = dosages[indexPath.row]
        return cell
    }

    @IBAction func gotoOverview(sender: UIButton) {
        ScrollView.contentOffset = CGPointMake(0,0)
    }
    
    @IBAction func gotoIngredient(sender: UIButton) {
        
        ScrollView.contentOffset = CGPointMake(0,ingredientLabel.frame.minY)
    }
    @IBAction func gotoStep(sender: UIButton) {
        ScrollView.contentOffset = CGPointMake(0,stepLabel.frame.minY)
    }

}

