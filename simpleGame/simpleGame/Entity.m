//
//  Entity.m
//  simpleGame
//
//  Created by iD Student on 7/24/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "Entity.h"

@implementation Entity
@synthesize type;
@synthesize entView;


-(id)initWithParams:(NSString *)typei :(int)xi :(int)yi :(UIViewController*)viewController :(NSDictionary*)entsi {
	x=xi;
	y=yi;
	type = typei;
	vc = viewController;
	ents = entsi;
	entView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[NSString alloc]initWithFormat:@"%@.png", type]]];
	width = [[ents objectForKey:type][@"width"] integerValue];
	height = [[ents objectForKey:type][@"height"] integerValue];
//	NSLog(@"thisis: %@", ents);
	return self;
}


-(void)draw {
	[entView setFrame:CGRectMake(x, y, width, height)];
	[vc.view addSubview:entView];
//	NSLog(@"x: %d", self->x);
//	return entView;
}

//if (type == @"seed") {
//	
//	-(void)eat {
//		if (!ate) {
//			
//		}
//	}
//}

@end
