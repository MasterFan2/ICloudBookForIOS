//
//  ModifyPwdViewController.h
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/7.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModifyPwdViewController : UIViewController {
    
    __weak IBOutlet UITextField *oldPwdTextField;
    __weak IBOutlet UITextField *newPwdTextField;
    __weak IBOutlet UITextField *comfirmPwdTextField;
    __weak IBOutlet UIButton *comfirnButton;
}
- (IBAction)comfirmBtnClick:(id)sender;
@end
