//
//  ModifyNicknameViewController.h
//  ICloudBook_ios
//
//  Created by MasterFan on 16/3/5.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModifyNicknameViewController : UIViewController {
    
    __weak IBOutlet UITextField *nicknameTextField;
}

- (IBAction)confirm:(id)sender;

@end
