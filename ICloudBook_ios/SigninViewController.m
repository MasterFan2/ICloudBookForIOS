//
//  SigninViewController.m
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/1.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import "SigninViewController.h"
#import <AFNetworking.h>

@interface SigninViewController ()

@end

@implementation SigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UIImageView * img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_upload_verify"]];
//    [img setFrame:CGRectMake(0, 0, 50, 50)];
//    [nameTextField setLeftView:img];
//    [nameTextField setLeftViewMode:UITextFieldViewModeAlways];
    self.title = @"登录";
    
    [signinButton addTarget:self action:@selector(signinClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void) signinClick {
    NSString* uname = nameTextField.text;
    NSString* pwd   = passwordTextField.text;
    
    //check user name
    if (uname == nil || [uname  isEqual: @" "]) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示您" message:@"用户名不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    //check password
    if (pwd == nil || [pwd  isEqual: @" "]) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示您" message:@"密码不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    
    
//    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController * indexViewController = [mainStoryboard instantiateInitialViewController];
//    [indexViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
//    
//    [self presentViewController:indexViewController animated:YES completion:^{
//        NSLog(@"登录成功");
//    }];
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
