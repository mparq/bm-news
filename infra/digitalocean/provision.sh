#!/bin/bash
doctl compute droplet create \
    --image ubuntu-24-10-x64 \
    --size s-1vcpu-2gb \
    --region nyc3 \
    --vpc-uuid 3a210705-6cbb-4899-91ae-826a8c86e115 \
    --enable-monitoring \
    --enable-ipv6 \
    bm-news-do
