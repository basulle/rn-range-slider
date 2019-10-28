//
// Created by Tigran Sahakyan on 2019-01-14.
// Copyright (c) 2019 tigrans. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "RangeSlider.h"
#import <React/RCTViewManager.h>

@interface RangeSliderManager : RCTViewManager<RangeSliderDelegate>
@end

@implementation RangeSliderManager

RCT_EXPORT_MODULE()

- (UIView *)view {
    RangeSlider * slider = [[RangeSlider alloc] init];
    slider.delegate = self;
    return slider;
}

RCT_EXPORT_VIEW_PROPERTY(onValueChanged, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onSliderTouchStart, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onSliderTouchEnd, RCTDirectEventBlock)

RCT_EXPORT_VIEW_PROPERTY(lineWidth, float)
RCT_EXPORT_VIEW_PROPERTY(thumbRadius, float)
RCT_EXPORT_VIEW_PROPERTY(thumbBorderWidth, float)
RCT_EXPORT_VIEW_PROPERTY(textSize, float)
RCT_EXPORT_VIEW_PROPERTY(labelBorderWidth, float)
RCT_EXPORT_VIEW_PROPERTY(labelPadding, float)
RCT_EXPORT_VIEW_PROPERTY(labelBorderRadius, float)
RCT_EXPORT_VIEW_PROPERTY(labelTailHeight, float)
RCT_EXPORT_VIEW_PROPERTY(labelGapHeight, float)
RCT_EXPORT_VIEW_PROPERTY(textFormat, NSString)
RCT_EXPORT_VIEW_PROPERTY(labelStyle, NSString *)
RCT_EXPORT_VIEW_PROPERTY(gravity, NSString *)
RCT_EXPORT_VIEW_PROPERTY(disabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(rangeEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(valueType, NSString)
RCT_EXPORT_VIEW_PROPERTY(selectionColor, NSString)
RCT_EXPORT_VIEW_PROPERTY(blankColor, NSString)
RCT_EXPORT_VIEW_PROPERTY(thumbColor, NSString)
RCT_EXPORT_VIEW_PROPERTY(thumbBorderColor, NSString)
RCT_EXPORT_VIEW_PROPERTY(labelBackgroundColor, NSString)
RCT_EXPORT_VIEW_PROPERTY(labelTextColor, NSString)
RCT_EXPORT_VIEW_PROPERTY(labelBorderColor, NSString)
RCT_EXPORT_VIEW_PROPERTY(min, double)
RCT_EXPORT_VIEW_PROPERTY(max, double)
RCT_EXPORT_VIEW_PROPERTY(initialLowValue, double)
RCT_EXPORT_VIEW_PROPERTY(initialHighValue, double)
RCT_EXPORT_VIEW_PROPERTY(step, double)
RCT_EXPORT_VIEW_PROPERTY(lowValue, double)
RCT_EXPORT_VIEW_PROPERTY(highValue, double)

#pragma mark RangeSliderDelegate

- (void)rangeSliderValueWasChanged:(RangeSlider *)slider fromUser:(BOOL)fromUser {
    slider.onValueChanged(@{

        @"lowValue": @(slider.lowValue),
        @"highValue": @(slider.highValue),
        @"fromUser": @(fromUser)

    });
}

- (void)rangeSliderTouchStarted:(RangeSlider *)slider {
    slider.onSliderTouchStart(@{});
}

- (void)rangeSliderTouchEnded:(RangeSlider *)slider {
    slider.onSliderTouchEnd(@{});
}

@end
