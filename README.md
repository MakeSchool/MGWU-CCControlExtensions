Cocos2D-CCControlExtensions
===========================

Cocos2D versions of UIControl classes.
Original code by YannickL (see forked project).

Modified by Brian Chu for MakeGamesWithUs (http://makegameswith.us).
Changes: conversion to ARC, simplified examples, simplified comments.

First, run the program and have fun with the elements (and the eye-candy UI art).

In order to add CCControl elements to your game, copy the CCControl folder to your project. Any class using CCControl elements will need to import "CCControlExtension.h".

Look through the examples to figure out how to properly set up CCControl elements in your games. The example layers are subclasses of CCControlScene, which itself is a subclass of CCLayer. This is only for the purposes of setting up the green buttons that allow you to navigate through the examples. For your game, you should not subclass CCControlScene or include CCControlScene/CCControlSceneManager in your project.

Feel free to use the art as placeholder art OR as actual released game art - the art is freely licensed.
