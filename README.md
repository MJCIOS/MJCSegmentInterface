# MJC
☆☆☆ “MJCSegmentInterface分段控制器” ☆☆☆

分段控制器创建(几行代码即可使用)

    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    //添加标题栏
    NSArray *titlesArr = @[@"爱你",@"恨你",@"喜欢你",@"么么",@"哈哈"]; 

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
    
分段控制器属性用法:(要在添加标题栏之前自定义这些属性)

    segmentInterface.rightViewShow = YES;
    segmentInterface.rightColor = [UIColor redColor];
    segmentInterface.rightViewHegiht = 10;
    //自定义位置大小尺寸
    [segmentInterface isTitlesViewframe:YES titlesViewframe:CGRectMake(0,0, 321, 40)];  
    //(1)设置tabItem按钮的背景图片 (如果你不想用图片,想要用颜色,我也提供一个方法)
    segmentInterface.tabItemImageNormal = [MJCSegmentInterface imageWithColor:[UIColor orangeColor]];
    segmentInterface.tabItemImageNormal = [UIImage imageNamed:@"111"];
    
    //设置tabitem多张图片
    NSArray *imageArr = @[@"111",@"222",@"333",@"444",@"555",@"666",@"777"];
    segmentInterface.tabItemImageArray = imageArr;


  ![image](https://github.com/MJCIOS/MJCSegmentInterface//master/MJCSegmentInterface/MJCSegmentInterface/MJCSegmentInterface/woyuanyi.jpg)
