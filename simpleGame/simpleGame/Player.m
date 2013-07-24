//
//  Player.m
//  simpleGame
//
//  Created by iD Student on 7/23/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "Player.h"

@implementation Player

-(id)init:(int)xi :(int)yi :(NSString *)srci :(UIViewController*)viewController
{
	x = xi;
	y = yi;
	width = 100;
	height = 100;
	playerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chicken.png"]];
	dead = NO;
	hp = 100;
	state = 0;
	jumpa = 0;
	jumpt = 0;
	vc = viewController;
}

-(void)draw {
	[vc.view addSubview:playerView];
}

-(void)killIt:(NSString*)cause {
	[playerView removeFromSuperview];
}

-(void)resurrect {
	[vc.view addSubview:playerView];
}



@end
