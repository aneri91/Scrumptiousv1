//
//  ItemListViewController.m
//  Scrumptious
//
//  Created by Karan Patel on 05/07/16.
//  Copyright © 2016 Karan Patel. All rights reserved.
//

#import "ItemListViewController.h"
#import "CartViewController.h"
#import "ItemCell.h"

@interface ItemListViewController ()

@end

@implementation ItemListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.LBLCategoryName.text = self.STRCategoryName;
    count = 00;
    _LBLNoOfQTY.text = [NSString stringWithFormat:@"%d",count];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)btnToProvious:(id)sender
{
    [[self navigationController]popViewControllerAnimated:YES];
}
-(IBAction)btnAddToCart:(id)sender
{
    CartViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CartView"];
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"ItemCell";
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.imageView1.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_STRCategoryImageName]];
    cell.TxtPrice.userInteractionEnabled = false;
    cell.TxtQty.keyboardType = UIKeyboardTypeNumberPad;
    [cell.BtnAddToCart setTag:indexPath.row+1000];
    
    [cell.BtnAddToCart addTarget:self action:@selector(btnAddItemToCart:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        count = count - 1;
        _LBLNoOfQTY.text = [NSString stringWithFormat:@"%d",count];
    }
    
}
-(IBAction)btnAddItemToCart:(id)sender
{
    count = count + 1;
    _LBLNoOfQTY.text = [NSString stringWithFormat:@"%d",count];
    
}
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu{
    return YES;
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
