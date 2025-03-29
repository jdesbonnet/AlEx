#!/bin/bash

# Script to render indvidual joins for documentation

WIDTH=320
HEIGHT=200

openscad -o ./image/join_corner.png --export-format png --imgsize $WIDTH,$HEIGHT join_corner.scad

