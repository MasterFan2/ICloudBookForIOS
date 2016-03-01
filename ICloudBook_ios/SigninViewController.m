//
//  SigninViewController.m
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/1.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import "SigninViewController.h"

@interface SigninViewController ()

@end

@implementation SigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImageView * img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_upload_verify"]];
    [img setFrame:CGRectMake(0, 0, 50, 50)];
    [nameTextField setLeftView:img];
    [nameTextField setLeftViewMode:UITextFieldViewModeAlways];
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

@end
