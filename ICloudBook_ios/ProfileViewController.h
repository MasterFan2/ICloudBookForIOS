//
//  ProfileViewController.h
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/2.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate> {
    __weak IBOutlet UITableView *profileTable;
}

@property (nonatomic, retain) NSArray * dataList;

@end
