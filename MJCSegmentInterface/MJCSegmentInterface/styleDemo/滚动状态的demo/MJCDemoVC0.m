//
//  MJCDemoVC1.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC0.h"
#import "MJCPrefixHeader.pch"


@interface MJCDemoVC0 ()<MJCSegmentDelegate>

@property (nonatomic,strong) NSArray *mainArr;

@end

@implementation MJCDemoVC0

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"天涯明月刀月刀月刀月刀天涯"];
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc4,vc3,vc5,vc6,vc7];
//    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
//        UIViewController *vc = vcarrr[i];
//        vc.title = titlesArr[i];
//    }
    
    
    //以下是我的控件中的代码
    MJCSegmentInterface *interFace = [[MJCSegmentInterface alloc]init];
    interFace.titleBarStyles = MJCTitlesScrollStyle;
    interFace.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    interFace.delegate= self;
    interFace.titlesViewBackColor = [UIColor redColor];
    interFace.itemBackColor = [UIColor purpleColor];
    interFace.itemTextSelectedColor = [UIColor whiteColor];
    interFace.itemTextNormalColor = [UIColor redColor];
    interFace.itemTextFontSize = 11;
    interFace.defaultShowItemCount = 5;
    interFace.isChildScollAnimal = YES;
    [interFace tabItemSizeToFitIsEnabled:YES heightToFitIsEnabled:NO widthToFitIsEnabled:YES];
    interFace.itemMaxEdgeinsets = MJCEdgeInsetsMake(0, 20, 0, 20, 90);
    interFace.childsContainerBackColor = [UIColor purpleColor];
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr hostController:self];
    [interFace intoChildControllerArray:vcarrr];
    
}

-(void)dealloc
{
    NSLog(@"%@销毁",self);
}

@end
