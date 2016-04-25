//
//  TabBarItemCustom.h
//  TabbarCustom
//
//  Created by lk on 16/4/24.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "YHomeSubButton.h"

@interface TabBarItemCustom : YHomeSubButton
@property (nonatomic, assign) BOOL m_seleted;

-(instancetype)initWithTitle:(NSString*)title image:(UIImage*)image selectedImage:(UIImage *)selectedImage;
@end
