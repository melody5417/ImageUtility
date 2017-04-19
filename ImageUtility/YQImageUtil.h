//
//  YQImageUtil.h
//  GetImageType
//
//  Created by melody5417 on 19/04/2017.
//  Copyright © 2017 melody5417. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YQImageFormat) {
    YQImageFormatUndefined = -1,
    YQImageFormatJPEG = 0,
    YQImageFormatPNG,
    YQImageFormatGIF,
    YQImageFormatTIFF,
    YQImageFormatBMP,
    YQImageFormatWebP,
};

@interface YQImageUtil : NSObject

/**
 * Return image format
 * 
 * @param filePath file path of input image
 *
 * @return the image format as 'YQImageFormat(enum)'
 */
+ (YQImageFormat)imageFormatForFilePath:(nullable NSString *)filePath;

/**
 * Return image size
 *
 * @param filePath file path of input image
 *
 * @return the image size as pixel size
 */
+ (CGSize)imageSizeForFilePath:(nullable NSString *)filePath;

/**
 * Return decoded image data
 *
 * @param image input image
 *
 * @return the image have decoded
 */
+ (nullable NSImage *)decodedImageWithImage:(nullable NSImage *)image;

/**
 * Return image size
 *
 * @param image input image
 *
 * @return the image have decoded and scaled
 */
+ (nullable NSImage *)decodedAndScaledDownImageWithImage:(nullable NSImage *)image;

@end
