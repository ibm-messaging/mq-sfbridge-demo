#!/bin/bash
# © Copyright IBM Corporation 2018
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

/opt/mqm/java/jre64/jre/bin/java -Djava.library.path=/opt/mqm/java/lib64 -cp /opt/mqm/java/lib/jms.jar:/opt/mqm/mqsf/prereqs/JSON4J.jar:/opt/mqm/java/lib/com.ibm.mqjms.jar:/tmp/LoyaltyPoint.jar com.ibm.mq.samples.loyaltypointclient.MQLoyaltyPointAppClientSample QM 1414 DEV.APP.SVRCONN /sf/event/# /sf/mqtosfb/event/HighPointsThreshold__e
