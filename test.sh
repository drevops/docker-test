#!/bin/sh

set -e

echo -n "Variable from the base image is available in container"
echo $LAGOON_PROJECT | grep -q docker-test && echo " PASS" || ( echo " FAIL" && exit 1 )

echo -n "Variable from the base image is available in PHP"
php -r "print_r(getenv('LAGOON_PROJECT'));" | grep -q docker-test && echo " PASS" || ( echo " FAIL" && exit 1 )

echo -n "Custom env entrypoint file ran"
[ -d "/home/test" ] && echo " PASS" || ( echo " FAIL" && exit 1 )

echo -n "Variable from the current image is available in container"
echo $MYVAR | grep -q testvalue && echo " PASS" || ( echo " FAIL" && exit 1 )

echo -n "Variable from the current image is available in PHP"
php -r "print_r(getenv('MYVAR'));" | grep -q testvalue && echo " PASS" || ( echo " FAIL" && exit 1 )
