/*
 * CCControlSceneManager.m
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

#import "CCControlSceneManager.h"
#import "CCControlScene.h"

//**This is a singleton class**

@implementation CCControlSceneManager
@synthesize currentControlSceneId, controlScenes;

static CCControlSceneManager *sharedInstance = nil;


#pragma mark Constructors - Initializers

- (id)init
{
    if ((self = [super init]))
    {
        //current scene id
        currentControlSceneId = 0;
        
        //list of classes that can be cycled through
        controlScenes = [[NSArray alloc] initWithObjects:
                         @"CCControlSliderExample",
                         @"CCControlColorPickerExample",
                         @"CCControlSwitchExample",
                         @"CCControlStepperExample",
                         @"CCControlButtonExample_Event",
                         @"CCControlButtonExample_VariableSize",
                         @"CCControlPotentiometerExample",
                         nil];
    }
    return self;
}

+ (CCControlSceneManager *)sharedControlSceneManager
{
    @synchronized (self)
    {
        if (sharedInstance == nil)
        {
            sharedInstance = [[self alloc] init];
        }
        return sharedInstance;
    }
}

#pragma mark -
#pragma mark CCControlSceneManager Public Methods
//These methods are called to set up scenes after the left/right/center buttons are pressed
- (CCScene *)nextControlScene
{
	currentControlSceneId = (currentControlSceneId + 1) % [controlScenes count];
    
	return [self currentControlScene];
}

- (CCScene *)previousControlScene
{
	currentControlSceneId = currentControlSceneId - 1;
    if (currentControlSceneId < 0)
    {
        currentControlSceneId = [controlScenes count] - 1;
    }
    
	return [self currentControlScene];
}

- (CCScene *)currentControlScene
{
	NSString *controlSceneName = [controlScenes objectAtIndex:currentControlSceneId];
    
    Class nextControlScene = NSClassFromString(controlSceneName);
	return [nextControlScene sceneWithTitle:controlSceneName];
}

#pragma mark CCControlSceneManager Private Methods

@end
