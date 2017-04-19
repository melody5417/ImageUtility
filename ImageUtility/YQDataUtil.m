//
//  YQDataUtil.m
//  GetImageType
//
//  Created by melody5417 on 19/04/2017.
//  Copyright © 2017 melody5417. All rights reserved.
//

#import "YQDataUtil.h"

@implementation YQDataUtil

+ (NSData *)readDataOfFile:(NSString *)filePath length:(NSInteger)length {
    
    NSFileHandle *fileHandler = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if (!fileHandler) {
        return nil;
    }
    
    NSData *retData = [fileHandler readDataOfLength:length];
    [fileHandler closeFile];
    
    if (retData.length != length) {
        return nil;
    }
    return retData;
}

@end
