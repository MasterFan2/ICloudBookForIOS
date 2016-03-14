//
//  UploadBookTableViewCell.h
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/14.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadBookTableViewCell : UITableViewCell {
    
    __weak IBOutlet UIImageView *headImageView;
    __weak IBOutlet UILabel *bookNameLabel;
    __weak IBOutlet UILabel *autherLabel;
    __weak IBOutlet UILabel *descriptionLabel;
    __weak IBOutlet UIButton *typeButton;
    __weak IBOutlet UILabel *verifyStatusLabel;
}

@end
