//
//  MJCSoecialDemoVC12.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/10/10.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC12.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC12 ()

@end

@implementation MJCSoecialDemoVC12

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
    MJCSegmentInterface *interFace = [[MJCSegmentInterface alloc]init];
    interFace.titleBarStyles = MJCTitlesScrollStyle;
    //    interFace.scaleLayoutEnabled = YES;
    interFace.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    interFace.itemTextSelectedColor = [UIColor blueColor];
    interFace.itemTextNormalColor = [UIColor redColor];
    interFace.itemMaxEdgeinsets = MJCEdgeInsetsMake(15,15,15,15,15);
    [interFace tabItemSizeToFitIsEnabled:YES heightToFitIsEnabled:YES widthToFitIsEnabled:YES];
    [interFace tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:17];
    interFace.itemTextFontSize = 15;
    interFace.childsContainerBackColor = [UIColor purpleColor];
    interFace.selectedSegmentIndex = 0;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
}


@end
