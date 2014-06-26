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

    CGContextRef gc = [self setupBitmapContext];

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
    tdi.enableState = kThemeTrackActive;
    tdi.trackInfo.slider.thumbDir = kThemeThumbPlain;
    tdi.trackInfo.slider.pressState = 0;

    HIThemeDrawTrack(&tdi, &rect, gc, kHIThemeOrientationNormal);
    CGContextFlush(gc);

    [self drawBitmapContext:gc inRect:rect];
}

@end
