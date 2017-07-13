## ☆☆☆ “MJCSegmentInterface分段控制器” ☆☆☆
* 一款简单的类似百思不得姐主页导航栏下方的那个分段界面的控件,类似王者荣耀助手的聊天模块的导航栏下方的分段界面控件等等,简单的说,这是一款分段界面选择器

## ☆☆ 如何导入使用框架方法 ☆☆
* 可以打开https://github.com/MJCIOS/MJCSegmentInterface 下载下来,将MJCSlideInterface文件夹放入自己的项目
* 项目已支持pod导入,pod 'MJCSegmentInterface',也可使用pod

---------------------------------------------------------------------------------------------------------------
* 有啥问题联系我QQ292251588,希望大神们和我多多交流,和大神们一起学习.....
* 希望大家多多支持,如果觉得好用,多多帮忙推荐,谢谢大家,谢谢大神,有啥问题,可以提给我...

---------------------------------------------------------------------------------------------------------------

## ☆☆ 用在我仿做的项目中请看以下示例图 ☆☆
* (真的很喜欢玩他们的游戏,感觉他们的项目很不错,所以忍不住仿做了他们的项目)

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/xiangmu2.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/xiangmu2.1.gif)   
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/xiangmu3.gif)

### ☆☆ MJCSegmentInterface分段控制器创建(几行代码设置即可使用) ☆☆
    
        NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
        MJCSegmentFaceControl *segmentsface = [[MJCSegmentFaceControl alloc]init];
        segmentsface.frame = CGRectMake(0,64, MJCScreenWidth,MJCScreenHeight);
        [lala intoTitlesArray:titlesArr hostController:self];
        [self.view addSubview:segmentsface];
        MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
        vc1.titlesCount = 1;
        MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
        vc2.titlesCount = 2;
        MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
        vc3.titlesCount = 3;
        MJCTestViewController *vc4 = [[MJCTestViewController alloc]init];
        vc4.titlesCount = 4;
        MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
        vc5.titlesCount = 5;
        NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5];
        [lala intoChildControllerArray:vcarrr];

        
---------------------------------------------------------------------------------------------------------------
        
## 可自行修改各个属性,具体属性内容可进去查看..


    //标题文字的内边距
    @property(nonatomic)   UIEdgeInsets textsEdgeInsets;
    //标题图片的内边距
    @property(nonatomic)   UIEdgeInsets imagesEdgeInsets;
    /** 默认显示多少个item */
    @property (nonatomic,assign) NSInteger defaultShowItemCount;
    /** 底部指示器是否随着滚动 */
    @property (nonatomic,assign) BOOL isIndicatorFollow;
    /** 默认选中的item */
    @property (nonatomic,assign) NSInteger defaultItemNumber;
    /** 子界面是否允许滑动 */
    @property (nonatomic,assign) BOOL isChildScollEnabled;
    /** 子界面滚动是否有动画 */
    @property(nonatomic,assign) BOOL isChildScollAnimal;
    /** 用于缩放功能的修改字体的属性 */
    -(void)tabItemTitlezoomBigEnabled:(BOOL)zoomBigEnabled tabItemTitleMaxfont:(CGFloat)tabItemTitleMaxfont;

* 底部指示器属性修改
    /** 可设置指示器的Y值和高度,其余不允许自己设置 */
    @property (nonatomic,assign) CGRect indicatorFrame;
    /** 底部指示器背景色 */
    @property (nonatomic,strong) UIColor *indicatorColor;
    /** 底部指示器图片(设置了图片的话,此控件是根据图片本身的大小自适应的) */
    @property (nonatomic,strong) UIImage *indicatorImage;
    /** 底部指示器是否隐藏 */
    @property (nonatomic,assign) BOOL indicatorHidden;

* 标题栏属性修改
    /** 标题栏frame */
    @property (nonatomic,assign) CGRect titlesViewFrame;
    /** 标题栏背景色 */
    @property (nonatomic,strong) UIColor *titlesViewBackColor;
    /** 标题栏背景图片 */
    @property (nonatomic,strong) UIImage *titlesViewBackImage;

* item属性修改
    /** item背景颜色 */
    @property (nonatomic,strong) UIColor *itemBackColor;
    /** item普通状态下的图片 */
    @property (nonatomic,strong) UIImage *itemImageNormal;
    /** item点击状态下的图片 */
    @property (nonatomic,strong) UIImage *itemImageSelected;
    /** item普通状态下图片数组 */
    @property (nonatomic,strong) NSArray *itemImageNormalArray;
    /** item点击状态下图片数组 */
    @property (nonatomic,strong) NSArray *itemImageSelectedArray;
    /** item普通状态下背景图片 */
    @property (nonatomic,strong) UIImage *itemBackNormalImage;
    /** item点击状态下背景图片 */
    @property (nonatomic,strong) UIImage *itemBackSelectedImage;
    /** item普通状态下背景图片数组 */
    @property (nonatomic,strong) NSArray *itemNormalBackImageArray;
    /** item点击状态下背景图片数组 */
    @property (nonatomic,strong) NSArray *itemSelectedBackImageArray;
    /** item普通状态下文字颜色 */
    @property (nonatomic,strong) UIColor *itemTextNormalColor;
    /** item高亮状态下文字颜色 */
    @property (nonatomic,strong) UIColor *itemTextSelectedColor;
    /** item文字大小 */
    @property (nonatomic,assign) CGFloat itemTextFontSize;

* item属性修改
    /** 添加控制器的方法(添加控制器按照控制器添加的先后顺序与按钮对应的 */
    -(void)intoChildControllerArray:(NSArray *)childControllerArray;
    /** 添加标题栏的方法 */
    -(void)intoTitlesArray:(NSArray *)titlesArray hostController:(UIViewController *)hostController;

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
