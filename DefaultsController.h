//
//  DefaultsController.h
//  Sidestep
//
//  Created by Chetan Surpur on 11/18/10.
//  Copyright 2010 Chetan Surpur. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DefaultsController : NSObject {
	NSUserDefaults *defaults;
}

- (void)saveSSHConnectionPID :(int)pid;
- (int)getSSHConnectionPID;

- (NSString *)getServerUsername;

- (NSString *)getServerHostname;

- (void)setLocalPortNumber :(NSString *)port;
- (NSString *)getLocalPortNumber;

- (void)setAdditionalArguments :(NSString *)args;
- (NSString *)getAdditionalArguments;

- (void)setRemotePortNumber :(NSString *)port;
- (NSString *)getRemotePortNumber;

- (void)setCompressSSHConnection :(BOOL)value;
- (BOOL)getCompressSSHConnection;

- (void)setRanAtleastOnce :(BOOL)value;
- (BOOL)ranAtleastOnce;

- (void)setRerouteAutomatically :(BOOL)enabled;
- (BOOL)rerouteAutomaticallyEnabled;

- (void)setRunOnLogin :(BOOL)enabled;
- (BOOL)runOnLogin;

- (void)setGrowlSetting :(BOOL)value;
- (BOOL)getGrowlSetting;

- (void)setSelectedProxy:(NSString *)selection;
- (NSString *)selectedProxy;

- (void)setSelectedVPNService:(NSString *)selection;
- (NSString *)selectedVPNService;

- (void)setUserNotificationSetting :(BOOL)value;
- (BOOL)getUserNotificationSetting;

@end
