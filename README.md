# MJC
##☆☆☆ “MJCSegmentInterface分段控制器” ☆☆☆

###分段控制器创建(几行代码即可使用)

    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    NSArray *titlesArr = @[@"爱你",@"恨你",@"喜欢你",@"么么",@"哈哈"]; //创建标题
    
    /**
     * 所有属性的修改要将在这中间部分里面修改....(不添加都有默认属性)
     */
     
    //添加标题栏(这样就创建成功了)
    [segmentInterface addTitlesArray:titlesArr];
    [self.view addSubview:segmentInterface];
    
    //添加控制器
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    //在这之间传数据
    vc3.style = style;
    [segmentInterface setAddChildViewController:vc3];
    
    
###分段控制器属性用法:(要在添加标题栏之前自定义这些属性)

    segmentInterface.rightViewShow = YES;
    segmentInterface.rightViewHidden = YES;()
    
    segmentInterface.rightColor = [UIColor redColor];
    segmentInterface.rightViewHegiht = 10;
    [segmentInterface isTitlesViewframe:YES titlesViewframe:CGRectMake(0,0, 321, 40)];//自定义位置大小尺寸 
    segmentInterface.tabItemImageNormal = [MJCSegmentInterface imageWithColor:[UIColor orangeColor]];//(1)(如果你不想用图片,想要用颜色,我也提供一个方法)
    segmentInterface.tabItemImageNormal = [UIImage imageNamed:@"111"];//设置tabItem图片
    
    NSArray *imageArr = @[@"111",@"222",@"333",@"444",@"555",@"666",@"777"];//设置tabitem多张图片
    segmentInterface.tabItemImageArray = imageArr;


###分段控制器属性列表:(所有的属性展示)
    
####右边竖线属性:
    
    rightViewShow(只用于这两种SegMentInterfaceStyleClassic,SegMentInterfaceStylePenetrate)
    rightColor
    rightViewHegiht
    rightViewHidden(只用于这两种SegMentInterfaceStyleLess,SegMentInterfaceStyleMoreUse)
    
#####标题栏属性:
    
    isTitlesViewframe(是否开启设置frame)
    titlesViewframe(设置frame)
    isTitlesViewframe:BOOL titlesViewframe:CGRect (等于上面两句)
    titlesViewColor
    
#####底部横线设置:
     
    bottomViewHidden
    bottomViewHegiht
    bottomViewColor
    isBottomViewFrame(是否开启设置frame)
    bottomViewFrame(设置frame)
    isBottomViewFrame:BOOL setBottomViewFrame:CGRect
    
#####头部横线设置
    
    topViewHidden
    topViewHegiht
    topViewColor
    isTopViewFrame(是否开启设置frame)
    topViewFrame(设置frame)
    isTopViewFrame:BOOL setTopViewFrame:CGRect
    
#####底部指示器设置
    
    indicatorHidden
    indicatorColor
    indicatorWidth
    isindicatorFrame(是否开启设置frame)
    indicatorFrame(设置frame)
    isindicatorFrame:BOOL indicatorFrame:CGRect
    
#####childView子界面
    
    childViewEnabled
    isChildViewframe(是否开启设置frame)
    childViewframe(设置frame)
    isChildViewframe:BOOL childViewframe:CGRect
    
#####tabitem的设置
    
    tabItemImageNormal
    tabItemImageSelected
    tabItemBackColor
    tabItemImageArray
    tabItemBackColor
    tabItemTitleNormalColor
    tabItemTitleSelectedColor
    tabItemTitlesfont
    isTabItemFrame(是否开启设置frame)
    tabItemFrame(设置frame)
    isTabItemFrame:BOOL tabItemFrame:CGRect

       

  ![image](https://github.com/MJCIOS/MJCSegmentInterface//master/MJCSegmentInterface/MJCSegmentInterface/MJCSegmentInterface/woyuanyi.jpg)
