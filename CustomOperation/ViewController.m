//
//  ViewController.m
//  CustomOperation
//
//  Created by yuqian on 2018/9/13.
//  Copyright © 2018年 yuqian. All rights reserved.
//

#import "ViewController.h"
#import "STImageDownloadOperation.h"
#import "SyncOperation.h"
#import "AsyncOperation.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 5;
    
    STImageDownloadOperation *op1 = [[STImageDownloadOperation alloc]initWithObject:@"op1"];
//    STImageDownloadOperation *op2 = [[STImageDownloadOperation alloc]initWithObject:@"op2"];
//    STImageDownloadOperation *op3 = [[STImageDownloadOperation alloc]initWithObject:@"op3"];
//    [queue addOperation:op1];
//    [queue addOperation:op2];
//    [queue addOperation:op3];
    [op1 start];
//    [op2 start];
//    [op3 start];
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
        
        SyncOperation *sp1 = [SyncOperation new];
        [sp1 start];
    });
//    SyncOperation *sp2 = [SyncOperation new];
//    SyncOperation *sp3 = [SyncOperation new];
//    [queue addOperation:sp1];
//    [queue addOperation:sp2];
//    [queue addOperation:sp3];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
