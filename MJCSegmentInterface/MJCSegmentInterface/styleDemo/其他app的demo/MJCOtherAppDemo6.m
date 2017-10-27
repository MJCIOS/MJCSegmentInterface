//
//  MJCOtherAppDemo6.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/10/27.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCOtherAppDemo6.h"
#import "MJCPrefixHeader.pch"
#import "MJCCommonTools.h"

@interface MJCOtherAppDemo6 ()

@end

@implementation MJCOtherAppDemo6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *duowanPathStr =  [[NSBundle mainBundle] pathForResource:@"taobao" ofType:@"plist"];
    NSDictionary *dataDic =  [NSDictionary dictionaryWithContentsOfFile:duowanPathStr];
    NSArray *titlesArr = dataDic[@"titiles"];
    NSArray *itemImageNorArr = dataDic[@"imageNormal"];
    NSArray *itemImageSelectArr = dataDic[@"imageSelected"];
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
    MJCSegmentInterface *interFace = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle];
    interFace.titlesViewFrame = CGRectMake(0, 0, interFace.jc_width, 50);
    interFace.titlesViewBackColor = [UIColor yellowColor];
    interFace.indicatorHidden = YES;
    interFace.imageEffectStyles = MJCImageUpDownStyle;
    interFace.itemImageSize = CGSizeMake(20, 20);
    interFace.itemImagesEdgeInsets = UIEdgeInsetsMake(0, 0, 10, 0);
    interFace.itemTextsEdgeInsets = UIEdgeInsetsMake(0, 0, 3, 0);
    interFace.itemImageNormalArray = imageNArr;
    interFace.itemImageSelectedArray = imageSArr;
    interFace.defaultShowItemCount = 5;
    interFace.itemBackSelectedImage = [MJCCommonTools jc_imageWithColor:[[UIColor orangeColor] colorWithAlphaComponent:0.7]];
    interFace.itemTextNormalColor = [UIColor blackColor];
    interFace.itemTextFontSize = 13;
    interFace.isChildScollAnimal = YES;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}

@end
