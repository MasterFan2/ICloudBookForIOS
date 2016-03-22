//
//  SigninViewController.h
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/1.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>
#import "GradeResp.h"
#import "MXPullDownMenu.h"

@interface SigninViewController : UIViewController <MXPullDownMenuDelegate> {
    
    __weak IBOutlet UITextField *nameTextField;
    __weak IBOutlet UITextField *passwordTextField;
    __weak IBOutlet UIButton    *signinButton;
    
    NSMutableArray* menuData; //下拉菜单数据
    
    NSInteger chooseGradeId  ;//选择的年级
    NSInteger chooseClassesid;//选择的班级
}

@property (nonatomic, retain) MBProgressHUD * progress;

@end
