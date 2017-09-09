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
    
    //以下是我的控件中的代码
    MJCSegmentInterface *interFace = [[MJCSegmentInterface alloc]init];
    interFace.titleBarStyles = MJCTitlesScrollStyle;
    interFace.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    interFace.itemTextSelectedColor = [UIColor blueColor];
    interFace.itemTextNormalColor = [UIColor redColor];
    interFace.itemBackColor = [UIColor purpleColor];
    interFace.itemMaxEdgeinsets = MJCEdgeInsetsMake(5,5,5,5,5);
    [interFace tabItemSizeToFitIsEnabled:YES heightToFitIsEnabled:YES widthToFitIsEnabled:YES];
    [interFace tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:23];
    interFace.itemTextFontSize = 11;
    interFace.defaultShowItemCount = 4;
    interFace.childsContainerBackColor = [UIColor purpleColor];
    interFace.selectedSegmentIndex = 2;
    interFace.itemImageNormalArray  = imageArr ;
    interFace.itemImageSelectedArray  = imageArr1;
    [interFace intoTitlesArray:titlesArr hostController:self];
    [self.view addSubview:interFace];
    [interFace intoChildControllerArray:vcArr];
    
}


@end
