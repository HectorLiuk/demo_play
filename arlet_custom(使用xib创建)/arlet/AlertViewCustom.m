//
//  AlertViewCustom.m
//  arlet
//
//  Created by lk on 16/6/15.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "AlertViewCustom.h"
#import "UIView+Extension.h"
@interface AlertViewCustom()
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (nonatomic, weak) UIView *alertView;
@end

@implementation AlertViewCustom
- (UIView *)alertView{
    if (!_alertView) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"AlertViewCustom" owner:self options:nil];
        _alertView = nibs[0];
        _alertView.layer.cornerRadius = 5.0f;
        _alertView.layer.masksToBounds = YES;
        _alertView.center = self.center;
    }
    return _alertView;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpSubviews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        [self setUpSubviews];
    }
    return self;
}
- (instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}
- (void)setUpSubviews{
    self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    self.titleLabel.numberOfLines = 0;
    self.alertView.height -= 15;
    self.titleLabel.y += 5;
    [self addSubview:self.alertView];
}
- (void)setDetail:(NSString *)detail{
    _detail = detail;
    self.alertView.height += 15;
    self.titleLabel.y -= 5;
    self.detailLabel.text = detail;
}
- (void)showToView:(UIView*)view{
//    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [view addSubview:self];
    
    self.alertView.transform = CGAffineTransformMakeScale(0.0, 0.0);

    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:3
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.alertView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {

                         
                     }];
}
- (IBAction)cancelBtn:(id)sender {
    [self removeSuperviewAnimate];
}
- (IBAction)sureBtn:(id)sender {
    
    [self removeSuperviewAnimate];
    if (self.sureClickBlock) {
        self.sureClickBlock();
    }

}
- (void)removeSuperviewAnimate{
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
