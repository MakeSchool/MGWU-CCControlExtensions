/*
 * CCControlSwitchExample.m
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

#import "CCControlSwitchExample.h"

@implementation CCControlSwitchExample
@synthesize displayValueLabel;


- (id)init
{
	if ((self = [super init]))
    {
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        CCNode *layer                       = [CCNode node];
        layer.position                      = ccp (screenSize.width / 2, screenSize.height / 2);
        [self addChild:layer z:1];
        
        double layer_width = 0;
        
        // Add the black background for the text
        CCScale9Sprite *background = [CCScale9Sprite spriteWithFile:@"buttonBackground.png"];
        [background setContentSize:CGSizeMake(80, 50)];
        [background setPosition:ccp(layer_width + background.contentSize.width / 2.0f, 0)];
        [layer addChild:background];
        
        layer_width += background.contentSize.width;
        
        //Add text label
        self.displayValueLabel  = [CCLabelTTF labelWithString:@"#color" fontName:@"HelveticaNeue-Bold" fontSize:30];
        displayValueLabel.position = background.position;
        [layer addChild:displayValueLabel];
        
        // Create the switch
        CCControlSwitch *switchControl      = [CCControlSwitch switchWithMaskSprite:[CCSprite spriteWithFile:@"switch-mask.png"] 
                                                                           onSprite:[CCSprite spriteWithFile:@"switch-on.png"]
                                                                          offSprite:[CCSprite spriteWithFile:@"switch-off.png"]
                                                                        thumbSprite:[CCSprite spriteWithFile:@"switch-thumb.png"]
                                                                            onLabel:[CCLabelTTF labelWithString:@"On" fontName:@"Arial-BoldMT" fontSize:16]
                                                                           offLabel:[CCLabelTTF labelWithString:@"Off" fontName:@"Arial-BoldMT" fontSize:16]];
        switchControl.position               = ccp (layer_width + 10 + switchControl.contentSize.width / 2, 0);
        [layer addChild:switchControl];
        
        //Set the switch to call the valueChanged method when the switch is toggled
        [switchControl addTarget:self action:@selector(valueChanged:) forControlEvents:CCControlEventValueChanged];
        
        // Set the layer size
        layer.contentSize                   = CGSizeMake(layer_width, 0);
        layer.anchorPoint                   = ccp (0.5f, 0.5f);
        
        // Update the value label
        [self valueChanged:switchControl];
	}
	return self;
}

//Update the text label according to the state of the switch
- (void)valueChanged:(CCControlSwitch *)sender
{
    if ([sender isOn])
    {
        displayValueLabel.string    = @"On";
    } else
    {
        displayValueLabel.string    = @"Off";
    }
}

@end
