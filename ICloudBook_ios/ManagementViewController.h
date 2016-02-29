//
//  ManagementViewController.h
//  ICloudBook_ios
//
//  Created by MasterFan on 16/2/28.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagementViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (retain, nonatomic) NSArray * images;
@property (retain, nonatomic) NSArray * listData;

@end
