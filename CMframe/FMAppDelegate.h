//
//  FMAppDelegate.h
//  CMframe
//
//  Created by rulong on 2/25/13.
//  Copyright (c) 2013 rulong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic,strong) UITabBarController *tabBarController;
@property (nonatomic,strong) UINavigationController *navigationController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
