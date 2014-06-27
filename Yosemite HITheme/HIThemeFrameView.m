//
//  HIThemeFrameView.m
//  Yosemite HITheme
//
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
    
    CGContextRef gc = [[NSGraphicsContext currentContext] graphicsPort];
    CGContextSaveGState(gc);
    CGContextScaleCTM(gc, 1, -1);
    CGContextTranslateCTM(gc, 0, -self.bounds.size.height);

    HIRect rect = CGRectInset(self.bounds, 5, 5);

    HIThemeFrameDrawInfo fdi;
    fdi.version = 0;
    fdi.state = kThemeStatePressed;
    fdi.isFocused = false;
    fdi.kind = kHIThemeFrameTextFieldSquare;
    HIThemeDrawFrame(&rect, &fdi, gc, kHIThemeOrientationNormal);

    CGContextFlush(gc);
    CGContextRestoreGState(gc);
}

@end
