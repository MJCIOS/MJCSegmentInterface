//
//  MJCTestCollectVC.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/8/4.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCTestCollectVC.h"
#import "MJCOrdinaryLayout.h"

@interface MJCTestCollectVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) NSArray *mainArr;
@end

@implementation MJCTestCollectVC
-(void)loadView
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"collectionData" ofType:@"plist"];
    _mainArr = [NSArray arrayWithContentsOfFile:path];
    MJCOrdinaryLayout *layout = [[MJCOrdinaryLayout alloc]init];
    layout.vlitemLineMaxCount = 2;
    layout.vlitemHegight = 200;
    layout.vlitemMaxLeftMargin = 10;
    layout.vlitemMaxRightMargin = 10;
    layout.vlitemLineMargin = 10;
    layout.vlitemRowMargin = 10;
    layout.vlitemMaxBottomMargin = 10;
    layout.vlitemMaxTopMargin = 10;
    self.collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    NSInteger tag  = arc4random() % 9;
    self.collectionView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"back%ld",tag]]];
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _mainArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const MJCCellID = @"cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MJCCellID forIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_mainArr[indexPath.row]]];
    return cell;
}


@end
