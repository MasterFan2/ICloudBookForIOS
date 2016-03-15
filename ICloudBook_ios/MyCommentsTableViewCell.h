//
//  MyCommentsTableViewCell.h
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/15.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCommentsTableViewCell : UITableViewCell {
    
    __weak IBOutlet UILabel *booknameLabel;
    __weak IBOutlet UILabel *contentLabel;
    __weak IBOutlet UILabel *dateLabel;
}

@end
