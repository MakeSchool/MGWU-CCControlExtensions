/*
 * CCControlButtonExample_Event.m
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

#import "CCControlButtonExample_Event.h"

@implementation CCControlButtonExample_Event
@synthesize displayValueLabel;


- (id)init
{
	if ((self = [super init]))
    {
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        // Add a text label which will change depending on the button presses
		self.displayValueLabel = [CCLabelTTF labelWithString:@"No Event" fontName:@"Marker Felt" fontSize:32];
        
        displayValueLabel.anchorPoint = ccp(0.5f, -1);//anchor point is set at 0.5,-1 so that the text will appear above the button, rather than on top
        displayValueLabel.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f);
		[self addChild:displayValueLabel z:1];
        
        //Set up the button's images (one image for the normal button, another image for when it's pressed)
        CCScale9Sprite *backgroundButton = [CCScale9Sprite spriteWithFile:@"button.png"];
        CCScale9Sprite *backgroundHighlightedButton = [CCScale9Sprite spriteWithFile:@"buttonHighlighted.png"];
        
        //Button text:
        CCLabelTTF *titleButton = [CCLabelTTF labelWithString:@"Touch Me!" fontName:@"HelveticaNeue-Bold" fontSize:30];
        [titleButton setColor:ccc3(159, 168, 176)]; //button color
        
        //Assemble the button from the 2 images and the button text
        CCControlButton *controlButton = [CCControlButton buttonWithLabel:titleButton
                                                         backgroundSprite:backgroundButton];
        [controlButton setBackgroundSprite:backgroundHighlightedButton forState:CCControlStateHighlighted];
        //Set the button to have a different title color for when the button is pressed
        [controlButton setTitleColor:ccWHITE forState:CCControlStateHighlighted];
        
        controlButton.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f);
        [self addChild:controlButton z:1];
        
        // Add the black background
        CCScale9Sprite *background = [CCScale9Sprite spriteWithFile:@"buttonBackground.png"];
        [background setContentSize:CGSizeMake(300, 170)]; //stretch the background
        [background setPosition:ccp(screenSize.width / 2.0f, screenSize.height / 2.0f)];
        [self addChild:background];
        
        // Sets up event handlers for different kinds of touches
        //TouchDown - you have pressed the button (but haven't moved)
        [controlButton addTarget:self action:@selector(touchDownAction:) forControlEvents:CCControlEventTouchDown];
        //TouchDragInside - you are pressing and holding the button with your touch still inside the button
        [controlButton addTarget:self action:@selector(touchDragInsideAction:) forControlEvents:CCControlEventTouchDragInside];
        //TouchDragOutside - you are pressing and holding the button with your touch still outside the button
        [controlButton addTarget:self action:@selector(touchDragOutsideAction:) forControlEvents:CCControlEventTouchDragOutside];
        //TouchDragEnter - you are pressing and holding the button and you have just moved your touch back into the button
        [controlButton addTarget:self action:@selector(touchDragEnterAction:) forControlEvents:CCControlEventTouchDragEnter];
        //TouchDragExit - you are pressing and holding the button and have just moved our touch outside the button
        [controlButton addTarget:self action:@selector(touchDragExitAction:) forControlEvents:CCControlEventTouchDragExit];
        //TouchUpInside - you pressed and released the button with your last touch inside the button
        [controlButton addTarget:self action:@selector(touchUpInsideAction:) forControlEvents:CCControlEventTouchUpInside];
        //TouchUpOutside - you pressed and released the button with your last touch outside the button
        [controlButton addTarget:self action:@selector(touchUpOutsideAction:) forControlEvents:CCControlEventTouchUpOutside];
        //TouchEvenCancel - if a system event cancels the touch
        [controlButton addTarget:self action:@selector(touchCancelAction:) forControlEvents:CCControlEventTouchCancel];
	}
	return self;
}

//These methods set the actions that correspond to different events:
- (void)touchDownAction:(CCControlButton *)sender
{
    displayValueLabel.string = [NSString stringWithFormat:@"Touch Down"];
}

- (void)touchDragInsideAction:(CCControlButton *)sender
{
    displayValueLabel.string = [NSString stringWithFormat:@"Drag Inside"];
}

- (void)touchDragOutsideAction:(CCControlButton *)sender
{
    displayValueLabel.string = [NSString stringWithFormat:@"Drag Outside"];
}

- (void)touchDragEnterAction:(CCControlButton *)sender
{
    displayValueLabel.string = [NSString stringWithFormat:@"Drag Enter"];
}

- (void)touchDragExitAction:(CCControlButton *)sender
{
    displayValueLabel.string = [NSString stringWithFormat:@"Drag Exit"];
}

- (void)touchUpInsideAction:(CCControlButton *)sender
{
    displayValueLabel.string = [NSString stringWithFormat:@"Touch Up Inside."];
}

- (void)touchUpOutsideAction:(CCControlButton *)sender
{
    displayValueLabel.string = [NSString stringWithFormat:@"Touch Up Outside."];
}

- (void)touchCancelAction:(CCControlButton *)sender
{
    displayValueLabel.string = [NSString stringWithFormat:@"Touch Cancel"];
}

@end