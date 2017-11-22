//
//  MJCOtherAppDemo6.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/10/27.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCOtherAppDemo6.h"
#import "MJCPrefixHeader.pch"
#import "MJCCommontools.h"

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
    MJCSegmentInterface *interface = [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.
        jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_titlesViewFrame(CGRectMake(0, 0, self.view.jc_width, 50)).
        jc_titlesViewBackColor([UIColor yellowColor]).
        jc_indicatorHidden(YES).
        jc_childScollEnabled(YES).
        jc_itemImageEffectStyles(MJCImageUpDownStyle).
        jc_itemImageSize(CGSizeMake(20, 20)).
        jc_itemImagesEdgeInsets(UIEdgeInsetsMake(0, 0, 10, 0)).
        jc_itemTextsEdgeInsets(UIEdgeInsetsMake(0, 0, 3, 0)).
        jc_itemImageArrayNormal(imageNArr).
        jc_itemImageArraySelected(imageSArr).
        jc_ItemDefaultShowCount(5).
        jc_itemBackImageSelected([MJCCommontools jc_imageWithColor:[[UIColor orangeColor] colorWithAlphaComponent:0.7]]).
        jc_itemTextNormalColor([UIColor blackColor]).
        jc_itemTextFontSize(13).
        jc_childScollAnimalEnabled(YES);
    }];
    [self.view addSubview:interface];
    [interface intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}

@end
