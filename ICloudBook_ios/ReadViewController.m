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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _readCollectionView.dataSource = self;
    _readCollectionView.delegate   = self;
    [_readCollectionView registerNib:[UINib nibWithNibName:@"ReadCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"readCollectionIdentifier"];
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
    ReadCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"readCollectionIdentifier" forIndexPath:indexPath];
//    cell.collectionViewCellImg.image = [UIImage imageNamed:@"test"];
    [cell.collectionViewCellImg setImage:[UIImage imageNamed:@"test"]];
    cell.backgroundColor=[UIColor redColor];
    cell.collectionViewCellLabel.text= @"Michael Jackson";
    return cell;
}

-(CGSize) collectionView:(UICollectionView *) collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(96, 100);
}

@end
