#!/bin/bash

show_stats() {
    local site=$1
    echo "==================================="
    echo "Stats for $site"
    echo "==================================="
    sudo zcat -f /var/log/nginx/access.log /var/log/nginx/access.log.* | grep "$site" | sudo goaccess - --log-format=COMBINED
}

echo "Which site do you want to view stats for?"
echo "1) eyesoffcr.org"
echo "2) dbsurplus.info"
echo "3) pepnotpepe.info"
echo "4) redditdev.cheesemonger.info"
echo "5) All sites"
echo "q) Quit"

read -p "Enter choice (1-5 or q): " choice

case $choice in
    1) show_stats "eyesoffcr.org" ;;
    2) show_stats "dbsurplus.info" ;;
    3) show_stats "pepnotpepe.info" ;;
    4) show_stats "redditdev.cheesemonger.info" ;;
    5) sudo zcat -f /var/log/nginx/access.log /var/log/nginx/access.log.* | sudo goaccess - --log-format=COMBINED ;;
    q) exit 0 ;;
    *) echo "Invalid choice" ;;
esac 