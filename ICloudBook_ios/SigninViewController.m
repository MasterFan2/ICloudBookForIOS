//
//  SigninViewController.m
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/1.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import "SigninViewController.h"
#import <AFNetworking.h>
#import "GradeResp.h"
#import "MXPullDownMenu.h"

//获取年级
#define URL_GRADE @"http://116.255.235.119:1282/teachingAssistantInterface/userInfo/schoolGrade"

//获取班级
#define URL_CLASSES @"http://116.255.235.119:1282/teachingAssistantInterface/userInfo/schoolGradeClasses?id="

@interface SigninViewController ()

@end

@implementation SigninViewController
@synthesize progress;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UIImageView * img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_upload_verify"]];
//    [img setFrame:CGRectMake(0, 0, 50, 50)];
//    [nameTextField setLeftView:img];
//    [nameTextField setLeftViewMode:UITextFieldViewModeAlways];
    self.navigationItem.title = @"登录";
    
    //show progress
    self.progress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    // add button action
    [signinButton addTarget:self action:@selector(signinClick) forControlEvents:UIControlEventTouchUpInside];
    
    //
    [self getGradeList];
}

-(void) getGradeList {
    
    //
    progress.labelText = @"获取年级...";
    [progress show:YES];
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
    //获取年级
    [manager GET:URL_GRADE parameters:nil progress:nil success:^(NSURLSessionDataTask *_Nullable task, id _Nullable responseObject){
        gradeResp = responseObject;
        NSLog(@"%@", gradeResp);//success
        progress.labelText = @"获取班级...";
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError* _Nullable error) {
        NSLog(@"%@", error);//error
        [progress hide:YES];
    }];
}

-(void) getClassesList {
    
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
