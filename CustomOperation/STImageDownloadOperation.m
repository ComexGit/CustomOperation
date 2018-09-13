//
//  STImageDownloadOperation.m
//  CustomOperation
//
//  Created by yuqian on 2018/9/13.
//  Copyright © 2018年 yuqian. All rights reserved.
//

#import "STImageDownloadOperation.h"

@implementation STImageDownloadOperation {
    
    NSObject *param;
}

- (instancetype) initWithObject:(NSObject *)paramObject {
    
    self = [super init];
    if (self != nil){
        param = paramObject;
    }
    
    return self;
}

- (void)operationDidStart
{
    [self.lock lock];
    if (![self isCancelled])
    {
        //需要在线程中运行的代码
        NSLog(@"ImageDownload-%@  operationDidStart,线程号：%@", param, [NSThread currentThread]);
    }
    [self.lock unlock];
}


@end
