//
//  BookFriendTableViewCell.h
//  ICloudBook_ios
//
//  Created by MasterFan on 16/3/9.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookFriendTableViewCell : UITableViewCell {
    
    __weak IBOutlet UIImageView *headImageView;
    __weak IBOutlet UILabel *headNameLabel;
    __weak IBOutlet UILabel *ruleLabel;
    __weak IBOutlet UILabel *favoriteLabel;
    __weak IBOutlet UILabel *readLabel;
    __weak IBOutlet UILabel *commentLabel;
    __weak IBOutlet UILabel *descLabel;
    __weak IBOutlet UIButton *focusButton;
    __weak IBOutlet UIButton *chatButton;
}
- (IBAction)focus:(id)sender;
- (IBAction)chat:(id)sender;

@end
