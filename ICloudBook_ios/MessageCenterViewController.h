//
//  MessageCenterViewController.h
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/15.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCenterViewController : UIViewController <UITableViewDataSource, UITabBarDelegate> {
    
    __weak IBOutlet UITableView *messageCenterTableView;
}

@end
