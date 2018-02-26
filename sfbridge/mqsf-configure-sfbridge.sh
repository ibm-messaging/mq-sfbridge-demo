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

newConfigFile=/etc/mqm/sfb_template.cfg
touch newConfigFile
rm -f $newConfigFile

# The number of lines in input file are very important!
# Don't be tempted to delete blank lines.
/opt/mqm/bin/runmqsfb -o $newConfigFile << EOF
${runmqsfb_QueueManager:=}
${runmqsfb_MQBaseTopic:="/sf"}
${runmqsfb_MQChannel:="DEV.APP.SVRCONN"}
${runmqsfb_MQConname:="QM(${runmqsfb_ListenerPort:="1414"})"}
${runmqsfb_MQDLQname:="SYSTEM.SALESFORCE.ERRORQ"}
${runmqsfb_MQCCDTURL:=}
${runmqsfb_JndiClass:=}
${runmqsfb_JndiProvider:=}
${runmqsfb_MQUserName:="app"}
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
${runmqsfb_UseTLSforMQ:="N"}


${runmqsfb_PushTopics:=}
${runmqsfb_PlatformEvents:=}
${runmqsfb_MonitorInterval:="30"}
${runmqsfb_QoS:="Y"}
${runmqsfb_MQSubscribe:="Y"}
${runmqsfb_AppDataFormat:="Y"}
${runmqsfb_StartupWait:="0"}
${runmqsfb_RuntimeLogFile:="/tmp/sfb.log"}
EOF

# And now we can see the output
#cat $newConfigFile
