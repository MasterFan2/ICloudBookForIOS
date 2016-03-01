//
//  SigninViewController.h
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/1.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SigninViewController : UIViewController
{

    __weak IBOutlet UISegmentedControl *chooseSegment;
    __weak IBOutlet UITextField *nameTextField;
    __weak IBOutlet UITextField *passwordTextField;
    __weak IBOutlet UIButton *signinButton;
}

@end
