//
//  MJCSocialDemoVC10.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/9/6.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC10.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC10 ()

@end

@implementation MJCSoecialDemoVC10

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"地下城与勇士",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
    NSMutableArray *vcArr = [NSMutableArray array];
    for (int i = 0 ; i < titlesArr.count; i++) {//循环创建控制器对象
        MJCTestTableViewController *vc = [[MJCTestTableViewController alloc]init];
        vc.title = titlesArr[i];
        [vcArr addObject:vc];
    }
    [self setupBasicUIWithTitlesArr:titlesArr vcArr:vcArr];
}
    
-(void)setupBasicUIWithTitlesArr:(NSArray*)titlesArr vcArr:(NSArray*)vcArr
{
    
    NSArray *imageArr =@[@"bulb-2",@"cloud-2",@"diamond-2",@"food-2",@"heart-2",@"phone-2",@"phone"];
    NSArray *imageArr1 = @[@"bulb",@"cloud",@"diamond",@"food",@"heart",@"phone",@"phone"];
  MJCSegmentInterface *interFace =  [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
      jc_tools.
      jc_titleBarStyles(MJCTitlesScrollStyle).
      jc_titlesViewBackColor([UIColor blackColor]).
      jc_scaleLayoutEnabled(YES).
      jc_itemTextNormalColor([UIColor redColor]).
      jc_itemTextSelectedColor([UIColor blueColor]).
      jc_itemBackColorNormal([UIColor orangeColor]).
      jc_itemImageSize(CGSizeMake(20, 20)).
      jc_itemEdgeinsets(MJCItemEdgeInsetsMake(15, 15, 15, 15, 20)).
      jc_tabItemSizeToFitIsEnabled(YES, YES, YES).
      jc_itemTextZoomEnabled(YES, 20).
      jc_itemTextFontSize(13).
      jc_defaultItemShowCount(4).
      jc_childsContainerBackColor([UIColor purpleColor]).
      jc_itemSelectedSegmentIndex(0).
//      jc_itemImageNormal([UIImage imageNamed:@"bulb-2"]).
//      jc_itemImageSelected([UIImage imageNamed:@"bulb"]).
//      jc_itemBackImageArrayNormal(imageArr).
//      jc_itemBackImageArrayNormal(imageArr1).
      jc_itemImageArrayNormal(imageArr).
      jc_itemImageArraySelected(imageArr1);
    }];
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}


@end
