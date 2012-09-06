/*
 * CCControlButtonExample_VariableSize.m
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

#import "CCControlButtonExample_VariableSize.h"

@implementation CCControlButtonExample_VariableSize

- (id)init
{
    if ((self = [super init]))
    {
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        // Defines an array of titles for our buttons
        NSArray *stringArray = [NSArray arrayWithObjects:@"Hello",@"Variable",@"Size",@"!", nil];
        
        //We add the buttons to this "layer" because it allows us to center the buttons without doing lot's of math.
        CCNode *layer = [CCNode node];
        [self addChild:layer z:1];
        
        double total_width = 0, height = 0;
        
        // For each title in the array
        for (NSString *title in stringArray)
        {
            // Creates a button with this string as title
            CCControlButton *button = [self standardButtonWithTitle:title];
            [button setPosition:ccp (total_width + button.contentSize.width / 2, button.contentSize.height / 2)];
            [layer addChild:button];
            
            // Compute the size of the layer
            height = button.contentSize.height;
            total_width += button.contentSize.width;
        }
        
        //The layer of buttons is then centered on the screen
        [layer setAnchorPoint:ccp (0.5, 0.5)];
        [layer setContentSize:CGSizeMake(total_width, height)];
        [layer setPosition:ccp(screenSize.width / 2.0f, screenSize.height / 2.0f)];
        
        // Add the dark background
        CCScale9Sprite *background = [CCScale9Sprite spriteWithFile:@"buttonBackground.png"];
        //The CCScale9Sprite allows to sprite to be stretched:
        [background setContentSize:CGSizeMake(total_width + 14, height + 14)];
        [background setPosition:ccp(screenSize.width / 2.0f, screenSize.height / 2.0f)];
        [self addChild:background];
    }
    return self;
}


//This method is called when a button is created - it allows you to customize what images to use
- (CCControlButton *)standardButtonWithTitle:(NSString *)title
{
    //What the button looks like:
    CCScale9Sprite *backgroundButton = [CCScale9Sprite spriteWithFile:@"button.png"];
    //What the button looks like after being pressed:
    CCScale9Sprite *backgroundHighlightedButton = [CCScale9Sprite spriteWithFile:@"buttonHighlighted.png"];
    
    //Set the text of the button:
    CCLabelTTF *titleButton = [CCLabelTTF labelWithString:title fontName:@"HelveticaNeue-Bold" fontSize:30];
    [titleButton setColor:ccc3(159, 168, 176)];
    
    //Create the finished, assembled button
    CCControlButton *button = [CCControlButton buttonWithLabel:titleButton backgroundSprite:backgroundButton];
    [button setBackgroundSprite:backgroundHighlightedButton forState:CCControlStateHighlighted];
    //Set the button to have a different title color for when the button is pressed
    [button setTitleColor:ccWHITE forState:CCControlStateHighlighted];
    
    return button;
}

@end