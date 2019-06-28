#!/bin/sh

export PATH=/opt/jdk1.8.0_181/bin:$PATH

PROJECT=Amlogic-ng ARCH=aarch64 make image
