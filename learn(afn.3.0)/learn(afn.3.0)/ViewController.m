//
//  ViewController.m
//  learn(afn.3.0)
//
//  Created by lk on 16/7/4.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
@interface ViewController ()
@property (nonatomic, strong) Student *students;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"sandBox地址： %@",[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject]);

//    [self sortedDescriptor];
    
//    [self observeTest];
    
//    [self funcNSParameterAssert];
    
    [self practiceNSProgress];
    
    
}
- (void)sortedDescriptor{
    NSDictionary *dic = @{@"key":@[@"3",@"5",@"1"],
                          @"vv":@"ww"
                          };
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"key" ascending:YES selector:@selector(compare:)];
    NSLog(@"%@",[dic.allKeys sortedArrayUsingDescriptors:@[ sortDescriptor ]]);
    
    
    for (id value in [dic.allKeys sortedArrayUsingDescriptors:@[sortDescriptor]]) {
        NSLog(@"%@",value);
    }
    
}


- (void)observeTest{
    self.students= [[Student alloc] init];
    [self.students addObserver:self.students forKeyPath:@"count" options:NSKeyValueObservingOptionOld context:nil];
    self.students.count = 3;
    self.students.name = @"iOS";
    NSLog(@"%@",[self.students.name description]);
    
}

- (IBAction)changeValue:(id)sender {
    self.students.count = 3;

}

//断言 判断是否存在
- (void)funcNSParameterAssert{
    NSString *str = nil;
    NSParameterAssert(str);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
static void *ProgressObserverContext = &ProgressObserverContext;

- (void)practiceNSProgress{
    NSProgress *progress = [NSProgress progressWithTotalUnitCount:100];
    [progress addObserver:self forKeyPath:NSStringFromSelector(@selector(fractionCompleted)) options:NSKeyValueObservingOptionInitial context:ProgressObserverContext];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if (context == ProgressObserverContext) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSProgress *progress = object;
          
        }];
    }
}

@end
