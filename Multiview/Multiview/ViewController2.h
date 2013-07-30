//
//  ViewController2.h
//  Multiview
//
//  Created by iD Student on 7/23/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController {
	
	IBOutlet UILabel *label;
	NSArray *highScoresName;
	NSArray *highScoresValue;
}


@property int data;

- (IBAction)back:(id)sender;

@end
