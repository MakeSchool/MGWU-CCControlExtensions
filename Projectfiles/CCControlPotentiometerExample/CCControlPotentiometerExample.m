/*
 * CCControlPotentiometerExample.m
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

#import "CCControlPotentiometerExample.h"

@implementation CCControlPotentiometerExample
@synthesize displayValueLabel;

- (id)init
{
	if ((self = [super init]))
    {
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        //Create a center layer that holds the potentiometer
        CCNode *layer = [CCNode node];
        layer.position = ccp (screenSize.width / 2, screenSize.height / 2);
        [self addChild:layer z:1];
        
        double layer_width = 0;
        
        // Add the black background for the text
        CCScale9Sprite *background  = [CCScale9Sprite spriteWithFile:@"buttonBackground.png"];
        [background setContentSize:CGSizeMake(80, 50)];
        [background setPosition:ccp(layer_width + background.contentSize.width / 2.0f, 0)];
        [layer addChild:background];
        
        layer_width += background.contentSize.width;
        
        //Set up the text label
        self.displayValueLabel  = [CCLabelTTF labelWithString:@"" fontName:@"HelveticaNeue-Bold" fontSize:30];
        displayValueLabel.position = background.position;
        [layer addChild:displayValueLabel];
		
        // Add the slider - examine the images to see the different components
		CCControlPotentiometer *potentiometer = [CCControlPotentiometer potentiometerWithTrackFile:@"potentiometerTrack.png"
                                                                                      progressFile:@"potentiometerProgress.png"
                                                                                         thumbFile:@"potentiometerButton.png"];
        potentiometer.position = ccp (layer_width + 10 + potentiometer.contentSize.width / 2, 0);

        // When the value of the slider will change, the given selector (method) will be called
		[potentiometer addTarget:self action:@selector(valueChanged:) forControlEvents:CCControlEventValueChanged];
        
		[layer addChild:potentiometer];
        
        //set the layer size to include both the text and the potentiometer
        layer_width += potentiometer.contentSize.width;
        
        // Set the layer size
        layer.contentSize = CGSizeMake(layer_width, 0);
        layer.anchorPoint = ccp (0.5f, 0.5f);
        
        // Update the value label text
        [self valueChanged:potentiometer];
	}
	return self;
}

//This method is called when the potentiometer's value changes
- (void)valueChanged:(CCControlPotentiometer *)sender
{
	// Change value of label.
	displayValueLabel.string = [NSString stringWithFormat:@"%.02f", sender.value];
}

@end
