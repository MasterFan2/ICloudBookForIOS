//
//  ModifyNicknameViewController.m
//  ICloudBook_ios
//
//  Created by MasterFan on 16/3/5.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import "ModifyNicknameViewController.h"

@interface ModifyNicknameViewController ()

@end

@implementation ModifyNicknameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)confirm:(id)sender {
    NSString * nickname = nicknameTextField.text;
    if (nickname != nil && [nickname compare:@""] != NSOrderedSame) {
        NSDictionary * data = [[NSDictionary alloc] initWithObjectsAndKeys:nickname, @"username", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"registerCompletionNotification" object:nil userInfo:data];
//        [self.navigationController popToRootViewControllerAnimated:YES];
        [self.navigationController popViewControllerAnimated:YES];

    }else {
        NSLog(@"data is null");
    }
    
}
@end
