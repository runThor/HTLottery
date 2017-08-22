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
    
    NSArray *f = @[@(5), @(10), @(18), @(25), @(33)];
    NSArray *b = @[@(3), @(12)];
    
    int r = 0;
    NSMutableArray *frontResult = [[NSMutableArray alloc] init];
    NSMutableArray *backResult = [[NSMutableArray alloc] init];
    int count = 0;
    
    do {        
        [frontResult removeAllObjects];
        [backResult removeAllObjects];
        
        for (int i = 0; i < 5; i++) {
            int a;
            
            do {
                a = 1 + arc4random()%35;
            } while ([frontResult containsObject:@(a)]);
            
            [frontResult addObject:@(a)];
        }
        
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
