# Time profiling
# See https://stackoverflow.com/a/20855353/1845976
#exec 3>&2 2> >(tee /tmp/sample-time.$$.log |
#                 sed -u 's/^.*$/now/' |
#                 date -f - +%s.%N >/tmp/sample-time.$$.tim)
#set -x
# When uncommenting also uncomment the set+x at the very end