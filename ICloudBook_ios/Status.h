//
//  Status.h
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/23.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#ifndef Status_h
#define Status_h

enum {
    //操作成功
    SUCCESS = 200,
    
    //用户名或密码错误
    INCORRECT_UNAME_PWD = 400,
    
    //用户被禁用
    USER_DISABLE = 401
} LOGIN;



#endif /* Status_h */
