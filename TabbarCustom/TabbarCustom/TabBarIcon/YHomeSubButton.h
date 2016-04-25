//
//  YHomeSubButton.h
//  Yuejia
//
//  Created by Karl Zhou on 1/17/15.
//  Copyright (c) 2015 Yuejia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHomeSubButton : UIView
@property (nonatomic, strong) UILabel *m_titleLabel;
@property (nonatomic, strong) UIImageView *m_imageView;
@property (nonatomic, copy)void(^buttonHasClick)(id);

-(instancetype)initWithTitle:(NSString*)title image:(UIImage*)image;

-(void)buttonClick;
@end
