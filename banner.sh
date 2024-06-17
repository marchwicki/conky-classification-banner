#!/bin/sh
sleep 10
conky -c .conkyrc_banner &
sleep 1
conky -c .conkyrc_transparent &
