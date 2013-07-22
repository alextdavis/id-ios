//
//  ViewController.h
//  changeColor
//
//  Created by iD Student on 7/22/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
	
	IBOutlet UIImageView *yourImage;
	IBOutlet UIImageView *aiImage;
	IBOutlet UIView *viewBackground;
}
- (IBAction)rock:(id)sender;
- (IBAction)paper:(id)sender;
- (IBAction)scissors:(id)sender;

- (int) rpsAI
{
	int leRandom = arc4random() % 4;
	if (leRandom == 0)
	{
		
	}
	
}

@end
