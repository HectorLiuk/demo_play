//
//  ViewController.m
//  面试题练习
//
//  Created by lk on 16/7/1.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"

@interface Student()
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int count;
@end
@implementation Student
+ (BOOL)automaticallyNotifiesObserversForLComponent;
{
    return NO;
}


- (void)setName:(NSString *)name{
    _name = name;

}
- (void)setCount:(int)count{
    [self willChangeValueForKey:@"count"];
    _count = count;
    [self didChangeValueForKey:@"count"];
    
}
//观察者监控触发方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
}


@end


@interface ViewController ()
@property (nonatomic, strong) Student *students;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   
//    [self blockOutsideVar];
    
//    [self Observer];
    
//    [self performSelectorTest];
   
}

//计算文本高度
- (void)rectToFit{
    CGRect rectToFit = [@"fdsfdsfdsfdfdsfdsfdsfdsfdsfdsfsd" boundingRectWithSize:CGSizeMake(30.0f, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f]} context:nil];
}

//38题 在block内如何修改block外部变量
- (void)blockOutsideVar{
    NSMutableString *a = [NSMutableString stringWithString:@"Tom"]; NSLog(@"\n 定以前：------------------------------------ a指向的堆中地址：%p；a在栈中的指针地址：%p a值= %@", a, &a,a); //a在栈区
    void (^foo)(void) = ^{
        a.string = @"Jerry";
        NSLog(@"\n block内部：------------------------------------ a指向的堆中地址：%p；a在栈中的指针地址：%p a值= %@", a, &a,a); //a在栈区
//        a = [NSMutableString stringWithString:@"William"];
    };
    foo();
    NSLog(@"\n 定以后：------------------------------------ a指向的堆中地址：%p；a在栈中的指针地址：%p  a值= %@", a, &a,a);
    
}
//46 如何触发一个value的KVO
- (void)Observer{
    self.students = [[Student alloc] init];
    //添加观察者
//    [self.students addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew  context:@"nameStr"];
    self.students.name = @"sss";
    
    //对当前类属性添加观察
    [self addObserver:self forKeyPath:@"nameStr" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    self.nameStr = @"wwww";
    
}
- (IBAction)obsverveClick:(id)sender {
    self.students = [[Student alloc] init];

    
    self.students.count = 3;
    
    
}
//观察者监控触发方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
}
//移除通知
- (void)dealloc{
    [self.students removeObserver:self forKeyPath:@"name"];
}

//performSelector的使用
- (void)performSelectorTest{
    NSString *addSelector = @"add";
    SEL add = NSSelectorFromString(addSelector);
    
    if ([self respondsToSelector:add]) {
        [self performSelector:add];
    }
}
- (void)add{
    NSLog(@"我是+方法");
}

@end
