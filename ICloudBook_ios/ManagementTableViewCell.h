//
//  ManagementTableViewCell.h
//  ICloudBook_ios
//
//  Created by MasterFan on 16/3/9.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagementTableViewCell : UITableViewCell {
    
    __weak IBOutlet UIImageView *headImage;
    __weak IBOutlet UIView *rootView;
    __weak IBOutlet UILabel *bookNameLabel;
    __weak IBOutlet UILabel *autherLabel;
    __weak IBOutlet UILabel *readedLabel;
    __weak IBOutlet UILabel *nearReadDateLabel;
    __weak IBOutlet UILabel *readNumLabel;
    __weak IBOutlet UILabel *downloadedLabel;
    __weak IBOutlet UILabel *commentLabel;
    __weak IBOutlet UILabel *favoriteLabel;
}


@end
