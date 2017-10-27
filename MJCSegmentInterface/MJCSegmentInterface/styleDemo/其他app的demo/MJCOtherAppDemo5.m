//
//  MJCOtherAppDemo5.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/10/27.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCOtherAppDemo5.h"
#import "MJCPrefixHeader.pch"

@interface MJCOtherAppDemo5 ()

@end

@implementation MJCOtherAppDemo5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *titlesArr = @[@"关注动态",@"宝贝上新",@"视频直播",@"话题榜"];
    NSArray *itemImageNorArr = @[@"动态",@"宝贝",@"视频",@"话题"];
    NSArray *itemImageSelectArr = @[@"动态1",@"宝贝1",@"视频1",@"话题1"];
    
    MJCTestTableViewController *vc1 = [[MJCTestTableViewController alloc]init];
    MJCTestCollectVC *vc2 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    NSMutableArray  *vcarrr = [NSMutableArray arrayWithObjects:vc1,vc2,vc3, nil];
    NSInteger vcCount = titlesArr.count-vcarrr.count;
    for (int i = 0 ; i < vcCount ; i++) {
        MJCTestViewController *vc = [[MJCTestViewController alloc]init];;
        [vcarrr addObject:vc];//将元素添加到数组末尾
    }
    for (int i = 0 ; i < titlesArr.count; i++) {
        UIViewController *vc =vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    [self setupSegmentWithTitlesArr:titlesArr vcArr:vcarrr imageNArr:itemImageNorArr imageSArr:itemImageSelectArr];

}

-(void)setupSegmentWithTitlesArr:(NSArray *)titlesArr vcArr:(NSArray *)vcArr imageNArr:(NSArray *)imageNArr imageSArr:(NSArray*)imageSArr
{
    
    MJCSegmentInterface *interFace = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesClassicStyle];
    interFace.titlesViewFrame = CGRectMake(0, 0, interFace.jc_width, 50);
    interFace.titlesViewBackColor = [UIColor whiteColor];
    interFace.isIndicatorsAnimals  = YES;
    interFace.imageEffectStyles = MJCImageUpDownStyle;
    interFace.itemImageSize = CGSizeMake(20, 20);
    interFace.itemImagesEdgeInsets = UIEdgeInsetsMake(0, 0, 10, 0);
    interFace.itemTextsEdgeInsets = UIEdgeInsetsMake(0, 0, 3, 0);
    interFace.itemImageNormalArray = imageNArr;
    interFace.itemImageSelectedArray = imageSArr;
    interFace.itemTextSelectedColor = [UIColor orangeColor];
    interFace.itemTextNormalColor = [UIColor blackColor];
    interFace.indicatorColor = [UIColor orangeColor];
    interFace.indicatorStyles = MJCIndicatorItemStyle;
    interFace.itemTextFontSize = 13;
    interFace.indicatorColor = [UIColor redColor];
    interFace.isIndicatorFollow = YES;
    interFace.isChildScollAnimal = YES;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}



@end
