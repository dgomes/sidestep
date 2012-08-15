//
//  GrowlMessage.m
//  Sidestep
//
//  Created by Steve Warren on 11/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GrowlMessage.h"
#import <Growl/Growl.h>

@interface GrowlMessage ()
- (void)sendUserNotificationMessage:(NSString*)message;
@end

@implementation GrowlMessage


- (id)init {
	
	self = [super init];
	
    if (self != nil)
    {
		setting = [NSUserDefaults standardUserDefaults];    
	}
	
    return self;	
	
}

- (void)dealloc {
	
	[setting release];
	[super dealloc];
	
}

- (void) message: (NSString *)sendMessage {
	
	if([setting boolForKey:@"sidestep_GrowlSetting"] == TRUE) {
		[GrowlApplicationBridge notifyWithTitle: @"Sidestep"
								description: sendMessage
								notificationName:@"GrowlNotification"
								iconData: nil
								priority: 0
								isSticky: NO
								clickContext: nil];
	}
  
  if ([setting boolForKey:@"sidestep_UserNotificationSetting"] == TRUE)
  {
    [self sendUserNotificationMessage:sendMessage];
  }
}

- (void)sendUserNotificationMessage:(NSString*)message
{
#if defined(MAC_OS_X_VERSION_10_8) 
  NSUserNotification *notification = [[NSUserNotification alloc] init];
  [notification setTitle:@"Sidestep"];
  [notification setInformativeText:message];
  [notification setSoundName:NSUserNotificationDefaultSoundName];
      
  NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
  [center removeAllDeliveredNotifications];
  [center scheduleNotification:notification];
#endif
}
@end
