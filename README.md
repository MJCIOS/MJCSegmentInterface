# MJC
##☆☆☆ “MJCSegmentInterface分段控制器” ☆☆☆
## 新增了标题栏滑动功能   新增了一个最右侧的按钮,可以滚动到第一页和最后一页,也可自己跳转所需要的界面
#### 支持字体缩放,支持默认选中显示的子控制器界面
###有啥问题联系我QQ292251588,希望大神们和我多多交流,和大神们一起学习.....
####用在我仿做的很喜欢的项目中,请看以下示例图
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/xiangmu2.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/xiangmu2.1.gif)   ![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/xiangmu3.gif)

### MJCSegmentInterface分段控制器创建(几行代码设置即可使用)
    
    //实例化控件
        MJCSegmentFaceControl *segmentsface = [[MJCSegmentFaceControl alloc]init];
        segmentsface.frame = CGRectMake(0,64, MJCScreenWidth,MJCScreenHeight);
        segmentsface.MJCSeMentTitleBarStyle = MJCSegMentTitlesClassicStyle;
        segmentsface.childScollEnabled = YES;
        (所有属性的修改要将在这中间部分里面修改....)
        [segmentsface intoTitlesArray:titlesArr];
        [self.view addSubview:view1];
        UITestViewController *vc = [[UITestViewController alloc]init]; //添加控制器
        [segmentsface intoChildViewController:vc];
---------------------------------------------------------------------------------------------------------------

###第二种方法

        //实例化控件
        MJCSegmentInterface  *segmentInterface = [MJCSegmentInterface segmentinitWithFrame:CGRectMake(0,64, MJCScreenWidth,MJCScreenHeight) MJCSeMentTitleBarStyle:MJCSegMentTitlesClassicStyle];
        UITestViewController *vc = [[UITestViewController alloc]init];
        UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
        UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
        UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
        UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
        NSArray *childArr = @[vc,vc1,vc2,vc3,vc4];
        [_segmentInterface intoChildControllerArray:childArr hostMainController:self];

## 可自行修改各个属性,具体属性内容可进去查看..
