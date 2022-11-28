//
//  UIControlEvents+OCH.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/28.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "UIControlEvents+OCH.h"

NSString *NStringFromUIControlEvent(UIControlEvents event) {
    NSMutableString *eventsString = [NSMutableString new];
    if (event & UIControlEventTouchDown) {
        [eventsString appendString:@"\nUIControlEventTouchDown"] ;
    }
    else if (event & UIControlEventTouchDownRepeat) {
        [eventsString appendString:@"\nUIControlEventTouchDownRepeat"] ;
    }
    else if (event & UIControlEventTouchDragInside) {
        [eventsString appendString:@"\nUIControlEventTouchDragInside"] ;
    }
    else if (event & UIControlEventTouchDragOutside) {
        [eventsString appendString:@"\nUIControlEventTouchDragOutside"] ;
    }
    else if (event & UIControlEventTouchDragEnter) {
        [eventsString appendString:@"\nUIControlEventTouchDragEnter"] ;
    }
    else if (event & UIControlEventTouchDragExit) {
        [eventsString appendString:@"\nUIControlEventTouchDragExit"] ;
    }
    else if (event & UIControlEventTouchUpInside) {
        [eventsString appendString:@"\nUIControlEventTouchUpInside"] ;
    }
    else if (event & UIControlEventTouchUpOutside) {
        [eventsString appendString:@"\nUIControlEventTouchUpOutside"] ;
    }
    else if (event & UIControlEventTouchCancel) {
        [eventsString appendString:@"\nUIControlEventTouchCancel"] ;
    }
    else if (event & UIControlEventValueChanged) {
        [eventsString appendString:@"\nUIControlEventValueChanged"] ;
    }
    else if (event & UIControlEventPrimaryActionTriggered) {
        [eventsString appendString:@"\nUIControlEventPrimaryActionTriggered"] ;
    }
    else if (event & UIControlEventMenuActionTriggered) {
        [eventsString appendString:@"\nUIControlEventMenuActionTriggered"] ;
    }
    else if (event & UIControlEventEditingDidBegin) {
        [eventsString appendString:@"\nUIControlEventEditingDidBegin"] ;
    }
    else if (event & UIControlEventEditingChanged) {
        [eventsString appendString:@"\nUIControlEventEditingChanged"] ;
    }
    else if (event & UIControlEventEditingDidEnd) {
        [eventsString appendString:@"\nUIControlEventEditingDidEnd"] ;
    }
    else if (event & UIControlEventEditingDidEndOnExit) {
        [eventsString appendString:@"\nUIControlEventEditingDidEndOnExit"] ;
    }
    else if (event & UIControlEventAllTouchEvents) {
        [eventsString appendString:@"\nUIControlEventAllTouchEvents"] ;
    }
    else if (event & UIControlEventAllEditingEvents) {
        [eventsString appendString:@"\nUIControlEventAllEditingEvents"] ;
    }
    else if (event & UIControlEventApplicationReserved) {
        [eventsString appendString:@"\nUIControlEventApplicationReserved"] ;
    }
    else if (event & UIControlEventSystemReserved) {
        [eventsString appendString:@"\nUIControlEventSystemReserved"] ;
    }
    else if (event & UIControlEventAllEvents) {
        [eventsString appendString:@"\nUIControlEventAllEvents"] ;
    }
    else {
        
    }
    return eventsString;
}
