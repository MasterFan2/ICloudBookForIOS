//
//  SigninViewController.m
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/1.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import "SigninViewController.h"
#import <AFNetworking.h>
#import "Status.h"
#import "MXPullDownMenu.h"
#import "JFMinimalNotification.h"

//获取年级url
#define URL_GRADE @"http://116.255.235.119:1282/teachingAssistantInterface/userInfo/schoolGrade"

//获取班级url
#define URL_CLASSES @"http://116.255.235.119:1282/teachingAssistantInterface/userInfo/schoolGradeClasses?id=%@"

//登录url
#define URL_LOGIN @"http://116.255.235.119:1282/teachingAssistantInterface/userInfo/login"

@interface SigninViewController () <JFMinimalNotificationDelegate> {
    NSUserDefaults* localCache;
}
@property (nonatomic, strong) JFMinimalNotification* minimalNotification;
@end

@implementation SigninViewController
@synthesize progress;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //init cache
    if (!localCache) {
        localCache = [NSUserDefaults standardUserDefaults];
    }
    
    NSDictionary* dict = [localCache valueForKey:@"user"];
    if (dict) {//logined
        [[NSNotificationCenter defaultCenter]postNotificationName:@"goMain" object:nil];
        return;
    }
    
    //init minimal notification
    self.minimalNotification = [JFMinimalNotification notificationWithStyle:JFMinimalNotificationStyleSuccess title:@"登录" subTitle:@"登录成功" dismissalDelay:0.0 touchHandler:^{
        [self.minimalNotification dismiss];
    }];
    self.minimalNotification.delegate = self;
    
    [self.view addSubview:self.minimalNotification];
    
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

//
//
//
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
    menu.tag = 109;
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
    if (uname == nil || uname.length == 0) {
        [self.minimalNotification setTitle:@"提示您" andSubtitle:@"用户名不能为空"];
        [self.minimalNotification setStyle:JFMinimalNotificationStyleWarning animated:YES];
        [self.minimalNotification show];
        return;
    }
    
    //check password
    if (pwd == nil || pwd.length == 0) {
        [self.minimalNotification setTitle:@"提示您" andSubtitle:@"密码不能为空"];
        [self.minimalNotification setStyle:JFMinimalNotificationStyleWarning animated:YES];
        [self.minimalNotification show];
        return;
    }
    
    [progress show:YES];
    NSDictionary* parameters = [[NSDictionary alloc] initWithObjects:@[@1, uname, pwd] forKeys:@[@"classid", @"account", @"password"]];
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager GET:URL_LOGIN parameters:parameters progress:nil success:^(NSURLSessionDataTask *_Nullable task, id _Nullable responseObject){
        [progress hide:YES];

        //login status
        NSNumber* status = [responseObject valueForKey:@"code"];
        
        if (status.intValue == SUCCESS) {//登录成功
            
            //notification
            [self.minimalNotification setTitle:@"提示您" andSubtitle:@"登录成功"];
            [self.minimalNotification setStyle:JFMinimalNotificationStyleSuccess animated:YES];
            [self cacheLoginInfo:responseObject];
        }else if (status.intValue  == INCORRECT_UNAME_PWD) {
            [self.minimalNotification setTitle:@"提示您" andSubtitle:@"用户名或密码错误"];
            [self.minimalNotification setStyle:JFMinimalNotificationStyleWarning animated:YES];
            //notification
          
        }else if (status.intValue  == USER_DISABLE) {
            //notification
            [self.minimalNotification setStyle:JFMinimalNotificationStyleError animated:YES];
            [self.minimalNotification setTitle:@"提示您" andSubtitle:@"您的账号已被禁止使用"];
        }else {
            //notification
            [self.minimalNotification setStyle:JFMinimalNotificationStyleWarning animated:YES];
            [self.minimalNotification setTitle:@"提示您" andSubtitle:@"登录失败,请稍后再试"];
        }
        
        [self.minimalNotification show];//show tips
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError* _Nullable error) {
        NSLog(@"%@", error);//error
        
        //hide progressbar
        [progress hide:YES];
        
        //show tips
        [self.minimalNotification setStyle:JFMinimalNotificationStyleError animated:YES];
        [self.minimalNotification setTitle:@"提示您" andSubtitle:@"服务器错误,请联系管理员"];
        [self.minimalNotification show];//
    }];
    
}

//
//缓存登录信息到本地
//
-(void) cacheLoginInfo:(id)responseObject {
    if (responseObject) {
        
        
        NSString* token = [responseObject valueForKey:@"token"];
        NSMutableDictionary* user = [NSMutableDictionary dictionaryWithDictionary:[responseObject objectForKey:@"user"]];

        NSLog(@"%@", user);
        
        NSArray* keys = [user allKeys];
        for (NSString* key in keys) {
            id value = [user objectForKey:key];
            if ([value isKindOfClass:NSNull.class]) {
                [user setValue:@"-" forKey:key];
            }
        }
        
        NSLog(@"%@", user);
        
        [localCache setValue:token forKey:@"token"];
        [localCache setValue:user  forKey:@"user"];
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"goMain" object:nil];
    }
}

//
//内存不足
//
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
    NSLog(@"colum => %d -- row => %d", column, row);
}

@end
