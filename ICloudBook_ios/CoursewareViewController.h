//
//  SecondViewController.h
//  ICloudBook_ios
//
//  Created by MasterFan on 16/2/27.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTFCollectionViewCell.h"//customer cell
#import <MJExtension.h>
#import <MJRefresh.h>

@interface CoursewareViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (retain, nonatomic) NSArray * listCourseware;

@end

