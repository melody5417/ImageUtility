//
//  NSImage+YQ.h
//  GetImageType
//
//  Created by melody5417 on 19/04/2017.
//  Copyright © 2017 melody5417. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (YQ)

- (NSSize)pixelSize;

- (CGImageRef)CGImage;

- (CGFloat)scale;

@end
