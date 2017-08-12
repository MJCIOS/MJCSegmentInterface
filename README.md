## ☆☆☆ “MJCSegmentInterface分段控制器” ☆☆☆
* 大家觉得还可以的话,麻烦耽误大家一点时间,点个赞点个星吧.谢谢大家,点赞的都是大好人...
* 一款简单的类似百思不得姐主页导航栏下方的那个分段界面的控件,类似王者荣耀助手的聊天模块的导航栏下方的分段界面控件等等,简单的说,这是一款分段界面选择器

## ☆☆ 如何导入使用框架方法 ☆☆
* 可以打开https://github.com/MJCIOS/MJCSegmentInterface 将项目下载下来,将MJCSlideInterface文件夹放入自己的项目中
* 项目已支持pod导入,仅支持8.0以及8.0以上版本 pod 'MJCSegmentInterface' (如果没法导入,可以先 pod repo update 更新整个.cocoapods下的所有库...)

## ☆☆ 1.6.1版本更新简介 ☆☆
* 1.增加了滑动标题栏文字颜色渐变功能,并且支持,灰色,黑色,深灰色,浅灰色的这些色值渐变..
* 2.解决了外界不设置文字大小,导致文字增大后,不会缩小的bug,以及一些小bug...
* 3.支持了用xib创建本控件,新增不滚动标题栏样式,新增滚动的时候穿透功能...

---------------------------------------------------------------------------------------------------------------
* 我只想把框架弄的更好..让大家更方便的用,有问题和bug,还有需要啥新的功能随时提给我,谢谢.
* 有啥问题联系我QQ292251588,希望大神们和我多多交流,和大神们一起学习.....
* 技术交流群612845323,希望和大神们一起学习多多交流,互相学习些技术.....
* 希望大家多多支持,如果觉得好用,多多帮忙推荐,谢谢大家,谢谢大神,有啥问题,可以提给我...


---------------------------------------------------------------------------------------------------------------

### ☆☆ 使用说明(几行代码设置即可使用,就是那么简单) ☆☆

        //  实例化您需要添加的控制器对象
        MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
        MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
        MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
        MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
        NSArray *vcarrr = @[vc1,vc2,vc3,vc4];// 用数组包装起来
        //  实例化一个标题数组对象,相对应的控制器界面,是与控制器数组中的控制器顺序相对应,比如说(荣耀对应着vc1的控制器界面)
        NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
        //  准备工作做好之后,接来下实例化我的控件
        MJCSegmentInterface *segmentsface = [[MJCSegmentInterface alloc]init];
        segmentsface.frame = CGRectMake(0,64, MJCScreenWidth,MJCScreenHeight);
        [segmentsface intoTitlesArray:titlesArr hostController:self];// 传入标题数组
        [segmentsface intoChildControllerArray:vcarrr];//   传入控制器数组
        [self.view addSubview:segmentsface];

---------------------------------------------------------------------------------------------------------------

## ☆☆ 使用说明及示例图展示 ☆☆

*初始默认状态:(默认的是MJCTitlesClassicStyle)

        MJCSegmentInterface *segmentsface = [[MJCSegmentInterface alloc]init];
        segmentsface.frame = CGRectMake(0,64, MJCScreenWidth,MJCScreenHeight);
        segmentsface.frame.titleBarStyles = MJCTitlesClassicStyle;
        [segmentsface intoTitlesArray:titlesArr hostController:self];// 传入标题数组
        [segmentsface intoChildControllerArray:vcarrr];//   传入控制器数组
        [self.view addSubview:segmentsface];

*滚动模式状态:(MJCTitlesScrollStyle)

        MJCSegmentInterface *segmentsface = [[MJCSegmentInterface alloc]init];
        segmentsface.frame = CGRectMake(0,64, MJCScreenWidth,MJCScreenHeight);
        segmentsface.titleBarStyles = MJCTitlesScrollStyle;
        [segmentsface intoTitlesArray:titlesArr hostController:self];// 传入标题数组
        [segmentsface intoChildControllerArray:vcarrr];//   传入控制器数组
        [self.view addSubview:segmentsface];

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo0.gif)

*默认选中哪一页:(selectedSegmentIndex)

        segmentsface.selectedSegmentIndex = 3;//默认选中的是第三页
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo1.gif)

* (真的很喜欢玩他们的游戏,感觉他们的项目很不错,所以忍不住仿做了他们的项目)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/xiangmu2.gif)

        
## 可自行修改各个属性,具体属性接口可进入项目查看..

    /** 实例化此控件的方法 */
    +(MJCSegmentInterface*)showInterfaceWithTitleBarStyles:(MJCTitleBarStyles)titleBarStyles frame:(CGRect)frame;
    /** 添加控制器的方法(添加控制器按照控制器添加的先后顺序与按钮对应的 */
    -(void)intoChildControllerArray:(NSArray *)childControllerArray;
    /** 添加标题栏的方法 */
    -(void)intoTitlesArray:(NSArray *)titlesArray hostController:(UIViewController *)hostController;
    //标题文字的内边距
    @property(nonatomic)   UIEdgeInsets itemTextsEdgeInsets;
    //标题图片的内边距
    @property(nonatomic)   UIEdgeInsets itemImagesEdgeInsets;
    /** 底部指示器是否随着滚动 */
    @property (nonatomic,assign) BOOL isIndicatorFollow;
    /** 默认选中的item */
    @property (nonatomic,assign) NSInteger selectedSegmentIndex;
    /** 子界面是否允许滑动 */
    @property (nonatomic,assign) BOOL isChildScollEnabled;
    /** 子界面滚动是否有动画 */
    @property(nonatomic,assign) BOOL isChildScollAnimal;
    /** 是否显示标题文字 */
    @property(nonatomic,assign) BOOL isItemTitleTextHidden;
    /** 颜色是否渐变 */
    @property (nonatomic,assign) BOOL isFontGradient;
    /** 是否有穿透效果 */
    @property (nonatomic,assign) BOOL isPenetrationEffect;
    /** 用于缩放功能的修改字体的属性 */
    -(void)tabItemTitlezoomBigEnabled:(BOOL)zoomBigEnabled tabItemTitleMaxfont:(CGFloat)tabItemTitleMaxfont;

---------------------------------------------------------------------------------------------------------------
