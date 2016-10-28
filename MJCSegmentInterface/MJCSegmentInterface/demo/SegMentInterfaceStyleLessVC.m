//
//  SegMentInterfaceStyleLess.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/27.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "SegMentInterfaceStyleLessVC.h"
#import "MJCSegmentInterface.h"
#import "UITestViewController.h"
#import "UITestViewController1.h"
#import "UITestViewController2.h"
#import "UITestViewController3.h"
#import "UITestViewController4.h"


@interface SegMentInterfaceStyleLessVC ()

@end

@implementation SegMentInterfaceStyleLessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 0;
    
    self.view.backgroundColor = [UIColor redColor];
    
    //有导航栏或者tabbar时,保证标题栏不会被覆盖
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor redColor];


    
    
    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    //创建标题栏
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪"];
    //经典样式(如果你什么都不自定义设置,只需几句代码,帮你创建了经典样式的标题栏)
    [segmentInterface setSegmentInterFaceStyle:SegMentInterfaceStyleLess];
    
    
    /**
     * 以下属性都能用在SegMentInterfaceStyleLess样式中,看你自己怎么设置了
     */
    
    //设置底部指示器的样式(有默认样式,可以不用设置)
    [segmentInterface setSegmentIndicatorStyle:SegMentIndicatorItemStyle];
    //    [self.segMentInterface setSegmentIndicatorStyle:SegMentIndicatorItemTextStyle];

    
    
    
    // !!!:1.右边竖线只用于SegMentInterfaceStyleClassic(right是否显示)
//    segmentInterface.rightViewHidden = YES;
    //自定义right颜色
//    segmentInterface.rightColor = [UIColor redColor];
    //自定义right高度
//    segmentInterface.rightViewHegiht = 10;
    
    
    
    /**
     * !!!:1.设置标题栏
     */
    //(2)是否开启用户自己设置标题Frame (默认是帮你设置好的,如果你开启了,那默认的就没有了)
    //        self.segMentInterface.isTitlesViewframe = YES;
    //(3)设置标题栏的frame(不开启isTitlesViewframe,那设置标题栏frame是没效果的)
    //        self.segMentInterface.titlesViewframe = CGRectMake(0, 0, 321, 40);
    //(4)为了方便用户,我还提供了一个方法(一行代码也是可以用户设置frame的,这句等于上面那两句)
    //        [self.segMentInterface isTitlesViewframe:YES titlesViewframe:CGRectMake(0,0, 321, 40)];
    //(5)设置标题栏的背景色(默认白色)
    //        self.segMentInterface.titlesViewColor = [[UIColor redColor]colorWithAlphaComponent:1];
    
    
    /**
     * !!!:2.底部横线设置
     */
    //    (1)底部横线条是否显示
    //        self.segMentInterface.bottomViewHidden = YES;
    //    (2)设置底部横线条高度
    //        self.segMentInterface.bottomViewHegiht = 100;
    //    (3)设置底部横线条颜色
    segmentInterface.bottomViewColor = [UIColor redColor];
    //    (4)设置底部横线条用户自行修改是否开启
    //        self.segMentInterface.isBottomViewFrame = YES;
    //    (5)设置底部横线条的frame
    //        self.segMentInterface.bottomViewFrame = CGRectMake(0, 0, 320, 100);
    //    (6)为了方便用户,我还提供了一个方法(一行代码也是可以用户设置frame的)
    //        [self.segMentInterface isBottomViewFrame:YES setBottomViewFrame:CGRectMake(0, 0, 320, 100)];
    
    
    /**
     * !!!:2.头部横线设置
     */
    //    (1)头部横线条是否显示
    //            self.segMentInterface.topViewHidden = YES;
    //    (2)设置头部横线条高度
    //            self.segMentInterface.topViewHegiht = 100;
    //    (3)设置头部横线条颜色
    segmentInterface.topViewColor = [UIColor purpleColor];
    //    (4)设置头部横线条用户自行修改是否开启
    //        self.segMentInterface.isTopViewFrame = YES;
    //    (5)设置头部横线条的frame
    //        self.segMentInterface.topViewFrame = CGRectMake(0, 0, 320, 100);
    //    (6)为了方便用户,我还提供了一个方法(一行代码也是可以用户设置frame的)
    //            [self.segMentInterface isTopViewFrame:YES setTopViewFrame:CGRectMake(0, 0, 320, 100)];
    
    
    
    
    /**
     * !!!:3.底部指示器设置
     */
    //(1)是否显示底部指示器
    //        self.segMentInterface.indicatorHidden = NO;
    //(1)设置底部指示器的颜色
    segmentInterface.indicatorColor = [UIColor purpleColor];
    //(2)设置底部指示器的宽度
    //    self.segMentInterface.indicatorWidth = 100;
    //(3)开启底部指示器用户设置位置
    //    self.segMentInterface.isindicatorFrame = YES;
    //(4)设置底部指示器的位置
    //    self.segMentInterface.indicatorFrame = CGRectMake(0, 0, 100, 30);
    //(5)为了方便用户,我还提供了一个方法(一行代码也是可以用户设置frame的)
    //    [self.segMentInterface isindicatorFrame:YES indicatorFrame:CGRectMake(0, 0, 100, 10)];
    
    
    
    /**
     * !!!:4.childView子界面
     */
    //允许子界面来回滑动
    segmentInterface.childViewEnabled = YES;
    //开启用户自己设置子界面frame(开启后,如果不设置,就会崩掉,就是提醒你,没设置frame)
    //        self.segMentInterface.isChildViewframe = YES;
    //设置子界面frame
    //        self.segMentInterface.childViewframe = CGRectMake(0, 0, 100, 100);
    //为了方便用户,我还提供了一个方法(一行代码也是可以用户设置frame的)
    //        [self.segMentInterface isChildViewframe:YES childViewframe:CGRectMake(0, 64, self.view.mjc_width, self.view.mjc_height)];
    
    
    /**
     * !!!:5.tabitem的设置
     */
    
    //(1)设置tabItem按钮的背景图片 (如果你不想用图片,想要用颜色,我也提供一个方法)
        segmentInterface.tabItemImageNormal = [MJCSegmentInterface imageWithColor:[UIColor orangeColor]];
    //点击状态下的背景图片(如果你不想用图片,想要用颜色,我也提供一个方法)
        segmentInterface.tabItemImageSelected = [MJCSegmentInterface imageWithColor:[UIColor redColor]];
    //提供一个颜色Hex机制转成RGB机制的方法
    segmentInterface.tabItemBackColor = [MJCSegmentInterface colorFromHexRGB:@"f3f3f3"];
    
    //(2)设置不同的tabitem的背景图片,(但要求,按钮有多少个,我们就应该有多少个,要不然会蹦,你后面也可以传字符串进去,那就无背景色)
    //    NSArray *imageArr = @[@"lalala",@"lalala1",@"lalala2",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
    //    self.segMentInterface.tabItemImageArray = imageArr;
    //(3)tabItem的背景颜色
    //    self.segMentInterface.tabItemBackColor = [UIColor blackColor];
    //(4)tabItem的文字普通状态颜色
    //    self.segMentInterface.tabItemTitleNormalColor = [UIColor redColor];
    //(5)tabItem的文字点击状态下文字颜色
    //    self.segMentInterface.tabItemTitleSelectedColor = [UIColor purpleColor];
    //(6)tabItem的文字大小
    //        self.segMentInterface.tabItemTitlesfont = [UIFont systemFontOfSize:30];
    //(7)开启用户修改tabItem的位置
    //        self.segMentInterface.isTabItemFrame = YES;
    //        self.segMentInterface.tabItemFrame = CGRectMake(0, 10, 100, 55) ;
    //(8)方便用户,一句代码搞定
    //        [self.segMentInterface isTabItemFrame:YES tabItemFrame:CGRectMake(0, 10, 100, 55)];
    
    
    
    
    
    
    //在添加标题栏之前做其他操作
    [segmentInterface addTitlesArray:titlesArr];
    [self.view addSubview:segmentInterface];
    
    
    /**
     * 添加控制器
     */
    UITestViewController *vc = [[UITestViewController alloc]init];
    //传数据在这之间传
    
    [segmentInterface setAddChildViewController:vc];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    [segmentInterface setAddChildViewController:vc1];
    
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    [segmentInterface setAddChildViewController:vc2];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    vc3.style = style;
    [segmentInterface setAddChildViewController:vc3];
    
    
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    [segmentInterface setAddChildViewController:vc4];

    
    
    

}




@end
