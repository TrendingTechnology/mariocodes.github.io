---
layout: post
title: Liquibase
date:   2019-03-15 12:40:00 +0100
categories: programming tools liquibase
permalink: /notes/tools/liquibase
---

## Restart liquibase / database status
1. `mvn liquibase:clearCheckSums`
2. `mvn liquibase:dropAll` This will delete the whole DB
3. delete correct change entry from `DATABASECHANGELOCK`
4. update again
