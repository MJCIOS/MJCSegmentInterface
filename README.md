# MJC
☆☆☆ “MJCSegmentInterface分段控制器” ☆☆☆

分段控制器创建(几行代码即可使用)

    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    //添加标题栏
    NSArray *titlesArr = @[@"爱你",@"恨你",@"喜欢你",@"么么",@"哈哈"]; 

    /**
     * 所有属性的修改要将在这中间部分里面修改....
     */
    
    //将标题栏添加进去(这样就创建成功了)
    [segmentInterface addTitlesArray:titlesArr];
    [self.view addSubview:segmentInterface];
    
    //添加控制器
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    //在这之间传数据
    vc3.style = style;
    [segmentInterface setAddChildViewController:vc3];
    
分段控制器属性:
    
    //  1.右边竖线只用于SegMentInterfaceStyleClassic(right是否显示)
    //    segmentInterface.rightViewShow = YES;
    //  自定义right颜色
    //      segmentInterface.rightColor = [UIColor redColor];
    //  自定义right高度
    //      segmentInterface.rightViewHegiht = 10;
    
    /**
     * !!!:1.设置标题栏
     */
    //(2)是否开启用户自己设置标题Frame (默认是帮你设置好的,如果你开启了,那默认的就没有了)
    //        segmentInterface.isTitlesViewframe = YES;
    //(3)设置标题栏的frame(不开启isTitlesViewframe,那设置标题栏frame是没效果的)
    //        segmentInterface.titlesViewframe = CGRectMake(0, 0, 321, 40);
    //(4)为了方便用户,我还提供了一个方法(一行代码也是可以用户设置frame的,这句等于上面那两句)
    //        [segmentInterface isTitlesViewframe:YES titlesViewframe:CGRectMake(0,0, 321, 40)];
    //(5)设置标题栏的背景色(默认白色)
    //        segmentInterface.titlesViewColor = [[UIColor redColor]colorWithAlphaComponent:1];
    
    /**
     * !!!:2.底部横线设置
     */
    //    (1)底部横线条是否显示
    //        segmentInterface.bottomViewHidden = YES;
    //    (2)设置底部横线条高度
    //        segmentInterface.bottomViewHegiht = 100;
    //    (3)设置底部横线条颜色
              segmentInterface.bottomViewColor = [UIColor redColor];
    //    (4)设置底部横线条用户自行修改是否开启
    //        segmentInterface.isBottomViewFrame = YES;
    //    (5)设置底部横线条的frame
    //        segmentInterface.bottomViewFrame = CGRectMake(0, 0, 320, 100);
    //    (6)为了方便用户,我还提供了一个方法(一行代码也是可以用户设置frame的)
    //        [segmentInterface isBottomViewFrame:YES setBottomViewFrame:CGRectMake(0, 0, 320, 100)];
    
    /**
     * !!!:2.头部横线设置
     */
    //    (1)头部横线条是否显示
    //       segmentInterface.topViewHidden = YES;
    //    (2)设置头部横线条高度
    //       segmentInterface.topViewHegiht = 100;
    //    (3)设置头部横线条颜色
             segmentInterface.topViewColor = [UIColor purpleColor];
    //    (4)设置头部横线条用户自行修改是否开启
    //       segmentInterface.isTopViewFrame = YES;
    //    (5)设置头部横线条的frame
    //       segmentInterface.topViewFrame = CGRectMake(0, 0, 320, 100);
    //    (6)为了方便用户,我还提供了一个方法(一行代码也是可以用户设置frame的)
    //       [segmentInterface isTopViewFrame:YES setTopViewFrame:CGRectMake(0, 0, 320, 100)];
    
    /**
     * !!!:3.底部指示器设置
     */
    //(1)是否显示底部指示器
    //    segmentInterface.indicatorHidden = NO;
    //(1)设置底部指示器的颜色
          segmentInterface.indicatorColor = [UIColor purpleColor];
    //(2)设置底部指示器的宽度
    //    segmentInterface.indicatorWidth = 100;
    //(3)开启底部指示器用户设置位置
    //    segmentInterface.isindicatorFrame = YES;
    //(4)设置底部指示器的位置
    //    segmentInterface.indicatorFrame = CGRectMake(0, 0, 100, 30);
    //(5)为了方便用户,我还提供了一个方法(一行代码也是可以用户设置frame的)
    //    [segmentInterface isindicatorFrame:YES indicatorFrame:CGRectMake(0, 0, 100, 10)];
    
    /**
     * !!!:4.childView子界面
     */
    //      (1)允许子界面来回滑动
          segmentInterface.childViewEnabled = YES;
    //      (2)开启用户自己设置子界面frame(开启后,如果不设置,就会崩掉,就是提醒你,没设置frame)
    //    segmentInterface.isChildViewframe = YES;
    //      (3)设置子界面frame
    //    segmentInterface.childViewframe = CGRectMake(0, 0, 100, 100);
    //      (4)为了方便用户,我还提供了一个方法(一行代码也是可以用户设置frame的)
    //     [segmentInterface isChildViewframe:YES childViewframe:CGRectMake(0, 64, self.view.mjc_width, self.view.mjc_height)];
    
    /**
     * !!!:5.tabitem的设置
     */  
    //    (1)设置tabItem按钮的背景图片 (如果你不想用图片,想要用颜色,我也提供一个方法)
        segmentInterface.tabItemImageNormal = [MJCSegmentInterface imageWithColor:[UIColor orangeColor]];
    //    点击状态下的背景图片(如果你不想用图片,想要用颜色,我也提供一个方法)
        segmentInterface.tabItemImageSelected = [MJCSegmentInterface imageWithColor:[UIColor blueColor]];
    //    提供一个颜色Hex机制转成RGB机制的方法
        segmentInterface.tabItemBackColor = [MJCSegmentInterface colorFromHexRGB:@"f3f3f3"];
    //    (2)设置不同的tabitem的背景图片,(但要求,按钮有多少个,我们就应该有多少个,要不然会蹦,你后面也可以传字符串进去,那就无背景色)
        NSArray *imageArr = @[@"111",@"222",@"333",@"444",@"555",@"666",@"777"];
        segmentInterface.tabItemImageArray = imageArr;
    //    (3)tabItem的背景颜色
        segmentInterface.tabItemBackColor = [UIColor blackColor];
    //    (4)tabItem的文字普通状态颜色
        segmentInterface.tabItemTitleNormalColor = [UIColor redColor];
    //    (5)tabItem的文字点击状态下文字颜色
        segmentInterface.tabItemTitleSelectedColor = [UIColor purpleColor];
    //    (6)tabItem的文字大小
        segmentInterface.tabItemTitlesfont = [UIFont systemFontOfSize:30];
    //    (7)开启用户修改tabItem的位置
        segmentInterface.isTabItemFrame = YES;
        segmentInterface.tabItemFrame = CGRectMake(0, 10, 100, 55) ;
    //    (8)方便用户,一句代码搞定
        [segmentInterface isTabItemFrame:YES tabItemFrame:CGRectMake(0, 10, 100, 55)];


  
  
  
  ![image](https://github.com/MJCIOS/MJCSegmentInterface//master/MJCSegmentInterface/MJCSegmentInterface/MJCSegmentInterface/woyuanyi.jpg)
