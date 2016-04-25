//
//  TabBarItemCustom.m
//  TabbarCustom
//
//  Created by lk on 16/4/24.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "TabBarItemCustom.h"
@interface TabBarItemCustom (){
    UIImage* m_selectedImage;
    UIImage* m_image;
}
@end
@implementation TabBarItemCustom

-(instancetype)initWithTitle:(NSString*)title image:(UIImage*)image selectedImage:(UIImage *)selectedImage{
    self = [super initWithTitle:title image:image];
    m_image = image;
    m_selectedImage = selectedImage;
    self.m_titleLabel.font = [UIFont systemFontOfSize:11];
    return self;
}
-(void)setM_seleted:(BOOL)m_seleted{
    _m_seleted = m_seleted;
    if (_m_seleted) {
        self.m_imageView.image = m_selectedImage;
        self.m_titleLabel.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor redColor];
    }else{
        self.m_imageView.image = m_image;
        self.m_titleLabel.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = self.frame;
    if( (0 == frame.size.height) ||(0 == frame.size.width)){
        frame.size.width = 49 - 15;
        frame.size.height = 49;
    }
    self.m_imageView.frame = CGRectMake(0+2.5, 0+4, frame.size.width-5, frame.size.height - 15-5);
    self.m_titleLabel.frame = CGRectMake(-8, frame.size.height - 13, frame.size.width+16, 10);
}

-(void)buttonClick{
    if (self.m_seleted) {
        return;
    }
    [super buttonClick];
}


@end
