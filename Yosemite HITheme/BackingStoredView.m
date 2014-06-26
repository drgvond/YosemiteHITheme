//
//  BackingStoredView.m
//  Yosemite HITheme
//
//  Created by Dr. G. von D. on 6/26/14.
//  Copyright (c) 2014 Digia Qt. All rights reserved.
//

#import "BackingStoredView.h"

@implementation BackingStoredView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (CGContextRef)setupBitmapContext
{
    CGFloat pixelRatio = self.window.backingScaleFactor;
    static void *data = 0;
    data = realloc(data, 4 * pixelRatio * pixelRatio * self.frame.size.width * self.frame.size.height);
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceRGB();
    CGContextRef gc = CGBitmapContextCreate(NULL, pixelRatio * self.frame.size.width, pixelRatio * self.frame.size.height,
                                            8, 4 * pixelRatio * self.frame.size.width,
                                            cs, kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Host);

    CGContextTranslateCTM(gc, 0, pixelRatio * self.bounds.size.height);
    CGContextScaleCTM(gc, pixelRatio, pixelRatio);
    CGContextScaleCTM(gc, 1, -1);

    return gc;
}

- (void)drawBitmapContext:(CGContextRef)gc inRect:(CGRect)rect
{
    CGFloat pixelRatio = self.window.backingScaleFactor;
    CGContextRef dgc = [[NSGraphicsContext currentContext] graphicsPort];
    CGContextSaveGState(dgc);
    CGContextScaleCTM(gc, 1.0 / pixelRatio, 1.0 / pixelRatio);
    CGImageRef img = CGBitmapContextCreateImage(gc);
    CGContextDrawImage(dgc, rect, img);
    //    CGImageRelease(img);
    CGContextRestoreGState(dgc);
    CGContextRelease(gc);
}

@end
