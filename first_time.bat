@echo off
call npm install
call build
call make_dist
dude_install
