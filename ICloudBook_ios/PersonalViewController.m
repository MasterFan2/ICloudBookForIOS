//
//  PersonalViewController.m
//  ICloudBook_ios
//
//  Created by MasterFan on 16/2/28.
//  Copyright © 2016年 MasterFan. All rights reserved. hello.there
//

#import "PersonalViewController.h"

#import "WorkManagementViewController.h"
#import "ProfileViewController.h"
#import "UploadBookViewController.h"
#import "BookFriendViewController.h"
#import "MyCommentsViewController.h"
#import "MessageCenterViewController.h"

@interface PersonalViewController ()

@end

@implementation PersonalViewController
@synthesize listData, images;


- (void)viewDidLoad {
    [super viewDidLoad];
    
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:40 green:169 blue:97 alpha:1];
    
    // Do any additional setup after loading the view.
    [personalHeadImage setUserInteractionEnabled:YES];
    UITapGestureRecognizer * singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageTap)];
    [personalHeadImage addGestureRecognizer:singleTap];
    
    _personTable.dataSource = self;
    _personTable.delegate   = self;
    
    
    //[_personTable registerNib:[UINib nibWithNibName:@"PersonalTableViewCell" bundle:nil] forCellReuseIdentifier:@"identifier_personal"];
    _personTable.tableHeaderView = self.personHeaderView;
    _personTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"refresh");
        
        [NSThread sleepForTimeInterval:2.0f];
        [_personTable.mj_header endRefreshing];
        
    }];
    
    _personTable.tableFooterView = [[UIView alloc] init];//去除多余的分隔线
    
    //init list
    listData = [[NSArray alloc] initWithObjects:@"作品管理", @"我的上传", @"我的评论", @"我的书友", @"消息中心", @"摘录笔记", nil];
    images   = [[NSArray alloc] initWithObjects:@"ic_p_manage", @"ic_p_myupload", @"ic_p_comments", @"ic_p_friend", @"ic_p_msg", @"ic_p_note", nil];
    
}

-(void) headImageTap {
    ProfileViewController * profileVC = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
    profileVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:profileVC animated:YES];

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
    static NSString * tableIdentifier = @"identifier_personal";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    cell.textLabel.text  = [listData objectAtIndex: [indexPath row]];
    cell.imageView.image = [UIImage imageNamed:[images objectAtIndex:[indexPath row]]];
//    [cell.imageView setFrame:CGRectMake(0, 0, 20, 20)];
    
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


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (row == 0) {
        WorkManagementViewController * workManaementVc = [[WorkManagementViewController alloc] initWithNibName:@"WorkManagementViewController" bundle:nil];
        workManaementVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:workManaementVc animated:YES];

    } else if (row == 3) {
        BookFriendViewController * bookFriendVc = [[BookFriendViewController alloc] initWithNibName:@"BookFriendViewController" bundle:nil];
        bookFriendVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:bookFriendVc animated:YES];
    }else if (row == 1) {
        UploadBookViewController * uploadBookVc = [[UploadBookViewController alloc]initWithNibName:@"UploadBookViewController" bundle:nil];
        uploadBookVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:uploadBookVc animated:YES];
    }else if (row == 2) {
        MyCommentsViewController * myCommentsVc = [[MyCommentsViewController alloc]initWithNibName:@"MyCommentsViewController" bundle:nil];
        myCommentsVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myCommentsVc animated:YES];
    }else if (row == 4) {
        MessageCenterViewController * msgCenterVc = [[MessageCenterViewController alloc] initWithNibName:@"MessageCenterViewController" bundle:nil];
        msgCenterVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:msgCenterVc animated:YES];
    }
}

@end
