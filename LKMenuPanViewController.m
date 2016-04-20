//
//  LKMenuPanViewController.m
//  UIPanTest(侧滑菜单栏)
//
//  Created by pht on 16/4/18.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "LKMenuPanViewController.h"
#import "UIView+Extension.h"
static NSString *const cellID = @"cell_id";
//#define tagBtn 2020
@interface LKMenuPanViewController ()<UITableViewDelegate,UITableViewDataSource>{
    int _tagBtn;
}
@property (nonatomic, strong) NSIndexPath *lastIndex;

@property (nonatomic, strong) NSMutableDictionary *VCdic;

@property (nonatomic, strong) NSMutableArray *arraySelected;
@end

@implementation LKMenuPanViewController
- (UITableView *)menuTableView{
    if (!_menuTableView) {
        _menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 70, self.view.height) style:UITableViewStylePlain];
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
        _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _menuTableView.tableFooterView = [[UIView alloc] init];
    }
    return _menuTableView;
}
- (UIView *)contentDetailView{
    if (!_contentDetailView) {
        _contentDetailView = [[UIView alloc] initWithFrame:CGRectMake(80, 0, self.view.width, SCREEN_HEIGHT-kNavigationBarHeight-kStatusBarHeight)];
        _contentDetailView.backgroundColor = [UIColor blueColor];
    }
    return _contentDetailView;
}
- (NSArray *)viewControllers{
    if (!_viewControllers) {
        _viewControllers = [NSArray array];
    }
    return _viewControllers;
}
- (NSMutableDictionary *)VCdic{
    if (!_VCdic) {
        _VCdic = [NSMutableDictionary dictionary];
    }
    return _VCdic;
}
- (NSArray *)btnImages{
    if (!_btnImages) {
        _btnImages = [NSArray array];
    }
    return _btnImages;
}
- (NSArray *)titles{
    if (!_titles) {
        _titles = [NSArray array];
    }
    return _titles;
}
- (NSMutableArray *)arraySelected{
    if (!_arraySelected) {
        _arraySelected = [NSMutableArray array];
        for (int i = 0; i< self.btnImages.count; i++) {
            if (i == 0) {
                [ _arraySelected addObject:@1];
            }
            [_arraySelected addObject:@0];
        }
        
    }
    
    return _arraySelected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _tagBtn = 2020;
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, self.view.height)];
    grayView.backgroundColor  = HEX(@"#efefef");
    [self.view addSubview:grayView];
    [grayView addSubview:self.menuTableView];
    [self.view addSubview:self.contentDetailView];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    [self.contentDetailView addGestureRecognizer:panGesture];
    
}


-(void)panGesture:(UIPanGestureRecognizer *)sender{
    [UIView animateWithDuration:0.2 animations:^{
        CGPoint point = [sender translationInView:self.view];
        
        if (point.x>0){
            self.menuTableView.x = 0;
            self.contentDetailView.x =80;
        }else{
            self.menuTableView.x= 0 ;
            self.contentDetailView.x = 0;
        }
    }];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.btnImages.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    UIButton *iconBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    
    NSString *imagPath = self.btnImages[indexPath.row];
    iconBtn = [self customBtn:iconBtn imageStr:imagPath str:self.titles[indexPath.row]];
    
    
    iconBtn.tag = _tagBtn + indexPath.row;
    
    
    [iconBtn addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:iconBtn];
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(5, 69, 60, 1)];
    lineView.backgroundColor = HEX(@"#efefef");
    [cell.contentView addSubview:lineView];
    
    
    if (indexPath.row == 0) {
        iconBtn.selected = YES;
        self.lastIndex = indexPath;
        if (!_arraySelected) {
            [self menuClick:iconBtn];

        }
    }else{
        iconBtn.selected = NO;
    }
    
    iconBtn.selected = self.arraySelected[indexPath.row];

    
    
    
    return cell;
}
- (void)menuClick:(UIButton *)sender{
    
    
    //设置单选效果
    UITableViewCell *lastCell = [self.menuTableView cellForRowAtIndexPath:self.lastIndex];
    UIButton *lastBtn = (UIButton *)[lastCell viewWithTag:self.lastIndex.row +_tagBtn];
    if (sender.isSelected == NO) {
        lastBtn.selected = NO;
    }
    sender.selected = YES;
    
    
    NSInteger currentView = sender.tag- _tagBtn;
    //取消选中
    [self.arraySelected setObject:@0 atIndexedSubscript:self.lastIndex.row];
    //选中
    [self.arraySelected setObject:@1 atIndexedSubscript:currentView];

    
    //记录点击button
    self.lastIndex = [NSIndexPath indexPathForRow:currentView inSection:0];
    
    [self customViewWithClassName:currentView];
    
}
- (void)customViewWithClassName:(NSInteger)currentView{
//两种创建方式
    //1 类名创建
    UIViewController *vc = nil;
    NSString *vcName = self.viewControllers[currentView];
    
    if ([[self.VCdic allKeys] containsObject:vcName] ) {
        vc = self.VCdic[vcName];
    }else{
        vc = [self creatViewController:vcName];
        [self.VCdic setObject:vc forKey:vcName];
    }
    [self.contentDetailView addSubview:vc.view];
    
    //2 alloc创建
    //    switch (sender.tag - tagBtn) {
    //        case 0:
    //            [self.contentDetailView addSubview:self.redVC.view];
    //            [self addChildViewController:self.redVC];
    //            break;
    //        case 1:
    //            [self.contentDetailView addSubview:self.blackVC.view];
    //            [self addChildViewController:self.blackVC];
    //            break;
    //        case 2:{
    //            Class viewControllerClass = NSClassFromString(@"TestViewController");
    //
    //            UIViewController *vc = [[viewControllerClass alloc] init];
    //            [self.contentDetailView addSubview:vc.view];
    //            [self addChildViewController:vc];
    //
    //
    //        }break;
    //        default:
    //            break;
    //    }
    
}
- (UIViewController *)creatViewController:(NSString *)className{
    Class VCClass = NSClassFromString(className);
    PDBaseViewController *vc = [[VCClass alloc] init];
    [self addChildViewController:vc];
    return vc;
    
}
-(UIButton *)customBtn:(UIButton *)customBtn imageStr:(NSString *)imageStr str:(NSString *)titlestr{
    
    //设置button标题
    [customBtn setTitle:titlestr forState:UIControlStateNormal];
    [customBtn setTitleColor:[UIColor colorWithHEX:@"#505050"] forState:UIControlStateNormal];
    [customBtn setTitleColor:HEX(@"#ffffff") forState:UIControlStateSelected];
    customBtn.titleLabel.font = FONT(13);
    
    //设置button 图片
    [customBtn setImage:[UIImage imageNamed:[imageStr stringByAppendingString:@"_default"]] forState:UIControlStateNormal];
    [customBtn setImage:[UIImage imageNamed:[imageStr stringByAppendingString:@"_pressed"]] forState:UIControlStateSelected];
    [customBtn setBackgroundImage:[self createImageWithColor:HEX(@"#d42721")] forState:UIControlStateSelected];
    //title与button 上下间距
    CGFloat space = 4;
    
    CGFloat imageWidth = customBtn.imageView.frame.size.width;
    CGFloat imageHeight = customBtn.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = customBtn.titleLabel.intrinsicContentSize.width;
        labelHeight = customBtn.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = customBtn.titleLabel.frame.size.width;
        labelHeight = customBtn.titleLabel.frame.size.height;
    }
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    //3.图片在上，文字在下
    imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
    labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, -imageHeight-space/2.0, 0);
    customBtn.titleEdgeInsets = labelEdgeInsets;
    customBtn.imageEdgeInsets = imageEdgeInsets;
    return customBtn;
}
- (UIImage *)createImageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
