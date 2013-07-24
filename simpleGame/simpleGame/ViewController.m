//
//  ViewController.m
//  simpleGame
//
//  Created by iD Student on 7/23/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint touchpoint = [touch locationInView:[self view]];
	if (CGRectContainsPoint(imageViewA.frame, touchpoint)) {
		statusLabel.text = @"A is Touched!!!";
	}
	else if (CGRectContainsPoint(imageViewB.frame, touchpoint)) {
		statusLabel.text = @"B is Touched!!!";
	}
	else
	{
		statusLabel.text = @"";
	}
}

@end
