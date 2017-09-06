## ☆☆☆ “MJCSegmentInterface分段控制器” ☆☆☆
* 大家觉得还可以的话,麻烦耽误大家一点时间,点个赞点个星吧.谢谢大家,点赞的都是大好人...
* 一款简单的类似百思不得姐主页导航栏下方的那个分段界面的控件,类似王者荣耀助手的聊天模块的导航栏下方的分段界面控件等等,简单的说,这是一款分段界面选择器

## ☆☆ 如何导入使用框架方法 ☆☆
* 1.打开https://github.com/MJCIOS/MJCSegmentInterface 将项目下载下来
* 2.将MJCSlideInterface文件夹放入自己的项目中

### * 项目已支持CocoaPods,仅支持8.0以及8.0以上版本	
* 1. 打开Podfile文件 添加pod 'MJCSegmentInterface'	
* 2. 再执行下pod update 或pod install (如果没法导入,可以先 pod repo update 更新整个.cocoapods下的所有库...)
* 3. import <MJCSegmentInterface/MJCSegmentInterface.h>

## ☆☆ 1.8.6版本更新简介 ☆☆
* 1. 增加了滑动标题栏文字颜色渐变功能,并且支持,灰色,黑色,深灰色,浅灰色的这些色值渐变..
* 2. 解决了外界不设置文字大小,导致文字增大后,不会缩小的bug,以及一些小bug...
* 3. 新增几个代理方法,可让使用者在item上面添加一个控件...具体使用可以查看demo

---------------------------------------------------------------------------------------------------------------
* 我只想把框架弄的更好..让大家更方便的用,有问题和bug,还有需要啥新的功能随时提给我,谢谢.
* 有啥问题联系我QQ292251588,希望大神们和我多多交流,和大神们一起学习.....
* 技术交流群612845323,希望和大神们一起学习多多交流,互相学习些技术.....
* 希望大家多多支持,如果觉得好用,多多帮忙推荐,谢谢大家,谢谢大神,有啥问题,可以提给我...


---------------------------------------------------------------------------------------------------------------

### ☆☆ 使用者用在项目中的展示图(已经过使用者同意) ☆☆

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demos0.png)

### ☆☆ 使用说明(几行代码设置即可使用,就是那么简单) ☆☆

        //  实例化您需要显示的控制器对象
        MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
        MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
        MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
        MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
        NSArray *vcarrr = @[vc1,vc2,vc3,vc4];// 用数组将控制器装起来
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

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo6.gif)

*滚动模式状态:(MJCTitlesScrollStyle)

        MJCSegmentInterface *segmentsface = [[MJCSegmentInterface alloc]init];
        segmentsface.frame = CGRectMake(0,64, MJCScreenWidth,MJCScreenHeight);
        segmentsface.titleBarStyles = MJCTitlesScrollStyle;
        [segmentsface intoTitlesArray:titlesArr hostController:self];// 传入标题数组
        [segmentsface intoChildControllerArray:vcarrr];//   传入控制器数组
        [self.view addSubview:segmentsface];

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo0.gif)

*默认选中哪一页:(selectedSegmentIndex)(从第0页开始数,第0页,第1页,第2页,第3页)

        segmentsface.selectedSegmentIndex = 3;//默认选中的是第3页(从0开始数,第0页,第1页,第2页,第3页)

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo1.gif)

*颜色渐变,指示器跟随滑动:(isFontGradient,isIndicatorFollow)

        segmentsface.isFontGradient = YES;
        segmentsface.isIndicatorFollow = YES;

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo2.gif)

*字体放大:(tabItemTitlezoomBigEnabled:(BOOL)zoomBigEnabled tabItemTitleMaxfont:(CGFloat)tabItemTitleMaxfont)

        [segmentsface tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:22];

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo3.gif)

*上下滑动的穿透效果:(isPenetrationEffect)
        
        segmentsface.itemBackColor =  [UIColor clearColor];
        segmentsface.isPenetrationEffect = YES;
        segmentsface.titlesViewBackColor =  [[UIColor blueColor]colorWithAlphaComponent:0.3];

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo7.gif)

*实时刷新最新数据的做法:(代理方法的使用(MJCSegmentDelegate))
        
        //每当点击的时候会调用的代理方法
        - (void)mjc_ClickEvent:(UIButton *)tabItem childViewController:(UIViewController *)childViewController segmentInterface:(MJCSegmentInterface *)segmentInterface;
        {
                if ([childViewController isKindOfClass:[MJCTestTableViewController class]]) {
                    [_testTableViewVC beginLoadNewData];//控制器提供一个刷新数据的方法,给这里刷新数据使用,
                }else{
                    NSLog(@"%@",childViewController);
                }   
        }

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo5.gif)

## ☆☆ 示例图展示(功能太多了,就不一一说明了) ☆☆

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo4.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo8.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo9.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo10.gif)

* 用到我仿做的项目中(真的很喜欢玩他们的游戏,感觉他们的项目很不错,所以忍不住仿做了他们的项目)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo11.gif)

---------------------------------------------------------------------------------------------------------------
## 可自行修改各个属性,具体属性接口可进入项目查看..

        /** 标题栏样式 */
        @property (nonatomic,assign) MJCTitleBarStyles titleBarStyles;
        /** 底部指示器大小样式 */
        @property (nonatomic,assign) MJCIndicatorStyles indicatorStyles;
        /** 标题图片效果样式 */
        @property (nonatomic,assign) MJCImageEffectStyles imageEffectStyles;
        //标题文字的内边距
        @property(nonatomic)   UIEdgeInsets itemTextsEdgeInsets;
        //标题图片的内边距
        @property(nonatomic)   UIEdgeInsets itemImagesEdgeInsets;
        /** 默认显示多少个item (初始显示4个) */
        @property (nonatomic,assign) NSInteger defaultShowItemCount;
        /** 底部指示器是否随着滚动 */
        @property (nonatomic,assign) BOOL isIndicatorFollow;
        /** 默认选中的item */
        @property (nonatomic,assign) NSInteger selectedSegmentIndex;
        /** 子界面是否允许滑动 */
        @property (nonatomic,assign) BOOL isChildScollEnabled;
        /** 子界面滚动是否有动画 */
        @property(nonatomic,assign) BOOL isChildScollAnimal;
        /** 指示器是否有动画 */
        @property(nonatomic,assign) BOOL isIndicatorsAnimals;
        /** 是否显示标题文字 */
        @property(nonatomic,assign) BOOL isItemTitleTextHidden;
        /** 颜色是否渐变 */
        @property (nonatomic,assign) BOOL isFontGradient;
        /** 是否有穿透效果 */
        @property (nonatomic,assign) BOOL isPenetrationEffect;
        /** 用于缩放功能的修改字体的属性 */
        -(void)tabItemTitlezoomBigEnabled:(BOOL)zoomBigEnabled tabItemTitleMaxfont:(CGFloat)tabItemTitleMaxfont;
        /** 可设置指示器的Y值和高度,其余不允许自己设置 */
        @property (nonatomic,assign) CGRect indicatorFrame;
        /** 底部指示器背景色 */
        @property (nonatomic,strong) UIColor *indicatorColor;
        /** 底部指示器图片(设置了图片的话,此控件是根据图片本身的大小自适应的) */
        @property (nonatomic,strong) UIImage *indicatorImage;
        /** 底部指示器是否隐藏 */
        @property (nonatomic,assign) BOOL indicatorHidden;
        /** 标题栏frame */
        @property (nonatomic,assign) CGRect titlesViewFrame;
        /** 标题栏背景色 */
        @property (nonatomic,strong) UIColor *titlesViewBackColor;
        /** 标题栏背景图片 */
        @property (nonatomic,strong) UIImage *titlesViewBackImage;
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
        /** item的图片大小(不能设置背景图片) */
        @property (nonatomic,assign) CGSize itemImageSize;
        /** 实例化此控件的方法 */
        +(instancetype)showInterfaceWithTitleBarFrame:(CGRect)frame Styles:(MJCTitleBarStyles)titleBarStyles;
        /** 添加控制器的方法(添加控制器按照控制器添加的先后顺序与按钮对应的 */
        -(void)intoChildControllerArray:(NSArray *)childControllerArray;
        /** 添加标题栏的方法 */
        -(void)intoTitlesArray:(NSArray *)titlesArray hostController:(UIViewController *)hostController;

---------------------------------------------------------------------------------------------------------------
