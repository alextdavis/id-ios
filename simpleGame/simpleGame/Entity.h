//
//  Entity.h
//  simpleGame
//
//  Created by iD Student on 7/24/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entity : NSObject{
	int x;
	int y;
	int width;
	int height;
	UIImageView *vc;
	NSDictionary *ents;
	BOOL ate;
}

@property (nonatomic, strong) UIImageView *entView;
@property (nonatomic, strong) NSString *type;

-(id)initWithParams:(NSString*)typei :(int) xi :(int) yi :(UIImageView*)backView :(NSDictionary*)ents;
-(void)draw;


@end
