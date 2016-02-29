//
//  FirstViewController.h
//  ICloudBook_ios
//
//  Created by MasterFan on 16/2/27.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTFCollectionViewCell.h"

@interface ReadViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UINavigationBar *myNavigator;

@property (retain, nonatomic) NSArray * listBook;

@end

