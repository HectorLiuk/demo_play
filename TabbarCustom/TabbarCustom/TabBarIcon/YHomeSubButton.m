//
//  YHomeSubButton.m
//  Yuejia
//
//  Created by Karl Zhou on 1/17/15.
//  Copyright (c) 2015 Yuejia. All rights reserved.
//

#import "YHomeSubButton.h"
@interface YHomeSubButton(){

}
@end
@implementation YHomeSubButton
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    _m_imageView = [[UIImageView alloc] init];
    _m_imageView.backgroundColor = [UIColor clearColor];
    _m_imageView.contentMode = UIViewContentModeCenter;
    [self addSubview:_m_imageView];
    
    _m_titleLabel = [[UILabel alloc] init];
    _m_titleLabel.font = [UIFont boldSystemFontOfSize:13];
    _m_titleLabel.textColor = [UIColor cyanColor];
    _m_titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_m_titleLabel];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonClick)];
    [self addGestureRecognizer:tap];
    return self;
}

-(instancetype)initWithTitle:(NSString*)title image:(UIImage*)image{
    self = [self initWithFrame:CGRectZero];
    _m_titleLabel.text = title;
    _m_imageView.image = image;
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = self.frame;
    if( (0 == frame.size.height) ||(0 == frame.size.width)){
        frame.size.width = 64;
        frame.size.height = 64+6+20;
    }
    self.m_imageView.frame = CGRectMake(2.5, 4, frame.size.width-5, frame.size.height - 26-5);
    self.m_titleLabel.frame = CGRectMake(-5, frame.size.height - 20, frame.size.width+10, 20);
}


-(void)buttonClick{
    NSLog(@"%@ click",self.m_titleLabel.text);
    if (self.buttonHasClick) {
        self.buttonHasClick(self);
    }
}



@end
