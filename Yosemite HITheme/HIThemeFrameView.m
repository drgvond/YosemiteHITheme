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
    
    CGContextRef gc = [self setupBitmapContext];

    const CGFloat bgColor[] = { 0.93, 0.93, 0.93 };
    CGContextSetFillColor(gc, bgColor);
    CGContextFillRect(gc, self.bounds);
    
    NSColor *innerColor = [NSColor textBackgroundColor];
    CGContextSetFillColorWithColor(gc, [innerColor CGColor]);
//    NSLog(@"%@", [NSColor textBackgroundColor]);
//    const CGFloat innerColor[] = { 1.0, 1.0, 1.0 };
//    CGContextSetFillColor(gc, innerColor);
    CGContextFillRect(gc, CGRectInset(self.bounds, 1, 1));

    HIRect rect = CGRectInset(self.bounds, 1, 1);
    HIThemeFrameDrawInfo fdi;
    fdi.version = 0;
    fdi.state = kThemeStateActive;
    fdi.kind = kHIThemeFrameTextFieldSquare;
    fdi.isFocused = NO;

    HIThemeDrawFrame(&rect, &fdi, gc, kHIThemeOrientationNormal);
    
    [self drawBitmapContext:gc inRect:self.bounds];
}

@end
