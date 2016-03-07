//
//  ManagementViewController.m
//  ICloudBook_ios
//
//  Created by MasterFan on 16/2/28.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import "ManagementViewController.h"

@interface ManagementViewController ()

@end

@implementation ManagementViewController
@synthesize listData, images;

- (void)viewDidLoad {
    [super viewDidLoad];
    
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:40 green:169 blue:97 alpha:1];
    
    // Do any additional setup after loading the view.
    //init list
    listData = [[NSArray alloc] initWithObjects:@"阅读情况统计", @"图书阅读情况管理", @"用户阅读情况管理", @"用户账号管理", @"上传图书审核管理", @"图书综合数据管理", @"班级阅读情况管理", nil];
    images   = [[NSArray alloc] initWithObjects:@"ic_m_brokenline", @"ic_m_book_readinf", @"ic_m_user_readinf", @"ic_m_account", @"ic_upload_verify", @"ic_m_ synthesize", @"ic_m_class_readinf", nil];
    [_myTableView setTableFooterView:[[UIView alloc] init]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma tableView delegate & dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listData count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * tableIdentifier = @"identifier_management";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    cell.textLabel.text  = [listData objectAtIndex: [indexPath row]];
    cell.imageView.image = [UIImage imageNamed:[images objectAtIndex:[indexPath row]]];
    
    //bind data
    //    cell.imageView.image = [UIImage imageNamed:[images objectAtIndex:[indexPath row]]];
    //    cell.textLabel.text  = [listData objectAtIndex: [indexPath row]];
    //    cell.headImg.image     = [UIImage imageNamed:[images objectAtIndex:[indexPath row]]];
    //    cell.contentLabel.text = [listData objectAtIndex: [indexPath row]];
    
    //return
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
@end
