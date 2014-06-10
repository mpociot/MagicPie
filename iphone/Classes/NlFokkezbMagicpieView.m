/**
 * MagicPie
 *
 * Created by Fokke Zandbergen
 * Copyright (c) 2014 Fokke Zandbergen. All rights reserved.
 */

#import "NlFokkezbMagicpieView.h"

@implementation NlFokkezbMagicpieView

 -(PieLayer*)pieLayer
 {
    if( pieLayer == nil )
    {
        NSLog(@"INITIALIZING VIEW %@",[self frame]);
        pieLayer = [[PieLayer alloc] initWithFrame:[self frame]];

        [pieLayer addValues:@[[PieElement pieElementWithValue:5.0 color:[UIColor redColor]],
          [PieElement pieElementWithValue:4.0 color:[UIColor blueColor]],
          [PieElement pieElementWithValue:7.0 color:[UIColor greenColor]]] animated:YES];
        
        [self addSubview:pieLayer];
        // [pieLayer addTarget:self.proxy action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return pieLayer;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    NSLog(@"[VIEW LIFECYCLE EVENT] frameSizeChanged");

    if (pieLayer != nil) {

        // You must call the special method 'setView:positionRect' against
        // the TiUtils helper class. This method will correctly layout your
        // child view within the correct layout boundaries of the new bounds
        // of your view.
        [TiUtils setView:pieLayer positionRect:bounds];
        PieLayer *oldPieLayer = pieLayer;
        [pieLayer removeFromSuperview];
        pieLayer = [[PieLayer alloc] initWithFrame:bounds];
        [self addSubview:pieLayer];
        // [pieLayer setMinimumValue:oldPieLayer.minimumValue];
        // [pieLayer setMaximumValue:oldPieLayer.maximumValue];
        // [pieLayer setLineWidth:oldPieLayer.lineWidth];
        // [pieLayer setHandleColor:oldPieLayer.handleColor];
        // [pieLayer setUnfilledColor:oldPieLayer.unfilledColor];
        // [pieLayer setFilledColor:oldPieLayer.filledColor];
        // [pieLayer addTarget:self.proxy action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    }
}


// -(void)setMinimumValue_:(id)minimum
// {
//     [[self pieLayer] setMinimumValue:[TiUtils floatValue:minimum def:0.0f]];
// }

// -(void)setMaximumValue_:(id)maximum
// {
//     [[self pieLayer] setMaximumValue:[TiUtils floatValue:maximum def:100.0f]];
// }

// -(void)setValue_:(id)value
// {
//     [[self pieLayer] setCurrentValue:[TiUtils floatValue:value def:0.0f]];
// }

// -(void)setLineWidth_:(id)value
// {
//     [[self pieLayer] setLineWidth:[TiUtils floatValue:value def:0.0f]];
// }

// -(void)setHandleColor_:(id)value
// {
//     [[self pieLayer] setHandleColor:[TiUtils colorValue:value].color];
// }

// -(void)setUnfilledColor_:(id)value
// {
//     [[self pieLayer] setUnfilledColor:[TiUtils colorValue:value].color];
// }

// -(void)setFilledColor_:(id)value
// {
//     [[self pieLayer] setFilledColor:[TiUtils colorValue:value].color];
// }

// -(void)setInnerMarkingLabels_:(NSArray *)value
// {
//     [[self pieLayer] setInnerMarkingLabels:value];
// }

// MAKE_SYSTEM_PROP(BIG_CIRCLE, EFBigCircle);
// MAKE_SYSTEM_PROP(SEMI_TRANSPARENT_WHITE_CIRCLE, EFSemiTransparentWhiteCircle);
// MAKE_SYSTEM_PROP(SEMI_TRANSPARENT_BLACK_CIRCLE, EFSemiTransparentBlackCircle);
// MAKE_SYSTEM_PROP(DOUBLE_CIRCLE_OPEN_CENTER, EFDoubleCircleWithClosedCenter);
// MAKE_SYSTEM_PROP(DOUBLE_CIRCLE_CLOSED_CENTER, EFDoubleCircleWithClosedCenter);

// -(void)setHandleType_:(id)value
// {
//     NSLog(@"Handle Type: %@",value);
//     [[self pieLayer] setHandleType:value];
// }

@end