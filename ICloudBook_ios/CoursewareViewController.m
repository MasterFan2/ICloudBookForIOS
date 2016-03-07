//
//  SecondViewController.m
//  ICloudBook_ios
//
//  Created by MasterFan on 16/2/27.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import "CoursewareViewController.h"

@interface CoursewareViewController ()

@end

@implementation CoursewareViewController
@synthesize listCourseware;

- (void)viewDidLoad {
    [super viewDidLoad];
    
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:40 green:169 blue:97 alpha:1];
    
    // Do any additional setup after loading the view, typically from a nib.
    [_collectionView registerNib:[UINib nibWithNibName:@"MTFCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"readCollectionIdentifier"];
    
    //add refresh
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NSThread sleepForTimeInterval:2.5];
        [_collectionView.mj_header endRefreshing];
    }];
    
    //set navigationBar background
//    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];

    listCourseware = [NSArray arrayWithObjects:@"三角函数一章", @"函数概念", @"初三地理知识", @"三角函数二章", @"速查字典", @"课外活动", nil];
    self.navigationController.title = @"aaaaa";
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma collectionView Dalegate & dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    //    cell.collectionViewCellImg.image = [UIImage imageNamed:@"test"];
    MTFCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"readCollectionIdentifier" forIndexPath:indexPath];
    //    cell.collectionViewCellImg.image = [UIImage imageNamed:@"test"];
    [cell.collectionViewCellImg setImage:[UIImage imageNamed:@"test_book"]];
    cell.collectionViewCellLabel.text= [listCourseware objectAtIndex:[indexPath row]];
    return cell;
}


///指定cell宽、高
-(CGSize) collectionView:(UICollectionView *) collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(90, 120);
}

///返回这个UICollectionViewCell是否可以被选择
-( BOOL )collectionView:( UICollectionView *)collectionView shouldSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    return YES ;
}

//UICollectionView被选中时调用的方法
-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    UICollectionViewCell * cell = ( UICollectionViewCell *)[collectionView cellForItemAtIndexPath :indexPath];
    cell. backgroundColor = [ UIColor colorWithRed :(( arc4random ()% 255 )/ 255.0 ) green :(( arc4random ()% 255 )/ 255.0 ) blue :(( arc4random ()% 255 )/ 255.0 ) alpha : 1.0f ];
}

@end
