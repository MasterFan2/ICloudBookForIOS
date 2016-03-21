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

@interface SigninViewController : UIViewController
{
    __weak IBOutlet UITextField *nameTextField;
    __weak IBOutlet UITextField *passwordTextField;
    __weak IBOutlet UIButton    *signinButton;
    GradeResp * gradeResp;
}

@property (nonatomic, retain) MBProgressHUD * progress;

@end
