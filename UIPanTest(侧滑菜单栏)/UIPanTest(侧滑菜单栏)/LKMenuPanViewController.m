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
#define tagBtn 2020
@interface LKMenuPanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, assign) NSIndexPath *lastIndex;

@property (nonatomic, strong) NSMutableDictionary *VCdic;
@end

@implementation LKMenuPanViewController
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
        //        _contentDetailView.backgroundColor = [UIColor clearColor];
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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.menuTableView];
    [self.view addSubview:self.contentDetailView];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    [self.contentDetailView addGestureRecognizer:panGesture];
    
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
    return self.viewControllers.count;
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
    
    NSString *imagPath = self.btnImages[indexPath.row];
    [iconBtn setBackgroundImage:[UIImage imageNamed:imagPath] forState:UIControlStateNormal];
    
    [iconBtn setBackgroundImage:[UIImage imageNamed:    [imagPath stringByAppendingString:@"highlight"]] forState:UIControlStateHighlighted];
    
    [iconBtn setBackgroundImage:[UIImage imageNamed:    [imagPath stringByAppendingString:@"highlight"]] forState:UIControlStateSelected];
    iconBtn.tag = tagBtn+indexPath.row;
    
    
    [iconBtn addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:iconBtn];
    
    if (indexPath.row == 0) {
        iconBtn.selected = YES;
        self.lastIndex = indexPath;
        [self menuClick:iconBtn];
    }else{
        iconBtn.selected = NO;
    }
    
    return cell;
}
- (void)menuClick:(UIButton *)sender{
    //设置单选效果
    UITableViewCell *lastCell = [self.menuTableView cellForRowAtIndexPath:self.lastIndex];
    UIButton *lastBtn = (UIButton *)[lastCell viewWithTag:self.lastIndex.row +tagBtn];
    if (sender.isSelected == NO) {
        lastBtn.selected = NO;
    }
    sender.selected = YES;
    NSInteger currentView = sender.tag-tagBtn;
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
    UIViewController *vc = [[VCClass alloc] init];
    [self addChildViewController:vc];
    return vc;
    
}


@end
