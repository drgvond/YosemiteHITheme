//
//  HIThemeSliderView.m
//  Yosemite HITheme
//
//  Created by Gabriel de Dietrich on 25/06/14.
//  Copyright (c) 2014 Digia Qt. All rights reserved.
//

#import "HIThemeSliderView.h"
#import <HIToolbox/HIToolbox.h>

@implementation HIThemeSliderView

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
    data = realloc(data, 4 * self.frame.size.width * self.frame.size.height);
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceRGB();
    CGContextRef gc = CGBitmapContextCreate(NULL, self.frame.size.width, self.frame.size.height,
                                            8, 4 * self.frame.size.width,
                                            cs, kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Host);
    
    NSColor *bgColor = [NSColor windowBackgroundColor];
    CGContextSetFillColorWithColor(gc, [bgColor CGColor]);
    CGContextFillRect(gc, self.bounds);
    
    HIRect rect = self.bounds;
    HIThemeTrackDrawInfo tdi;
    tdi.version = 0;
    tdi.reserved = 0;
    tdi.filler1 = 0;
    tdi.kind = kThemeSliderMedium;
    tdi.bounds = rect;
    tdi.min = 0;
    tdi.max = 100;
    tdi.value = 33;
    tdi.attributes = kThemeTrackShowThumb | kThemeTrackHorizontal;
    tdi.enableState = kThemeTrackInactive;
    tdi.trackInfo.slider.thumbDir = kThemeThumbPlain;
    tdi.trackInfo.slider.pressState = kThemeThumbPressed;
    
    HIThemeDrawTrack(&tdi, &rect, gc, kHIThemeOrientationNormal);
    CGContextFlush(gc);
    
    CGContextRef dgc = [[NSGraphicsContext currentContext] graphicsPort];
    CGImageRef img = CGBitmapContextCreateImage(gc);
    CGContextDrawImage(dgc, rect, img);
//    CGImageRelease(img);
    CGContextRelease(gc);
}

@end