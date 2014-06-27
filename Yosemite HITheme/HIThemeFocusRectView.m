//
//  HIThemeFocusRectView.m
//  Yosemite HITheme
//
//  Created by Gabriel de Dietrich on 25/06/14.
//  Copyright (c) 2014 Digia Qt. All rights reserved.
//

#import "HIThemeFocusRectView.h"
#import <HIToolbox/HIToolbox.h>


@implementation HIThemeFocusRectView

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
    HIThemeDrawFocusRect(&rect, true, gc, kHIThemeOrientationNormal);

    CGContextFlush(gc);
    CGContextRestoreGState(gc);
}

@end
