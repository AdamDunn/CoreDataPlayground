//
//  Item.h
//  CoreDataPlayground
//
//  Created by Adam Dunn on 2014-11-28.
//  Copyright (c) 2014 Great Slave Helicopters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) Item *parent;
@property (nonatomic, retain) NSSet *children;

+ (instancetype)insertItemWithTitle:(NSString*)title
                             parent:(Item*)parent
             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

- (NSFetchedResultsController*)childrenFetchedResultsController;

@end
