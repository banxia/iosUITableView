//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by jin jianxiong on 9/3/13.
//  Copyright (c) 2013 jin jianxiong. All rights reserved.
//

#import "SimpleTableViewController.h"
#import "SimpleTableCell.h"

@interface SimpleTableViewController ()

@end

@implementation SimpleTableViewController
{
    NSArray * tableData;
    
    NSArray * thumbnails;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // 用于TableView的DataSource
    tableData = [NSArray arrayWithObjects:@"Egg Benedict",@"Mushroom Risotto",@"Full Breakfast",@"Hamburger",@"Ham and Egg Sandwich",@"Creme Brelee",@"White Chocolate Donut",@"Starbucks Coffee",@"Vegetable Curry",@"Instant Noodle with Egg",@"Noodle with BBQ Pork",@"Japanese Noodle with Pork",@"Green Tea",@"Thai Shrimp Cake",@"Angry Birds Cake",@"Ham and Cheese Panini",nil];
    
    
    thumbnails = [NSArray arrayWithObjects:@"egg_benedict.jpg",@"mushroom_risotto.jpg",@"full_breakfast.jpg",@"hamburger.jpg",@"ham_and_egg_sandwich.jpg",@"creme_brelee.jpg",@"white_chocolate_donut.jpg",@"starbucks_coffee.jpg",@"vegetable_curry.jpg",@"instant_noodle_with_egg.jpg",@"noodle_with_bbq_pork.jpg",@"japanese_noodle_with_pork.jpg",@"green_tea.jpg",@"thai_shrimp_cake.jpg",@"angry_birds_cake.jpg",@"ham_and_cheese_panini.jpg",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [tableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * simpleTableIdentifier = @"SimpleTableItem";
    
    SimpleTableCell * cell
    = (SimpleTableCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // 支持单行选择
    NSIndexPath * selection = [tableView indexPathForSelectedRow];
    if (selection && selection.row == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = @"prepTime:";
    cell.timeLabel.text = [NSString stringWithFormat:@"%@",[NSDate date]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString* msg = [tableData objectAtIndex:indexPath.row];
    
    UIAlertView * messageAlert = [[UIAlertView alloc]
                                  
                                  initWithTitle:@"已选择"
                                  message:msg
                                  delegate:nil
                                  cancelButtonTitle:@"确定"
                                  otherButtonTitles: nil];
    [messageAlert show];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Deselect --%d",indexPath.row);
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 78;
}

@end
