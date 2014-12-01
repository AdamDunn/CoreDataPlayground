//
//  Item.m
//  CoreDataPlayground
//
//  Created by Adam Dunn on 2014-11-28.
//  Copyright (c) 2014 Great Slave Helicopters. All rights reserved.
//

#import "Item.h"
#import "Item.h"


@implementation Item

@dynamic title;
@dynamic order;
@dynamic parent;
@dynamic children;

+ (instancetype)insertItemWithTitle:(NSString*)title
                             parent:(Item*)parent
             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    NSUInteger order = parent.numberOfChildren;
    Item* item = [NSEntityDescription insertNewObjectForEntityForName:self.entityName
                                               inManagedObjectContext:managedObjectContext];
    
    item.title = title;
    item.parent = parent;
    item.order = @(order);
    return item;
}

+ (NSString*)entityName
{
    return @"Item";
}

- (NSUInteger)numberOfChildren
{
    return self.children.count;
}

- (NSFetchedResultsController*)childrenFetchedResultsController
{
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:[self.class entityName]];
    request.predicate = [NSPredicate predicateWithFormat:@"parent = %@", self];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"order" ascending:YES]];
    return [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                               managedObjectContext:self.managedObjectContext
                                                 sectionNameKeyPath:nil
                                                          cacheName:nil];
}

@end
