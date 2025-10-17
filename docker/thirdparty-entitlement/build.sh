#!/bin/bash
cp /Users/cnhaoyan/IdeaProjects/crm/loyalty/cce-crm-thirdparty-entitlement/thirdparty-entitlement-shell/target/*.jar ./app.jar
docker build -t thirdparty-entitlement .