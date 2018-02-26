#!/bin/bash

# (c) Copyright IBM Corporation 2015, 2018
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

templateConfigFile=/etc/mqm/sfb_template.cfg
newConfigFile=/etc/mqm/sfb.cfg
touch newConfigFile
rm -f $newConfigFile

# The number of lines in input file are very important!
# Don't be tempted to delete blank lines.
/opt/mqm/bin/runmqsfb -f $templateConfigFile -o $newConfigFile << EOF
${runmqsfb_QueueManager:=}
${runmqsfb_MQBaseTopic:=}
${runmqsfb_MQChannel:=}
${runmqsfb_MQConname:=}
${runmqsfb_MQDLQname:=}
${runmqsfb_MQCCDTURL:=}
${runmqsfb_JndiClass:=}
${runmqsfb_JndiProvider:=}
${runmqsfb_MQUserName:=}
${runmqsfb_MQPassword:=}
${runmqsfb_SFUserName:=}
${runmqsfb_SFPassword:=}
${runmqsfb_SFToken:=}
${runmqsfb_SFEndpoint:=}
${runmqsfb_SFConsumerKey:=}
${runmqsfb_SFConsumerSecret:=}
${runmqsfb_KeyStoreFileName:=}
${runmqsfb_KeyStorePassword:=}
${runmqsfb_TrustedStoreFileName:=}
${runmqsfb_TrustedStorePassword:=}
${runmqsfb_UseTLSforMQ:=}


${runmqsfb_PushTopics:=}
${runmqsfb_PlatformEvents:=}
${runmqsfb_MonitorInterval:=}
${runmqsfb_QoS:=}
${runmqsfb_MQSubscribe:=}
${runmqsfb_AppDataFormat:=}
${runmqsfb_StartupWait:=}
${runmqsfb_RuntimeLogFile:=}
EOF

export runmqsfb_DebugLevel=${runmqsfb_DebugLevel:=0}
# And now we can see the output
#cat $newConfigFile
echo Adding PushTopics $runmqsfb_PushTopics
echo Adding PlatformEvents $runmqsfb_PlatformEvents
/opt/mqm/bin/runmqsfb $runmqsfb_PushTopics $runmqsfb_PlatformEvents -d $runmqsfb_DebugLevel -f $newConfigFile
