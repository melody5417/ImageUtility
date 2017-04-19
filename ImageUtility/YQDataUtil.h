//
//  YQDataUtil.h
//  GetImageType
//
//  Created by melody5417 on 19/04/2017.
//  Copyright © 2017 melody5417. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQDataUtil : NSObject

/**
 * Return a number of data of file
 *
 * @param filePath the path of input file
 *
 * @param length the length of data to read
 *
 * @return NSData the file data
 */
+ (NSData *)readDataOfFile:(NSString *)filePath length:(NSInteger)length;

@end
