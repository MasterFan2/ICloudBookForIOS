//
//  ProfileViewController.h
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/2.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
    __weak IBOutlet UITableView *profileTable;
}

@property (nonatomic, retain) NSMutableArray * dataList;
@property (assign, nonatomic) NSInteger clickLine;

@property (nonatomic, retain) NSMutableDictionary * classes;

@end
