//
//  MyCommentsViewController.h
//  ICloudBook_ios
//
//  Created by MasterFan on 16/3/9.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCommentsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    __weak IBOutlet UITableView *myCommentTableView;
}

@end
