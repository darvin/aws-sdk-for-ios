/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AutoScalingDeleteTagsRequestMarshaller.h"

@implementation AutoScalingDeleteTagsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDeleteTagsRequest *)deleteTagsRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DeleteTags"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[deleteTagsRequest delegate]];
    [request setCredentials:[deleteTagsRequest credentials]];
    [request setEndpoint:[deleteTagsRequest requestEndpoint]];
    [request setRequestTag:[deleteTagsRequest requestTag]];


    if (deleteTagsRequest != nil) {
        int tagsListIndex = 1;
        for (AutoScalingTag *tagsListValue in deleteTagsRequest.tags) {
            if (tagsListValue != nil) {
                if (tagsListValue.resourceId != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", tagsListValue.resourceId] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Tags", tagsListIndex, @"ResourceId"]];
                }
            }
            if (tagsListValue != nil) {
                if (tagsListValue.resourceType != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", tagsListValue.resourceType] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Tags", tagsListIndex, @"ResourceType"]];
                }
            }
            if (tagsListValue != nil) {
                if (tagsListValue.key != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", tagsListValue.key] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Tags", tagsListIndex, @"Key"]];
                }
            }
            if (tagsListValue != nil) {
                if (tagsListValue.value != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", tagsListValue.value] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Tags", tagsListIndex, @"Value"]];
                }
            }
            if (tagsListValue != nil) {
                if (tagsListValue.propagateAtLaunchIsSet) {
                    [request setParameterValue:(tagsListValue.propagateAtLaunch ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Tags", tagsListIndex, @"PropagateAtLaunch"]];
                }
            }

            tagsListIndex++;
        }
    }


    return [request autorelease];
}

@end

