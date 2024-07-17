#!/usr/bin/env sh

ls

# 정적 sitemap 생성
echo "정적 sitemap 생성중.."
node scripts/sitemap.js
echo "정적 sitemap 생성 완료!"

# abort on errors
set -e

# build
yarn build

