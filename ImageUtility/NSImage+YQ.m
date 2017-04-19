//
//  NSImage+YQ.m
//  GetImageType
//
//  Created by melody5417 on 19/04/2017.
//  Copyright © 2017 melody5417. All rights reserved.
//

#import "NSImage+YQ.h"

@implementation NSImage (YQ)

- (NSSize)pixelSize {
    NSArray *representions = [self representations];
    if ([representions count] > 0) {
        NSImageRep *rep = [representions objectAtIndex:0];
        return NSMakeSize(rep.pixelsWide, rep.pixelsHigh);
    }
    return NSZeroSize;
}

- (CGImageRef)CGImage {
    NSRect imageRect = NSMakeRect(0, 0, self.size.width, self.size.height);
    return [self CGImageForProposedRect:&imageRect context:NULL hints:nil];
}

- (CGFloat)scale {
    NSSize pixelSize = [self pixelSize];
    NSSize size = self.size;
    return pixelSize.width/size.width;
}

@end
