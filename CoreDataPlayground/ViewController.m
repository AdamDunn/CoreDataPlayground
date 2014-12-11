//
//  ViewController.m
//  CoreDataPlayground
//
//  Created by Adam Dunn on 2014-11-06.
//  Copyright (c) 2014 Great Slave Helicopters. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "Item.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *OutputText;

@end

@implementation ViewController

@synthesize managedObjectContext;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(UIButton *)sender {
    NSMutableString *mutatingString = [[NSMutableString alloc] init];
    Item *newItem = [NSEntityDescription
                                insertNewObjectForEntityForName:@"Item"
                                inManagedObjectContext:managedObjectContext];
    newItem.title = @"My title";
    newItem.order = [NSNumber numberWithInt:2];
    [managedObjectContext save:NULL];
    
    [mutatingString appendString:newItem.title];
    _OutputText.text = mutatingString;
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Item" inManagedObjectContext:managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    
    NSError *error;
    NSArray *array = [managedObjectContext executeFetchRequest:request error:&error];
    if (array == nil) {
        [mutatingString appendString:@"\nthere was an error retrieving"];
        _OutputText.text = mutatingString;
    }
    else
    {
        for (Item *anItem in array) {
            [mutatingString appendFormat:@"\ngot the object:%@", anItem.title];
            _OutputText.text = mutatingString;
        }
        
    }
}

@end
