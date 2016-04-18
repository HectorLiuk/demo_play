//
//  ViewController.m
//  UIPanTest(侧滑菜单栏)
//
//  Created by lk on 16/4/18.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "TestViewController.h"
static NSString *const cellID = @"cell_id";
#define tagBtn 2020
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *menuTableView;
@property (nonatomic, strong) UIView *contentDetailView;
@property (nonatomic, strong) TestViewController *redVC;
@property (nonatomic, strong) TestViewController *blackVC;
@property (nonatomic, assign) NSIndexPath *lastIndex;

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSMutableDictionary *VCdic;
@end

@implementation ViewController
- (UITableView *)menuTableView{
    if (!_menuTableView) {
        _menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, self.view.height) style:UITableViewStylePlain];
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
        _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _menuTableView.tableFooterView = [[UIView alloc] init];
    }
    return _menuTableView;
}
- (UIView *)contentDetailView{
    if (!_contentDetailView) {
        _contentDetailView = [[UIView alloc] initWithFrame:CGRectMake(100, 0, self.view.width, self.view.frame.size.height)];
        _contentDetailView.backgroundColor = [UIColor clearColor];
    }
    return _contentDetailView;
}
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"222",@"111",@"11",@"111",@"11"];
    }
    return _dataArray;
}
- (NSMutableDictionary *)VCdic{
    if (!_VCdic) {
        _VCdic = [NSMutableDictionary dictionary];
    }
    return _VCdic;
}




- (TestViewController *)redVC{
    if (!_redVC) {
        _redVC = [[TestViewController alloc] init];
        _redVC.color = [UIColor redColor];
    }
    return _redVC;
}
- (TestViewController *)blackVC{
    if (!_blackVC) {
        _blackVC = [[TestViewController alloc] init];
        _blackVC.color = [UIColor blackColor];
    }
    return _blackVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.menuTableView];
    [self.view addSubview:self.contentDetailView];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    [self.contentDetailView addGestureRecognizer:panGesture];
    
    //添加第一个默认页面
//    [self.contentDetailView addSubview:self.redVC.view];
//    [self addChildViewController:self.redVC];
    
}


-(void)panGesture:(UIPanGestureRecognizer *)sender{
    [UIView animateWithDuration:0.2 animations:^{
        CGPoint point = [sender translationInView:self.view];
    
        if (point.x>0){
            self.menuTableView.x = 0;
            self.contentDetailView.x =self.menuTableView.width;
        }else{
            self.menuTableView.x= 0 - self.menuTableView.x;
            self.contentDetailView.x = 0;
        }
    }];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    UIButton *iconBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    [iconBtn setBackgroundImage:[UIImage imageNamed:@"222"] forState:UIControlStateNormal];
    [iconBtn setBackgroundImage:[UIImage imageNamed:@"111"] forState:UIControlStateSelected];
    
    iconBtn.tag = tagBtn+indexPath.row;
    
    [iconBtn addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.contentView addSubview:iconBtn];
    
    if (indexPath.row == 0) {
        iconBtn.selected = YES;
        self.lastIndex = indexPath;
    }else{
        iconBtn.selected = NO;
    }
    
    return cell;
}
- (void)menuClick:(UIButton *)sender{
    //设置单选效果
    UITableViewCell *lastCell = [self.menuTableView cellForRowAtIndexPath:self.lastIndex];
    UIButton *lastBtn = [lastCell viewWithTag:self.lastIndex.row +tagBtn];
    if (sender.isSelected == NO) {
        lastBtn.selected = NO;
    }
    sender.selected = YES;
    NSInteger currentView = sender.tag-tagBtn;

    
    self.lastIndex = [NSIndexPath indexPathForRow:currentView inSection:0];

    //选中页面
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
    
    UIViewController *vc = nil;
    
    
    if ([[self.VCdic allKeys] containsObject:self.dataArray[currentView]] ) {
        vc = self.VCdic[self.dataArray[currentView]];
    }else{
        vc = [self creatViewController:self.dataArray[currentView]];
    }
    [self.contentDetailView addSubview:vc.view];
    
    
    
    
}

- (UIViewController *)creatViewController:(NSString *)className{
    Class VCClass = NSClassFromString(className);
    UIViewController *vc = [[VCClass alloc] init];
    
    return vc;
    
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
//
//    UITableViewCell *lastCell = [tableView cellForRowAtIndexPath:self.lastIndex];
//    lastCell.backgroundColor = [UIColor whiteColor];
//    
//    UITableViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
//    self.lastIndex = indexPath;
//
//   
//    
//#warning 添加一个控制器菜单栏 就多出来了
//    switch (indexPath.row) {
//        case 0:
//                [self.contentDetailView addSubview:self.redVC.view];
//                [self addChildViewController:self.redVC];
//            break;
//        case 1:
//            [self.contentDetailView addSubview:self.blackVC.view];
//            [self addChildViewController:self.blackVC];
//            break;
//        default:
//            break;
//    }
//}




@end
