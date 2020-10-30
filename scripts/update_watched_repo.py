#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import subprocess

basedir = "~/bin"
watched_repos = ["emacs-application-framework",
                 "inherit-org",
                 "notdeft",
                 "org-clock-watch",
                 "snails"]

for repo in watched_repos:
    path = os.path.join(basedir, repo)
    cmd = "cd " + path + "&& git pull origin master"
    try:
        output = subprocess.check_output([cmd],  shell=True)
    except:
        pass
    finally:
        print(output)
