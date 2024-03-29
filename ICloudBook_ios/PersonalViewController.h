//
//  PersonalViewController.h
//  ICloudBook_ios
//
//  Created by MasterFan on 16/2/28.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>

@interface PersonalViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    NSArray * images;
    NSArray * listData;
    __weak IBOutlet UIImageView *personalHeadImage;
    
}
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (weak, nonatomic) IBOutlet UITableView *personTable;
@property (strong, nonatomic) IBOutlet UIView *personHeaderView;

@property (retain, nonatomic) NSArray * images;
@property (retain, nonatomic) NSArray * listData;

@end
