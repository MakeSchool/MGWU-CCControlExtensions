/*
 * CCControlColorPickerExample.m
 *
 * Copyright (c) 2011 Yannick Loriot
 * Modified 2012 by Brian Chu for MakeGamesWith.Us: http://makegameswith.us
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#import "CCControlColorPickerExample.h"
@implementation CCControlColorPickerExample
@synthesize colorLabel;

- (id)init
{
	if ((self = [super init]))
    {
        CGSize screenSize = [[CCDirector sharedDirector] winSize];

        //We create a center layer so we can center both the color picker and the text label
        CCNode *layer = [CCNode node];
        layer.position = ccp (screenSize.width / 2, screenSize.height / 2);
        [self addChild:layer z:1];
        
        double layer_width = 0;
        
        // Create the colour picker
        CCControlColourPicker *colorPicker = [CCControlColourPicker colorPicker];
        colorPicker.color = ccc3(37, 46, 252); //The initial color(rgb) that the color picker shows - #252EFC is the hex color
        colorPicker.position = ccp (colorPicker.contentSize.width / 2, 0);
        [layer addChild:colorPicker];

        // Add block for an event where the color value changes:
        /*
         A block is basically a function/method that can be passed around like a variable
         Here we are basically setting a method to be called when a certain event ocrrus.
         */
        [colorPicker setBlock:^(id sender, CCControlEvent event)
         {
             //call a method:
             [self colorValueChanged:sender];
         } //when the event value (color value) changed:
              forControlEvents:CCControlEventValueChanged];
        
        layer_width += colorPicker.contentSize.width;
        
        // Add the black background for the text
        CCScale9Sprite *background = [CCScale9Sprite spriteWithFile:@"buttonBackground.png"];
        [background setContentSize:CGSizeMake(150, 50)];
        [background setPosition:ccp(layer_width + background.contentSize.width / 2.0f, 0)];
        [layer addChild:background];
        
        //The center layer needs to be large enough to fit the color picker and text.
        layer_width += background.contentSize.width;
        
        //Text label:
        colorLabel = [CCLabelTTF labelWithString:@"#color" fontName:@"HelveticaNeue-Bold" fontSize:30];
        colorLabel.position = background.position;
        [layer addChild:colorLabel];
        
        // Set the layer size
        layer.contentSize = CGSizeMake(layer_width, 0);
        layer.anchorPoint = ccp (0.5f, 0.5f);
        
        // Update the color text ot the current color (the defualt color)
        [self colorValueChanged:colorPicker];
	}
	return self;
}

- (void)colorValueChanged:(CCControlColourPicker *)sender
{
    //%02x converts an integer to hexadecimal
    colorLabel.string = [NSString stringWithFormat:@"#%02X%02X%02X",sender.color.r, sender.color.g, sender.color.b];
}

@end
