/*
 * CCControlScene.h
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

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "kobold2d.h"
#import "CCControlExtension.h"

@interface CCControlScene : CCLayer
{
@public
    CCLabelTTF *sceneTitleLabel;
}
/** Title label of the scene. */
@property (nonatomic, strong) CCLabelTTF *sceneTitleLabel;

- (void)previousCallback:(id)sender;
- (void)restartCallback:(id)sender;
- (void)nextCallback:(id)sender;

/**
 * Returns a CCScene that contains the CCControl example layer.
 *
 * @param title The title of the scene.
 */
+ (CCScene *)sceneWithTitle:(NSString *)title;


@end
