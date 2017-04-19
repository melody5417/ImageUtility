//
//  ViewController.m
//  ImageUtility
//
//  Created by melody5417 on 19/04/2017.
//  Copyright © 2017 melody5417. All rights reserved.
//

#import "ViewController.h"
#import "YQDataUtil.h"
#import "YQImageUtil.h"
#import <QuickLook/QuickLook.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self getImageFormat];
//    [self getImageSize];
    [self getImageThumb];
}

#pragma mark - private

- (void)getImageFormat {
    NSArray<NSString *> *imagePaths = [self imagePaths];
    for (NSString *path in imagePaths) {
        NSLog(@"%s %ld", __FUNCTION__, (long)[YQImageUtil imageFormatForFilePath:path]);
    }
}

- (void)getImageSize {
    NSArray<NSString *> *imagePaths = [self imagePaths];
    for (NSString *path in imagePaths) {
        CGSize size = [YQImageUtil imageSizeForFilePath:path];
        NSLog(@"%s %@", __FUNCTION__, NSStringFromSize(size));
    }
}

- (void)getImageThumb {
    NSArray<NSString *> *imagePaths = [self imagePaths];
    for (NSString *path in imagePaths) {
        
        NSLog(@"start load image");
        
        NSImage *image = [self imageByPath:path];
        
        NSLog(@"finish loading image");
        
        // decoded
        if (!image || CGSizeEqualToSize(image.size, NSZeroSize)) {
            NSLog(@"%@ not image", path.lastPathComponent);
            continue;
        }
        [YQImageUtil decodedImageWithImage:image];
        
        NSLog(@"finish decoding image");
    }
}

- (NSImage *)imageByPath:(NSString *)path {
    NSImage *image;
    
    // 1 initWithContentsOfFile
    image = [[NSImage alloc] initWithContentsOfFile:path];

//        // 2 initByReferencingFile
//        image = [[NSImage alloc] initByReferencingFile:path];
    
//    // 3 quicklook
//    NSSize size = [YQImageUtil imageSizeForFilePath:path];
//    size = NSMakeSize(180, size.height * 180 / size.width);
//    CFURLRef cfFileURL = CFBridgingRetain([NSURL fileURLWithPath:path]);
//    CGImageRef cgImage = QLThumbnailImageCreate(kCFAllocatorDefault,
//                                                cfFileURL,
//                                                size,
//                                                NULL);
//    CFRelease(cfFileURL);
//    image = [[NSImage alloc] initWithCGImage:cgImage size:NSZeroSize];
    
//        // 4 CGImageSourceCreateThumbnailAtIndex
//        CFURLRef cfFileURL = CFBridgingRetain([NSURL fileURLWithPath:path]);
//        CGImageSourceRef src = CGImageSourceCreateWithURL(cfFileURL, NULL);
//        if (!src) {
//            NSLog(@"%@ src is NULL", path.lastPathComponent);
//            CFRelease(cfFileURL);
//            continue;
//        }
//        CFDictionaryRef options = (__bridge CFDictionaryRef) @{
//                                                               (id) kCGImageSourceCreateThumbnailWithTransform : @YES,
//                                                               (id) kCGImageSourceCreateThumbnailFromImageAlways : @YES,
//                                                               (id) kCGImageSourceThumbnailMaxPixelSize : @(180)
//                                                               };
//        CGImageRef thumbnail = CGImageSourceCreateThumbnailAtIndex(src, 0, options);
//        CFRelease(src);
//        CFRelease(cfFileURL);
//        image = [[NSImage alloc] initWithCGImage:thumbnail size:NSZeroSize];
    
    return image;
}

- (NSArray<NSString *> *)imagePaths {
    NSString *resoucePath = [[NSBundle mainBundle] resourcePath];
    NSMutableArray *retArray = [[NSMutableArray alloc] init];
    NSArray<NSString *> *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:resoucePath error:nil];
    for (NSString *item in contents) {
        [retArray addObject:[resoucePath stringByAppendingPathComponent:item]];
    }
    return retArray;
}


@end
