//
//  Player.m
//  simpleGame
//
//  Created by iD Student on 7/23/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize x;
@synthesize y;
@synthesize width;
@synthesize height;
@synthesize playerView;
@synthesize dead;
@synthesize hp;
@synthesize level;
@synthesize state;
@synthesize jumpa;
@synthesize jumpt;
@synthesize vc;

-(id)init:(int)xi :(int)yi :(NSString *)srci :(UIViewController*)viewController{
	x = xi;
	y = yi;
	width = 100;
	height = 100;
	playerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chicken.tiff"]];
	dead = NO;
	hp = 100;
	state = 0;
	jumpa = 0;
	jumpt = 0;
	vc = viewController;
}



-(UIView*)draw {
	//[vc.view addSubview:playerView];
	playerView.bounds = CGRectMake(0, 150, 50, 50);
	return playerView;
}

-(void)killIt:(NSString*)cause {
	[playerView removeFromSuperview];
}

-(void)resurrect {
	[vc.view addSubview:playerView];
}



@end
