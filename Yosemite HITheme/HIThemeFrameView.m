//
//  HIThemeFrameView.m
//  Yosemite HITheme
//
//  Created by Gabriel de Dietrich on 25/06/14.
//  Copyright (c) 2014 Digia Qt. All rights reserved.
//

#import "HIThemeFrameView.h"
#import <HIToolbox/HIToolbox.h>

@implementation HIThemeFrameView

- (instancetype)initWithFrame:(NSRect)frame
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
    
    static void *data = 0;
    long dataSize = 3 * self.frame.size.width * self.frame.size.height;
    data = realloc(data, dataSize);
    memset(data, 0, dataSize);
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceRGB();
    CGContextRef gc = CGBitmapContextCreate(data, self.frame.size.width, self.frame.size.height,
                                            8, 4 * self.frame.size.width,
                                            cs, kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Host);

    const CGFloat bgColor[] = { 0.93, 0.93, 0.93 };
    CGContextSetFillColor(gc, bgColor);
    CGContextFillRect(gc, self.bounds);
    
//    NSColor *innerColor = [NSColor textBackgroundColor];
//    CGContextSetFillColorWithColor(gc, [innerColor CGColor]);
//    NSLog(@"%@", [NSColor textBackgroundColor]);
    const CGFloat innerColor[] = { 1.0, 1.0, 1.0 };
    CGContextSetFillColor(gc, innerColor);
    CGContextFillRect(gc, CGRectInset(self.bounds, 2, 2));
    
    HIRect rect = CGRectInset(self.bounds, 1, 1);
    HIThemeFrameDrawInfo fdi;
    fdi.version = 0;
    fdi.state = kThemeStateActive;
    fdi.kind = kHIThemeFrameTextFieldSquare;
    fdi.isFocused = YES;

    HIThemeDrawFrame(&rect, &fdi, gc, kHIThemeOrientationNormal);
    
    CGContextRef dgc = [[NSGraphicsContext currentContext] graphicsPort];
    CGImageRef img = CGBitmapContextCreateImage(gc);
    CGContextDrawImage(dgc, rect, img);
//    CGImageRelease(img);
    CGContextRelease(gc);
}

@end
