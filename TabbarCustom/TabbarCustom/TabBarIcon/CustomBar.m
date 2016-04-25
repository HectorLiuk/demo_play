//
//  CustomBar.m
//  TabbarCustom
//
//  Created by lk on 16/4/24.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "CustomBar.h"
#import "TabBarItemCustom.h"
#import "UIImage+YJ.h"
#define YDeviceWidth MIN([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width)

@interface CustomBar()
{
    UIImageView* m_tabBar;
}
@end



@implementation CustomBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addBarItem];
    }
    return self;
}
- (void)addBarItem{
    m_tabBar = [[UIImageView alloc] init];
    m_tabBar.userInteractionEnabled = YES;
    m_tabBar.backgroundColor = [UIColor clearColor];
    m_tabBar.frame = CGRectMake(0, CGRectGetMaxY(self.frame)-49, YDeviceWidth, 49);
    
    m_tabBar.image = [UIImage imageNamed:@"btn_bg"];
    [self addSubview:m_tabBar];
    
    NSArray* array = @[@[@"金梧桐",@"jinwutong",@"jinwutong"],@[@"首页",@"shouye",@"shouye1"],@[@"我的",@"wode",@"wode1"],@[@"更多",@"xiaoxi",@"xiaoxi1"]];
    NSUInteger count = [array count];
    
    
    CGFloat width = YDeviceWidth/4;
    CGFloat ox = 0;
    CGFloat space = 0;
    
    
    for (int i =0; i < count; i++) {
        NSArray* arr = array[i];
        
        CGSize iSize = CGSizeMake(28, 28);
        
        TabBarItemCustom* item = [[TabBarItemCustom alloc] initWithTitle:arr[0] image:[[UIImage imageNamed:arr[1]] scaleToSize:iSize] selectedImage:[[UIImage imageNamed:arr[2]] scaleToSize:iSize]];
        item.frame = CGRectMake(ox, 0, width,49);
        
        ox = CGRectGetMaxX(item.frame)+space;
        if (0 == i) {
            item.m_seleted = YES;
        }
        item.tag = i+1000;
        item.buttonHasClick = ^(TabBarItemCustom* tmpItem){
            NSInteger index = tmpItem.tag - 1000;
            if (index == 0) {//跳转到金梧桐
                UIApplication *application = [UIApplication sharedApplication];
                if ([application canOpenURL:[NSURL URLWithString:@"QQ41C92FDA://"]]) {
                    [application openURL:[NSURL URLWithString:@"QQ41C92FDA://"]];
                }else if ([application canOpenURL:[NSURL URLWithString:@"jinwutong://"]]) {
                    [application openURL:[NSURL URLWithString:@"jinwutong://"]];
                }else{
                    [application openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/jin-wu-tong-gong-zhu-wu-tong/id961060424?mt=8"]];
                }
            }else if (index == 2) {//我的, 需要登陆
                //                [YUser ifNeedShowLoginSuccess:^{
                //                    if (self.viewControllers.count > index) {
//                [self setSelectedIndex:index];
                //                    }
                //                }];
            }
            else{
//                if (self.viewControllers.count > index) {
                    [self setSelectedIndex:index];
//                }
            }
            
            
            
        };
        [m_tabBar addSubview:item];
    }
    
    UIView* line = [[UIView alloc] init];
    line.frame = CGRectMake(0, 0, YDeviceWidth, 1);
    [m_tabBar addSubview:line];
    
    
    
}
-(void)setSelectedIndex:(NSUInteger)selectedIndex{
//    [super setSelectedIndex:selectedIndex];
    
    int i = 0;
    for (TabBarItemCustom* vv in m_tabBar.subviews){
        if ([vv respondsToSelector:@selector(m_seleted)]) {
            if (selectedIndex == i) {
                vv.m_seleted = YES;
            }else{
                vv.m_seleted = NO;
            }
            i++;
        }
    }
}

@end
