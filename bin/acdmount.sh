#!/bin/bash
env no_proxy='*' acd_cli -nl mount $1 1>/dev/null
