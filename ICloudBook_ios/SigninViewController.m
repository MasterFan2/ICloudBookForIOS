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
#import "Grade.h"
#import "MXPullDownMenu.h"

//获取年级url
#define URL_GRADE @"http://116.255.235.119:1282/teachingAssistantInterface/userInfo/schoolGrade"

//获取班级url
#define URL_CLASSES @"http://116.255.235.119:1282/teachingAssistantInterface/userInfo/schoolGradeClasses?id=%@"

//登录
#define URL_LOGIN @"http://116.255.235.119:1282/teachingAssistantInterface/userInfo/login"

@interface SigninViewController ()

@end

@implementation SigninViewController
@synthesize progress;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //show progress
    self.progress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    // add button action
    [signinButton addTarget:self action:@selector(signinClick) forControlEvents:UIControlEventTouchUpInside];
    
    menuData = [[NSMutableArray alloc] init];
    
    //获取年级数据
    [self getGradeList];
}

//
//获取年级列表
//
-(void) getGradeList {
    //
    progress.labelText = @"获取年级...";
    [progress show:YES];
    
    //获取年级
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager GET:URL_GRADE parameters:nil progress:nil success:^(NSURLSessionDataTask *_Nullable task, id _Nullable responseObject){
        NSArray* arr = [responseObject valueForKeyPath:@"grades"];
        NSMutableArray* gradeNameList = [[NSMutableArray alloc] init];
        
        for (NSDictionary* temp in arr) {
            [gradeNameList addObject:temp[@"name"]];
        }
        
        //添加下拉菜单的数据
        [menuData addObject:gradeNameList];
        progress.labelText = @"获取班级...";
        [self getClassesList];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError* _Nullable error) {
        NSLog(@"%@", error);//error this
        [progress hide:YES];
    }];
}

-(void) none:(NSString* ) reason {
    NSLog(@"%@", reason);
}

//
//获取班级列表数据
//
-(void) getClassesList {
    NSString* url = [NSString stringWithFormat:URL_CLASSES, @"1"];
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask *_Nullable task, id _Nullable responseObject){
        NSArray* tempArr = [responseObject valueForKeyPath:@"classes"];
        NSMutableArray* classesNameList = [[NSMutableArray alloc]init];
        for (NSDictionary* dict in tempArr) {
            [classesNameList addObject:dict[@"name"]];
        }
        [progress hide:YES];
        
        //添加下拉菜单的数据
        [menuData addObject:classesNameList];
        
        [self addDownMenu:menuData];
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError* _Nullable error) {
        NSLog(@"%@", error);//error
        [progress hide:YES];
    }];
}

//
//添加下拉菜单
//
-(void) addDownMenu:(NSArray*) arrData {
    //添加下拉控件
    CGRect nameFrame = nameTextField.frame;
    MXPullDownMenu *menu = [[MXPullDownMenu alloc] initWithArray:arrData selectedColor:[UIColor greenColor]];
    menu.delegate = self;
    menu.frame = CGRectMake(0, nameFrame.origin.y - 60, menu.frame.size.width, menu.frame.size.height);
    [self.view addSubview:menu];
}

//
//登录按钮点击事件
//
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
    
    
    NSDictionary* parameters = [[NSDictionary alloc] initWithObjects:@[@1, uname, pwd] forKeys:@[@"classid", @"account", @"password"]];
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager GET:URL_LOGIN parameters:parameters progress:nil success:^(NSURLSessionDataTask *_Nullable task, id _Nullable responseObject){

        NSLog(@"登录结果%@", responseObject);
        
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError* _Nullable error) {
        NSLog(@"%@", error);//error
        [progress hide:YES];
    }];
    
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

#pragma mark - DownMenu delegate
- (void)PullDownMenu:(MXPullDownMenu *)pullDownMenu didSelectRowAtColumn:(NSInteger)column row:(NSInteger)row {
    NSLog(@"%d -- %d", column, row);
}

@end
