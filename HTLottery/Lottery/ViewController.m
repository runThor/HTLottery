//
//  ViewController.m
//  Lottery
//
//  Created by chenghong on 2017/8/18.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 大乐透的玩法：前区号码范围1-35，随机选取5个不重复的数；后区号码范围1-12，随机选取2个不重复的数，头奖即所有号码完全一致
    // 假定当期头奖结果
    NSArray *f = @[@(5), @(10), @(18), @(25), @(33)];  // 前区号码
    NSArray *b = @[@(3), @(12)];  // 后区号码
    
    int r = 0;  // 一致的号码个数，r == 7时代表全中
    NSMutableArray *frontResult = [[NSMutableArray alloc] init];
    NSMutableArray *backResult = [[NSMutableArray alloc] init];
    int count = 0;  // 需要购买的彩票注数
    
    do {        
        [frontResult removeAllObjects];
        [backResult removeAllObjects];
        
        // 得出前区号码
        for (int i = 0; i < 5; i++) {
            int a;
            
            do {
                a = 1 + arc4random()%35;
            } while ([frontResult containsObject:@(a)]);
            
            [frontResult addObject:@(a)];
        }
        
        // 得出后区号码
        for (int i = 0; i < 2; i++) {
            int b;
            
            do {
                b = 1 + arc4random()%12;
            } while ([backResult containsObject:@(b)]);
            
            [backResult addObject:@(b)];
        }
        
        r = 0;
        
        for (id a in frontResult) {
            if ([f containsObject:a]) {
                r++;
            }
        }
        
        for (id bb in backResult) {
            if ([b containsObject:bb]) {
                r++;
            }
        }

        count++;
    } while (r != 7);
    
    NSLog(@"%d  %@%@", count, frontResult, backResult);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
