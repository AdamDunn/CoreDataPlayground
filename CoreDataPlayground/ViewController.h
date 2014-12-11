//
//  ViewController.h
//  CoreDataPlayground
//
//  Created by Adam Dunn on 2014-11-06.
//  Copyright (c) 2014 Great Slave Helicopters. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)buttonClicked:(UIButton *)sender;

@end

