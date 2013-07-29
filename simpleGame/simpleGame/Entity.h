//
//  Entity.h
//  simpleGame
//
//  Created by iD Student on 7/24/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "globalVars.h"

@interface Entity : NSObject{
	int x;
	int y;
	int width;
	int height;
	UIViewController *vc;
	NSDictionary *ents;
	BOOL ate;
}

@property (nonatomic, strong) UIImageView *entView;
@property (nonatomic, strong) NSString *type;

-(id)initWithParams:(NSString*)typei :(int) xi :(int) yi :(UIViewController*)viewController :(NSDictionary*)ents;
-(void)draw;


@end
