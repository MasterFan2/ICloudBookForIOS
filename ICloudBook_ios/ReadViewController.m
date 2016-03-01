//
//  FirstViewController.m
//  ICloudBook_ios
//
//  Created by MasterFan on 16/2/27.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import "ReadViewController.h"

@interface ReadViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *readCollectionView;

@end

@implementation ReadViewController
@synthesize listBook;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _readCollectionView.dataSource = self;
    _readCollectionView.delegate   = self;
    
//    _readCollectionView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
    _readCollectionView.mj_header    = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"start refresh");
    }];
    
    [_readCollectionView registerNib:[UINib nibWithNibName:@"MTFCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"readCollectionIdentifier"];
//    [_myNavigator setBackgroundColor:[UIColor greenColor]];
    listBook = [NSArray arrayWithObjects:@"老人与海", @"西游记", @"红楼梦", @"三国杀", @"时间简史", @"人工智能", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma collectionView Dalegate & dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [listBook count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MTFCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"readCollectionIdentifier" forIndexPath:indexPath];
//    cell.collectionViewCellImg.image = [UIImage imageNamed:@"test"];
    [cell.collectionViewCellImg setImage:[UIImage imageNamed:@"test_book"]];
    cell.collectionViewCellLabel.text= [listBook objectAtIndex:[indexPath row]];
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
